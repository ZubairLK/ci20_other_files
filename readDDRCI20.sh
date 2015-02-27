#!/bin/bash

BASE=0x10000000
DDRC_BASE=$((BASE + 0x3010000))
CPM_BASE=$BASE
CPM_DDCDR=$((CPM_BASE + 0x2c))      #DDR CLOCK Divider register

#Clock register in CGU
temp=`./devmem $CPM_DDCDR`
echo "$temp                   CPM_DDCDR"


DDR_MEM_PHY_BASE=0x20000000
DDR_PHY_OFFSET=0x1000

DDRC_ST=$((DDRC_BASE + 0x0))        	#DDR Status Register
DDRC_CFG=$((DDRC_BASE + 0x4))       	#DDR Config Register
DDRC_CTRL=$((DDRC_BASE + 0x8))    	#DDR Control Register
DDRC_LMR=$((DDRC_BASE + 0xc))     	#DDR Load-Mode-Register */
DDRC_REFCNT=$((DDRC_BASE + 0x18)) 	#DDR Auto-Refresh Counter */
DDRC_DQS=$((DDRC_BASE + 0x1c))    	#DDR DQS Delay Control Register */
DDRC_DQS_ADJ=$((DDRC_BASE + 0x20))	#DDR DQS Delay Adjust Register */
DDRC_MMAP0=$((DDRC_BASE + 0x24))		#DDR Memory Map Config Register */
DDRC_MMAP1=$((DDRC_BASE + 0x28)) 		#DDR Memory Map Config Register */
DDRC_MDELAY=$((DDRC_BASE + 0x2c)) 	#DDR Memory Map Config Register */
DDRC_CKEL=$((DDRC_BASE + 0x30)) 		#DDR CKE Low if it was set to 0 */
DDRC_PMEMCTRL0=$((DDRC_BASE + 0x54))
DDRC_PMEMCTRL1=$((DDRC_BASE + 0x50))
DDRC_PMEMCTRL2=$((DDRC_BASE + 0x58))
DDRC_PMEMCTRL3=$((DDRC_BASE + 0x5c))
DDRC_TIMING1=$((DDRC_BASE + 0x60 + 4 * (1 - 1))) #/* DDR Timing Config Register 1-5 */
DDRC_REMMAP1=$((DDRC_BASE + 0x9c + 4 * (1 - 1))) #/* DDR Address Remapping Register 1-5 */
DDRC_TIMING2=$((DDRC_BASE + 0x60 + 4 * (2 - 1))) #/* DDR Timing Config Register 1-5 */
DDRC_REMMAP2=$((DDRC_BASE + 0x9c + 4 * (2 - 1))) #/* DDR Address Remapping Register 1-5 */
DDRC_TIMING3=$((DDRC_BASE + 0x60 + 4 * (3 - 1))) #/* DDR Timing Config Register 1-5 */
DDRC_REMMAP3=$((DDRC_BASE + 0x9c + 4 * (3 - 1))) #/* DDR Address Remapping Register 1-5 */
DDRC_TIMING4=$((DDRC_BASE + 0x60 + 4 * (4 - 1))) #/* DDR Timing Config Register 1-5 */
DDRC_REMMAP4=$((DDRC_BASE + 0x9c + 4 * (4 - 1))) #/* DDR Address Remapping Register 1-5 */
DDRC_TIMING5=$((DDRC_BASE + 0x60 + 4 * (5 - 1))) #/* DDR Timing Config Register 1-5 */
DDRC_REMMAP5=$((DDRC_BASE + 0x9c + 4 * (5 - 1))) #/* DDR Address Remapping Register 1-5 */

#DDR Controller Registers

temp=`./devmem $DDRC_BASE`
echo "$temp                   DDRC_BASE"

temp=`./devmem $DDRC_ST`
echo "$temp                   DDRC_ST"

temp=`./devmem $DDRC_CFG`
echo "$temp                   DDRC_CFG"

temp=`./devmem $DDRC_CTRL`
echo "$temp                   DDRC_CTRL"

temp=`./devmem $DDRC_LMR`
echo "$temp                   DDRC_LMR"

temp=`./devmem $DDRC_REFCNT`
echo "$temp                   DDRC_REFCNT"

