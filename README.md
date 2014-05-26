tbs2910-from-scratch
===============

Everything you need under one roof to get Debian Sid, and a bleeding edge kernel and u-boot running on your TBS2910 single board computer:  
1. [Wiki containing instructions](https://github.com/l3iggs/tbs2910-from-scratch/wiki)  
2. [u-boot patch](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/u-boot.patch)   
3. [Kernel config](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/linuxConfig.patch) and [code patches](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/linux.patch)  
4. [Debian bootstrap script](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/fsBootstrap.sh)

I'm posting this "weekend project" because I like the product. I like it because it's relatively inexpensive, low power, decent hardware that seems to have some non-zero community support (especially for Freescale's saber* dev boards which this is similar to) and it's semi-open source (the schematic and some software is released. TBS, please release the BOM and all hardware design files). Also, I hate using software that is months/years out of date.

Every once in a great while I might [post binary release packages](https://github.com/l3iggs/tbs2910-from-scratch/releases) containing u-boot.imx, zImage and imx6q-sabresd.dtb  
### Files in this project
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
- **fsBootstrap.sh**
 - This shell script completes the Debian file system bootstraping and makes the device usable.

### Usage
---
Read the wiki: https://github.com/l3iggs/tbs2910-from-scratch/wiki

### Noteworthy things that work
---
- 2GiB of DRAM
- Booting completely from network in u-boot
- Full Duplex 10/100/1000 Ethernet
- 4 Cores of the CPU
 - Operating frequency untested

### Noteworthy things that probably/definately don't work
---
- Built in WiFi
- The fan
- The mini-pci port
- eMMC access in Linux
- SD card access in Linux
- Volume buttons
- Any sort of video output
- Any sort of GPU acceleration
- Any sort of audio output
  - HDMI audio out
  - SPDIF audio out
  - Analog audio out

### Untested things that are also probably broken 
---
- GPIO
- IRDA port
- On board temperature sensor(s)
- CPU Frequency scaling/power saving modes
- USB in linux
  - USB on-the-go
