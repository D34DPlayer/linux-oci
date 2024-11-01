#!/usr/bin/env bash

source /tmp/build/vars.sh

# Packages
rpm-ostree install \
    pavucontrol \
    pamixer \
    network-manager-applet \
    bluez \
    bluez-tools \
    blueman \
    udiskie \
    polkit-gnome \
    parallel \
    qt5-qtimageformats \
    kde-cli-tools
