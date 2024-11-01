#!/bin/bash

set -oue pipefail

# Eg. "40"
export RELEASE="$(rpm -E %fedora)"

for script in /tmp/build/*.sh; do
    if [ -f "$script" ]; then
        echo "Running $script..."
        source "$script"
    fi
done