temp=`./devmem $DDRC_DQS`
echo "$temp                   DDRC_DQS"

temp=`./devmem $DDRC_DQS_ADJ`
echo "$temp                   DDRC_DQS_ADJ"

temp=`./devmem $DDRC_MMAP0`
echo "$temp                   DDRC_MMAP0"

temp=`./devmem $DDRC_MMAP1`
echo "$temp                   DDRC_MMAP1"


temp=`./devmem $DDRC_MDELAY`
echo "$temp                   DDRC_MDELAY"

temp=`./devmem $DDRC_CKEL`
echo "$temp                   DDRC_CKEL"

temp=`./devmem $DDRC_PMEMCTRL0`
echo "$temp                   DDRC_PMEMCTRL0"

temp=`./devmem $DDRC_PMEMCTRL1`
echo "$temp                   DDRC_PMEMCTRL1"

temp=`./devmem $DDRC_PMEMCTRL2`
echo "$temp                   DDRC_PMEMCTRL2"

temp=`./devmem $DDRC_PMEMCTRL3`
echo "$temp                   DDRC_PMEMCTRL3"

temp=`./devmem $DDRC_TIMING1`
echo "$temp                   DDRC_TIMING1"

temp=`./devmem $DDRC_REMMAP1`
echo "$temp                   DDRC_REMMAP1"

temp=`./devmem $DDRC_TIMING2`
echo "$temp                   DDRC_TIMING2"

temp=`./devmem $DDRC_REMMAP2`
echo "$temp                   DDRC_REMMAP2"

temp=`./devmem $DDRC_TIMING3`
echo "$temp                   DDRC_TIMING3"

temp=`./devmem $DDRC_REMMAP3`
echo "$temp                   DDRC_REMMAP3"

temp=`./devmem $DDRC_TIMING4`
echo "$temp                   DDRC_TIMING4"

temp=`./devmem $DDRC_REMMAP4`
echo "$temp                   DDRC_REMMAP4"

temp=`./devmem $DDRC_TIMING5`
echo "$temp                   DDRC_TIMING5"

temp=`./devmem $DDRC_REMMAP5`
echo "$temp                   DDRC_REMMAP5"

#DDR PHY Registers

DDRP_PIR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x4)) # PHY Initialization Register */

temp=`./devmem $DDRP_PIR`
echo "$temp                   DDRP_PIR"

DDRP_PGCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x8)) # PHY General Configuration Register*/
temp=`./devmem $DDRP_PGCR`
echo "$temp                   DDRP_PGCR"

DDRP_PGSR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xc)) # PHY General Status Register*/
temp=`./devmem $DDRP_PGSR`
echo "$temp                   DDRP_PGSR"

DDRP_PTR0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x18)) # PHY Timing Register 0 */
temp=`./devmem $DDRP_PTR0`
echo "$temp                   DDRP_PTR0"

DDRP_PTR1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c)) # PHY Timing Register 1 */
temp=`./devmem $DDRP_PTR1`
echo "$temp                   DDRP_PTR1"

DDRP_PTR2=$((DDRC_BASE + DDR_PHY_OFFSET + 0x20)) # PHY Timing Register 2 */
temp=`./devmem $DDRP_PTR2`
echo "$temp                   DDRP_PTR2"

DDRP_ACIOCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x24)) # AC I/O Configuration Register */
temp=`./devmem $DDRP_ACIOCR`
echo "$temp                   DDRP_ACIOCR"

DDRP_DXCCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x28)) # DATX8 Common Configuration Register */
temp=`./devmem $DDRP_DXCCR`
echo "$temp                   DDRP_DXCCR"

DDRP_DSGCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x2c)) # DDR System General Configuration Register */
temp=`./devmem $DDRP_DSGCR`
echo "$temp                   DDRP_DSGCR"

DDRP_DCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x30)) # DRAM Configuration Register*/
temp=`./devmem $DDRP_DCR`
echo "$temp                   DDRP_DCR"

DDRP_DTPR0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x34)) # DRAM Timing Parameters Register 0 */
temp=`./devmem $DDRP_DTPR0`
echo "$temp                   DDRP_DTPR0"

