#! /usr/bin/env bash

apt-get update > /dev/null

apt-get install --yes --force-yes salt-master salt-minion salt-syndic

