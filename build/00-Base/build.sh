#!/usr/bin/env bash

source /tmp/build/vars.sh

# Base packages
rpm-ostree install \
    curl

# Setup repo
mkdir -p /etc/yum.repos.d

wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-$RELEASE/solopasha-hyprland-fedora-$RELEASE.repo -O /etc/yum.repos.d/hyprland.repo
wget https://copr.fedorainfracloud.org/coprs/tofik/nwg-shell/repo/fedora-$RELEASE/tofik-nwg-shell-fedora-$RELEASE.repo -O /etc/yum.repos.d/nwg-shell.repo

rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
