#! /usr/bin/env bash

apt-get update > /dev/null

apt-get install --yes --force-yes qemu qemu-kvm

# add vagrant to kvm group
usermod -G kvm -a vagrant

