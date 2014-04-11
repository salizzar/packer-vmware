#! /usr/bin/env bash

export DEBIAN_FRONTEND=false

apt-get update > /dev/null

apt-get install --yes --force-yes linux-image-3.13-1-amd64 linux-headers-3.13-1-amd64

reboot
