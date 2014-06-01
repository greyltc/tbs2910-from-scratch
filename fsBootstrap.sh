#!/bin/sh

echo "Bootstrapping..."
#debootstrap second stage (extracts and sets up all installed packages)
/debootstrap/debootstrap --second-stage --verbose
echo "Second stage done"

#networking stuff
cat  > /etc/network/interfaces.d/eth0 <<END
auto eth0
allow-hotplug eth0
iface eth0 inet dhcp
iface eth0 inet6 auto
END

cat > /etc/hosts << END
127.0.0.1 localhost

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts
END

echo matrix > /etc/hostname

#allows shell login via matrix UART port
echo 'T0:2345:respawn:/sbin/getty -L ttymxc0 115200 linux' >> /etc/inittab
#sed -i 's/^\([1-6]:.* tty[1-6]\)/#\1/' /etc/inittab

#setup some local specific things
dpkg-reconfigure locales
dpkg-reconfigure tzdata

#for boot partition
cat > /etc/fstab << END
/dev/disk/by-label/ext4boot /boot               ext4    errors=remount-ro 0       2
END


#for software updates
cat > /etc/apt/sources.list << END
deb http://http.debian.net/debian sid main contrib non-free
deb-src http://http.debian.net/debian sid main contrib non-free
END

echo "Choose root password:"
passwd

rm /sbin/init
mv /sbin/init.bak /sbin/init

echo "Setup complete! Rebooting..."

reboot -f
