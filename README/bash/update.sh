#!/bin/bash

# retreive list of available package updates
apt update -y

# upgrade all packages based off new list
apt upgrade -y

# install new and uninstall old packages that must be removed for install
apt full-upgrade -y

# remove unnessary packages and their associated configs
apt autoremove --purge -y

# bonus - do in one line
# apt update -y && apt upgrade -y && apt full-upgrade -y
