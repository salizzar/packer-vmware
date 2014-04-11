#! /usr/bin/env bash

apt-get update > /dev/null

apt-get install --yes --force-yes docker.io

update-alternatives --install /usr/bin/docker docker.io /usr/bin/docker.io 1

usermod -G docker -a vagrant

