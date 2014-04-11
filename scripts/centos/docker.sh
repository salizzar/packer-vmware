#! /usr/bin/env bash

yum install -y lxc lxc-libs libcgroup xz lxc-docker

# start
service docker start

# start on boot
chkconfig docker on

