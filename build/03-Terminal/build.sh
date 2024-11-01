#!/usr/bin/env bash

source /tmp/build/vars.sh

# Packages
rpm-ostree install \
    kitty \
    zsh
