tbs2910-patches
===============

Linux kernel and u-boot patches for the TBS2910 Matrix single board computer


### Files here
---
- **u-boot.patch**
 - apply this patch to the latest vanilla version of u-boot source tree to get a u-boot binary supporting 2GiB SDRAM and networking
 - tested on commit 4d16f67e7ba1a69929b55852f1a274c457a0db27
- **linux.patch**
 - apply this patch to the latest stable kernel source tree to get a functional linux kernel
 - tested on tag v3.14.4 

### u-boot patch and build how to
---
Step 1: Setup your cross compiler. Before you begin you should know your crosscomiler prefix and its build tool path.
```
git clone git://git.denx.de/u-boot.git
cd u-boot
wget 
git apply u-boot.patch
export ARCH=arm
export CROSS_COMPILE=$YOUR_CROSSCOMPILER_PREFIX
export PATH="$YOUR_CROSS_COMPILER_PATH:${PATH}"
make clean
make mrproper
make mx6qsabresd_config
make
```
Now you have your u-boot binaries in .

### linux kernal patch and build how to
---
Step 1: Setup your cross compiler. Before you begin you should know your crosscomiler prefix and its build tool path.
```
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
wget
git apply linux.patch
export ARCH=arm
export CROSS_COMPILE=$YOUR_CROSSCOMPILER_PREFIX
export PATH="$YOUR_CROSS_COMPILER_PATH:${PATH}"
make distclean
make mrproper
make imx_v6_v7_defconfig
make zImage
make dtbs
```
Now you have zImage and imx6q-sabresd.dtb in ./arch/arm/boot/
