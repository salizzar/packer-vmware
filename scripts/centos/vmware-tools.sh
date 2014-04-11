#! /usr/bin/env bash

yum install -y patch gcc gcc-c++ make

# mount
mkdir /mnt/vmware-tools

# copy from fusion host
mount /dev/cdrom0 /mnt/vmware-tools

ls -lha /media

mkdir -p /tmp/vmfusion/{pkg,patches/vmhgfs}
cp /media/*.tar.gz /tmp/vmfusion/pkg
tar xzf /tmp/vmfusion/pkg/*.tar.gz -C /tmp/vmfusion

umount /mnt/vmware-tools

# download vmhgfs patch
curl --output /tmp/vmfusion/patches/vmhgfs.zip https://communities.vmware.com/servlet/JiveServlet/download/2350918-118891/patch_vmhgfs-vmwaretools-9.6.1.zip
unzip -o /tmp/vmfusion/patches/vmhgfs.zip -d /tmp/vmfusion/patches

tar xvf /tmp/vmfusion/vmware-tools-distrib/lib/modules/source/vmhgfs.tar -C /tmp/vmfusion/vmware-tools-distrib/lib/modules/source/

# apply patch
cd vmhgfs-only
patch < /tmp/vmfusion/patches/patch_vmhgfs-vmwaretools-9.6.1
cd ..

# replace package tar
tar cvf vmhgfs.tar vmhgfs-only
rm -rf vmhgfs-only

# install
/tmp/vmfusion/vmware-tools-distrib/vmware-install.pl --default

reboot