DDRP_DTPR1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x38)) # DRAM Timing Parameters Register 1 */
temp=`./devmem $DDRP_DTPR1`
echo "$temp                   DDRP_DTPR1"

DDRP_DTPR2=$((DDRC_BASE + DDR_PHY_OFFSET + 0x3c)) # DRAM Timing Parameters Register 2 */
temp=`./devmem $DDRP_DTPR2`
echo "$temp                   DDRP_DTPR2"

DDRP_MR0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x40)) # Mode Register 0 */
temp=`./devmem $DDRP_MR0`
echo "$temp                   DDRP_MR0"

DDRP_MR1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x44)) # Mode Register 1 */
temp=`./devmem $DDRP_MR1`
echo "$temp                   DDRP_MR1"

DDRP_MR2=$((DDRC_BASE + DDR_PHY_OFFSET + 0x48)) # Mode Register 2 */
temp=`./devmem $DDRP_MR2`
echo "$temp                   DDRP_MR2"

DDRP_MR3=$((DDRC_BASE + DDR_PHY_OFFSET + 0x4c)) # Mode Register 3 */
temp=`./devmem $DDRP_MR3`
echo "$temp                   DDRP_MR3"

DDRP_ODTCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x50)) # ODT Configure Register */
temp=`./devmem $DDRP_ODTCR`
echo "$temp                   DDRP_ODTCR"

DDRP_DTAR=$((DDRC_BASE + DDR_PHY_OFFSET + 0x54)) # Data Training Address Register */
temp=`./devmem $DDRP_DTAR`
echo "$temp                   DDRP_DTAR"

DDRP_DTDR0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x58)) # Data Training Data Register 0 */
temp=`./devmem $DDRP_DTDR0`
echo "$temp                   DDRP_DTDR0"

DDRP_DTDR1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x5c)) # Data Training Data Register 1 */
temp=`./devmem $DDRP_DTDR1`
echo "$temp                   DDRP_DTDR1"

DDRP_DCUAR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xc0)) # DCU Address Register */
temp=`./devmem $DDRP_DCUAR`
echo "$temp                   DDRP_DCUAR"

DDRP_DCUDR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xc4)) # DCU Data Register */
temp=`./devmem $DDRP_DCUDR`
echo "$temp                   DDRP_DCUDR"

DDRP_DCURR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xc8)) # DCU Run Register */
temp=`./devmem $DDRP_DCURR`
echo "$temp                   DDRP_DCURR"

DDRP_DCULR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xcc)) # DCU Loop Register */
temp=`./devmem $DDRP_DCULR`
echo "$temp                   DDRP_DCULR"

DDRP_DCUGCR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xd0)) # DCU Gerneral Configuration Register */
temp=`./devmem $DDRP_DCUGCR`
echo "$temp                   DDRP_DCUGCR"

DDRP_DCUTPR=$((DDRC_BASE + DDR_PHY_OFFSET + 0xd4)) # DCU Timing Parameters Register */
temp=`./devmem $DDRP_DCUTPR`
echo "$temp                   DDRP_DCUTPR"

DDRP_DCUSR0=$((DDRC_BASE + DDR_PHY_OFFSET + 0xd8)) # DCU Status Register 0 */
temp=`./devmem $DDRP_DCUSR0`
echo "$temp                   DDRP_DCUSR0"

DDRP_DCUSR1=$((DDRC_BASE + DDR_PHY_OFFSET + 0xdc)) # DCU Status Register 1 */
temp=`./devmem $DDRP_DCUSR1`
echo "$temp                   DDRP_DCUSR1"

#DDRP_ZQXCR0(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x180 + n * 0x10)) # ZQ impedance Control Register 0 */
#DDRP_ZQXCR1(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x184 + n * 0x10)) # ZQ impedance Control Register 1 */
#DDRP_ZQXSR0(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x188 + n * 0x10)) # ZQ impedance Status Register 0 */
#DDRP_ZQXSR1(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x18c + n * 0x10)) # ZQ impedance Status Register 1 */
#DDRP_DXGCR(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x1c0 + n * 0x40)) # DATX8 n General Configuration Register */
#DDRP_DXGSR0(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x1c4 + n * 0x40)) # DATX8 n General Status Register */
#DDRP_DXGSR1(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x1c8 + n * 0x40)) # DATX8 n General Status Register */
#DDRP_DXDQSTR(n) (DDRC_BASE + DDR_PHY_OFFSET + 0x1d4 + n * 0x40)) # DATX8 n DQS Timing Register */

