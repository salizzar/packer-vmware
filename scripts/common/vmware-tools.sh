#! /usr/bin/env bash

VMWARE_TOOLS_ISO=/root/linux.iso
VMWARE_TOOLS_DIR=/mnt
VMWARE_TOOLS_TMP=/tmp/vmfusion

# mount, copy tar and umount
mount -t iso9660 -o loop $VMWARE_TOOLS_ISO $VMWARE_TOOLS_DIR

mkdir -p $VMWARE_TOOLS_TMP/pkg ; cp -v $VMWARE_TOOLS_DIR/*.tar.gz $VMWARE_TOOLS_TMP/pkg

umount $VMWARE_TOOLS_DIR

# uncompress package
tar xzf $VMWARE_TOOLS_TMP/pkg/*.tar.gz -C $VMWARE_TOOLS_TMP

#
# patch not working :(
#

# mkdir -p $VMWARE_TOOLS_TMP/patches/vmhgfs
#tar xvf $VMWARE_TOOLS_TMP/vmware-tools-distrib/lib/modules/source/vmhgfs.tar -C $VMWARE_TOOLS_TMP/vmware-tools-distrib/lib/modules/source/

## download vmhgfs patch
#VMWARE_TOOLS_PATCH_URL=https://communities.vmware.com/servlet/JiveServlet/download/2350918-118891/patch_vmhgfs-vmwaretools-9.6.1.zip

#curl --output $VMWARE_TOOLS_TMP/patches/vmhgfs.zip $VMWARE_TOOLS_PATCH_URL
#unzip -v $VMWARE_TOOLS_TMP/patches/vmhgfs.zip -d $VMWARE_TOOLS_TMP/patches
#
## apply patch
#cd $VMWARE_TOOLS_TMP/vmware-tools-distrib/lib/modules/source/vmhgfs-only
#patch < $VMWARE_TOOLS_TMP/patches/patch_vmhgfs-vmwaretools-9.6.1

# replace package tar
#cd $VMWARE_TOOLS_TMP/vmware-tools-distrib/lib/modules/source
#tar cvf vmhgfs.tar vmhgfs-only
#rm -rf vmhgfs-only

# install
$VMWARE_TOOLS_TMP/vmware-tools-distrib/vmware-install.pl --default

reboot

