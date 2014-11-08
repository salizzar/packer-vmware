#! /usr/bin/env bash

PACKER_VER=`curl -s https://www.packer.io/downloads.html | grep 'Latest version' | egrep -o '[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}'`
PACKER_PKG="${PACKER_VER}_linux_amd64.zip"
PACKER_URL="https://dl.bintray.com/mitchellh/packer/packer_$PACKER_PKG"
PACKER_TMP="/tmp/$PACKER_PKG"
PACKER_DIR="/usr/local/bin"

curl --location --output $PACKER_TMP $PACKER_URL

unzip -v -o $PACKER_TMP -d $PACKER_DIR