DDRP_ZQXCR0_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x180 + 0 * 0x10)) # ZQ impedance Control Register 0 */
temp=`./devmem $DDRP_ZQXCR0_0`
echo "$temp                   DDRP_ZQXCR0_0"

DDRP_ZQXCR1_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x184 + 0 * 0x10)) # ZQ impedance Control Register 1 */
temp=`./devmem $DDRP_ZQXCR1_0`
echo "$temp                   DDRP_ZQXCR1_0"

DDRP_ZQXSR0_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x188 + 0 * 0x10)) # ZQ impedance Status Register 0 */
temp=`./devmem $DDRP_ZQXSR0_0`
echo "$temp                   DDRP_ZQXSR0_0"

DDRP_ZQXSR1_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x18c + 0 * 0x10)) # ZQ impedance Status Register 1 */
temp=`./devmem $DDRP_ZQXSR1_0`
echo "$temp                   DDRP_ZQXSR1_0"

DDRP_DXGCR_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c0 + 0 * 0x40)) # DATX8 n General Configuration Register */
temp=`./devmem $DDRP_DXGCR_0`
echo "$temp                   DDRP_DXGCR_0"

DDRP_DXGSR0_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c4 + 0 * 0x40)) # DATX8 n General Status Register */
temp=`./devmem $DDRP_DXGSR0_0`
echo "$temp                   DDRP_DXGSR0_0"

DDRP_DXGSR1_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c8 + 0 * 0x40)) # DATX8 n General Status Register */
temp=`./devmem $DDRP_DXGSR1_0`
echo "$temp                   DDRP_DXGSR1_0"

DDRP_DXDQSTR_0=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1d4 + 0 * 0x40)) # DATX8 n DQS Timing Register */
temp=`./devmem $DDRP_DXDQSTR_0`
echo "$temp                   DDRP_DXDQSTR_0"

DDRP_ZQXCR0_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x180 + 1 * 0x10)) # ZQ impedance Control Register 0 */
temp=`./devmem $DDRP_ZQXCR0_1`
echo "$temp                   DDRP_ZQXCR0_1"

DDRP_ZQXCR1_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x184 + 1 * 0x10)) # ZQ impedance Control Register 1 */
temp=`./devmem $DDRP_ZQXCR1_1`
echo "$temp                   DDRP_ZQXCR1_1"

DDRP_ZQXSR0_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x188 + 1 * 0x10)) # ZQ impedance Status Register 0 */
temp=`./devmem $DDRP_ZQXSR0_1`
echo "$temp                   DDRP_ZQXSR0_1"

DDRP_ZQXSR1_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x18c + 1 * 0x10)) # ZQ impedance Status Register 1 */
temp=`./devmem $DDRP_ZQXSR1_1`
echo "$temp                   DDRP_ZQXSR1_1"

DDRP_DXGCR_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c0 + 1 * 0x40)) # DATX8 n General Configuration Register */
temp=`./devmem $DDRP_DXGCR_1`
echo "$temp                   DDRP_DXGCR_1"

DDRP_DXGSR0_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c4 + 1 * 0x40)) # DATX8 n General Status Register */
temp=`./devmem $DDRP_DXGSR0_1`
echo "$temp                   DDRP_DXGSR0_1"

DDRP_DXGSR1_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1c8 + 1 * 0x40)) # DATX8 n General Status Register */
temp=`./devmem $DDRP_DXGSR1_1`
echo "$temp                   DDRP_DXGSR1_1"

DDRP_DXDQSTR_1=$((DDRC_BASE + DDR_PHY_OFFSET + 0x1d4 + 1 * 0x40)) # DATX8 n DQS Timing Register */
temp=`./devmem $DDRP_DXDQSTR_1`
echo "$temp                   DDRP_DXDQSTR_1"

echo "Some bit masks for PHY in https://github.com/MIPS/CI20_u-boot/blob/ci20-v2013.10/arch/mips/include/asm/arch-jz4780/jz4780.h"
