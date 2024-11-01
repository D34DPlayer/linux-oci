#!/usr/bin/env bash

source /tmp/build/vars.sh

# Packages
rpm-ostree install \
    hyprland \
    egl-wayland \
    qt5-qtquickcontrols \
    qt5-qtquickcontrols2 \
    qt5-qtgraphicaleffects \
    qt5-qtimageformats \
    sddm \
    dunst \
    rofi-wayland \
    waybar \
    swww \
    swaylock-effects \
    wlogout \
    swappy \
    cliphist \
    nwg-look \
    qt5ct \
    qt6ct \
    kvantum \
    kvantum-qt5 \
    qt5-qtwayland \
    qt6-qtwayland

# Login manager
tar -xzf /tmp/build/DE/Sddm_Candy.tar.gz -C /usr/share/sddm/themes/
cp /tmp/build/DE/sddm.conf /etc/sddm.conf.d/00-base.conf

systemctl enable sddm

# grimblast

wget https://github.com/hyprwm/contrib/archive/refs/heads/main.zip -O /tmp/grimblast.zip
unzip /tmp/grimblast.zip -d /tmp/grimblast
mv /tmp/grimblast/contrib-main/grimblast/grimblast /usr/bin/grimblast
chmod +x /usr/bin/grimblast
