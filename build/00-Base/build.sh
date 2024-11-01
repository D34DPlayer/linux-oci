#!/usr/bin/env bash

source /tmp/build/vars.sh

# Base packages
rpm-ostree install \
    curl

# Setup repo
mkdir -p /etc/yum.repos.d

wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-$RELEASE/solopasha-hyprland-fedora-$RELEASE.repo -O /etc/yum.repos.d/hyprland.repo
