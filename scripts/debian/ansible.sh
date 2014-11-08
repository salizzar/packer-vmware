#! /usr/bin/env bash

apt-get install --yes --force-yes software-properties-common

apt-add-repository ppa:ansible/ansible

apt-get update > /dev/null

DEBIAN_FRONTEND=noninteractive apt-get install --yes --force-yes ansible

