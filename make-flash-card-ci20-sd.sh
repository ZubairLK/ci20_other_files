#!/bin/bash
#
# Copyright (c) 2013 Imagination Technologies
# Author: Paul Burton <paul.burton@imgtec.com>
#
# Creates an SD card which writes u-boot, a linux kernel & root filesystem to
# the CI20 NAND flash.
#
# Usage:
#   ./make-flash-card.sh /dev/sdX /path/to/vmlinux /path/to/rootfs.tar.xz
#   the path to vmlinux can be uImage as well.
#   Please use full paths while passing arguments. i.e. /home/user/ci20/linux/kernel
#   instead of just kernel or ../../kernel. Even if in the same directory


set -e
tmpDir=`mktemp -d`

cleanup()
{
  echo "Cleaning up..."
  [ -z "${sdMount}" ] || sudo umount ${sdMount}
  sync; sync; sync
  rm -rf ${tmpDir}
  trap - EXIT INT TERM
}
trap cleanup EXIT INT TERM

die()
{
  echo "$@" >&2
  exit 1
}

# check device
device="$1"
[ -e "${device}" ] || die "Device '${device}' not found"
grep ${device} /etc/mtab >/dev/null && \
  die "Device '${device}' contains mounted partitions"

# check kernel
vmlinux="$2"
[ -e "${vmlinux}" ] || die "Kernel (vmlinux) '${vmlinux}' not found"

# check root filesystem
rootTar="$3"
[ -e "${rootTar}" ] || die "Root filesystem tarball '${rootTar}' not found"

# default environment
[ ! -z "${CROSS_COMPILE}" ] || export CROSS_COMPILE=mips-linux-gnu-
[ ! -z "${UBOOT_REPO}" ] || UBOOT_REPO="https://github.com/MIPS/CI20_u-boot"
[ ! -z "${UBOOT_BRANCH}" ] || UBOOT_BRANCH="ci20-v2013.10"

if [ -z "${JOBS}" ]; then
  cpuCount=`grep -Ec '^processor' /proc/cpuinfo`
  JOBS=`echo "${cpuCount} * 2" | bc`
fi

# check for tools
which bc >/dev/null || die "No bc in \$PATH"
which fakeroot >/dev/null || die "No fakeroot in \$PATH"
which sfdisk >/dev/null || die "No sfdisk in \$PATH"
which mkfs.ext3 >/dev/null || die "No mkfs.ext3 in \$PATH"
which mkfs.ubifs >/dev/null || die "No mkfs.ubifs in \$PATH"
${CROSS_COMPILE}gcc --version >/dev/null 2>&1 || \
  die "No ${CROSS_COMPILE}gcc, set \$CROSS_COMPILE"
${CROSS_COMPILE}objcopy --version >/dev/null 2>&1 || \
  die "No ${CROSS_COMPILE}objcopy, set \$CROSS_COMPILE"

# partition SD/MMC card
sudo sfdisk ${device} -uM -L << EOF
2,,L
EOF

# Deleting old uboot environment
dd if=/dev/zero of=${device} bs=1K seek=526 count=32

# create ext3 partition
sudo mkfs.ext4 ${device}1

# mount ext3 partition
sdMount=${tmpDir}/sd_mount
mkdir ${sdMount}
sudo mount ${device}1 ${sdMount}

# clone u-boot
ubootDir=$tmpDir/u-boot
git clone ${UBOOT_REPO} -b ${UBOOT_BRANCH} --depth 1 $ubootDir

# build & install MMC u-boot
pushd $ubootDir
  make distclean
  make ARCH=mips ci20_mmc
#  make -j${JOBS}
  sudo dd if=spl/u-boot-spl.bin of=${device} obs=512 seek=1
  sudo dd if=u-boot.img of=${device} obs=1K seek=14
popd

echo "Untarring rootfs into sd card"
sudo tar -xaf ${rootTar} -C ${sdMount}

if file "${vmlinux}" | grep uImage >/dev/null; then
  # already a uImage
	if [!-d "${sdMount}/boot"]; then
	    mkdir -p "${sdMount}/boot";
	fi;

	sudo cp -v "${vmlinux}" ${sdMount}/boot/vmlinux.img
else
  # generate kernel uImage
  vmlinuxBin=${tmpDir}/vmlinux.bin
  ${CROSS_COMPILE}objcopy -O binary ${vmlinux} ${vmlinuxBin}
  ${ubootDir}/tools/mkimage \
    -A mips -O linux -T kernel -C none -a 0x80010000 \
    -e `readelf -h ${vmlinux} | grep 'Entry point' | awk '{print $4}'` \
    -n "CI20 Linux" -d ${vmlinuxBin} ${sdMount}/boot/vmlinux.img
fi

echo "SD contents:"
ls -hl ${sdMount}/

echo "Finished, wait for clean up before removing your card!"
sync
