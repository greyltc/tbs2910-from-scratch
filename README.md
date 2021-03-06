tbs2910-from-scratch
===============

Everything you need under one roof to get Debian Sid, and a bleeding edge kernel and u-boot running on your TBS2910 single board computer (I own v1.3 of the hardware so I can't test anything else):  
1. [Wiki containing instructions](https://github.com/l3iggs/tbs2910-from-scratch/wiki)  
2. [u-boot patch](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/u-boot.patch)   
3. [Kernel config fragment](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/matrix.cfg) and [patch](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/linux.patch)  
4. [Debian bootstrap script](https://raw.githubusercontent.com/l3iggs/tbs2910-from-scratch/master/fsBootstrap.sh)

I'm posting this "weekend project" because I like the product. I like it because it's relatively inexpensive, low power, decent hardware that seems to have some non-zero community support (especially for Freescale's saber* dev boards which this is similar to) and it's semi-open source (the schematic and some software is released. TBS, please release the BOM and all hardware design files). Also, I hate using software that is months/years out of date.

Every once in a great while I might [post binary release packages](https://github.com/l3iggs/tbs2910-from-scratch/releases) containing u-boot.imx, zImage and imx6q-sabresd.dtb  
### Files in this project
---
- **u-boot.patch**
 - Patch containing changes to u-boot sources
- **linux.patch**
 - Patch containing changes to the Linux kernel sources
- **matrix.cfg**
 - This is a kernel configuration fragment that should be applied on top of the default linux configuration
- **fsBootstrap.sh**
 - This shell script completes the Debian file system bootstraping and makes the device usable.

### Usage
---
Read the wiki: https://github.com/l3iggs/tbs2910-from-scratch/wiki

### Noteworthy things that work
---
- 2015 MB of RAM
- Full Duplex 10/100/1000 Ethernet
- 4 CPUs at 996 MHz each
 - With ondemand frequency scaling
- Booting to Linux from SD Card ([image released](https://github.com/l3iggs/tbs2910-from-scratch/releases/tag/v0.3))
 - Kernel loaded from ext4 partition 
 - with F2FS root partition
- Booting to Linux from the network
 - kernel image loaded via TFTP
 - rootfs accessed via NFS
- Booting to linux from the eMMC
 - with F2FS root partition
- GPIO
 - Blue LED control
 - digital (on/off) fan control
 - GPIO Volume buttons (presses register)
 - GPIO Power button (presses register)
- WiFi
 - The driver crashes on initial connect with no appairent consiquences
 - I measured 5.8MB/sec sustained transfer
- HDMI video output
 - Text console works fine, 1920x1200 @ 25Hz
- SATA port
 - Port multiplier functionality working
 - 3 Gbit/s link negotiation observed

### Noteworthy things that probably/definately don't currently work
---
- The Mini PCI Express slot
- On board thermal sensor(s)
 - Temperature controlled fan speed
- Any sort of GPU acceleration
- Any sort of audio output
  - HDMI audio out
  - SPDIF audio out
  - Analog audio out

### Untested things that are also probably broken 
---
- IRDA port
- USB on-the-go
