tbs2910-from-scratch
===============

Everything you need to get Debian Sid, and a bleeding edge kernel and u-boot running on your TBS2910 single board computer:  
1. [Wiki containing instructions](https://github.com/l3iggs/tbs2910-from-scratch/wiki)  
2. u-boot patches  
3. Kernel config and code patches  

### Files here
---
- **u-boot.patch**
 - apply this patch to the latest vanilla version of the u-boot source tree to get a u-boot binary supporting 2GiB SDRAM and networking
 - tested on u-boot U-Boot version 2014.07-rc1-00333-g9665fa8 (the latest as of 2014-05-25)
- **linux.patch**
 - apply this patch to the latest stable kernel source tree to get a functional linux kernel
 - tested on kernel tag v3.14.4
- **linuxConfig.patch**
 - This patch applies to arch/arm/configs/imx_v6_v7_defconfig to enable some features of the TBS2910
 - tested on kernel tag v3.14.4 

### Usage
---
Read the wiki: https://github.com/l3iggs/tbs2910-from-scratch/wiki
