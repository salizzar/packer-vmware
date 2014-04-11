#! /usr/bin/env bash

yum remove -y kernel-headers kernel-devel

yum install -y http://www.elrepo.org/elrepo-release-6-5.el6.elrepo.noarch.rpm

yum --enablerepo=elrepo-kernel install -y kernel-ml kernel-ml-devel kernel-ml-headers

# set default kernel
mv /boot/grub/grub{,.orig}.conf
sed s/default=1/default=0/g /boot/grub/grub.orig.conf > /boot/grub/grub.conf

reboot

