#! /usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
export APT_LISTCHANGES_FRONTEND=noninteractive

apt-get update > /dev/null

kernel_version=`apt-cache search linux-image-* | egrep 'linux-image-[0-9]' | awk '{ print $1 }' | grep -v '\-dbg' | sort -V | tail -n1 | awk -F '-' '{ print $3 FS $4 FS $5 }'`
apt-get install --yes --force-yes linux-image-$kernel_version linux-headers-$kernel_version

reboot
