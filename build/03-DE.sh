#! /usr/bin/env bash

# Packages
rpm-ostree install \
    hyprland \
    egl-wayland \
    qt5-qtquickcontrols \
    qt5-qtquickcontrols2 \
    qt5-qtgraphicaleffects \
    sddm \
    dunst \
    rofi-wayland \
    waybar \
    swww \
    swaylock-effects \
    wlogout \
    swappy \
    cliphist

# Login manager
tar -xzvf /tmp/files/sugar-dark.tar -C /usr/share/sddm/themes
cp /tmp/conf/sddm/sddm.conf /etc/sddm.conf.d/00-base.conf

systemctl enable sddm

# grimblast

wget https://github.com/hyprwm/contrib/archive/refs/heads/main.zip -O /tmp/grimblast.zip
unzip /tmp/grimblast.zip -d /tmp/grimblast
mv /tmp/grimblast/contrib-main/grimblast/grimblast /usr/bin/grimblast
chmod +x /usr/bin/grimblast
