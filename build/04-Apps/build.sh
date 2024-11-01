#!/usr/bin/env bash

source /tmp/build/vars.sh

# Packages
rpm-ostree install \
    chromium \
    dolphin \
    ark \
    code

xdg-mime default org.kde.dolphin.desktop inode/directory
