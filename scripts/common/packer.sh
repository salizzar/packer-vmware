#! /usr/bin/env bash

PACKER_PKG="0.5.2_linux_amd64.zip"
PACKER_URL="https://dl.bintray.com/mitchellh/packer/$PACKER_PKG"
PACKER_TMP="/tmp/$PACKER_PKG"
PACKER_DIR="/usr/local/bin"

curl --location --output $PACKER_TMP $PACKER_URL

unzip -o $PACKER_TMP -d $PACKER_DIR

rm $PACKER_TMP

