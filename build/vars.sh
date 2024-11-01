#!/usr/bin/env bash

set -oue pipefail

# Eg. "40"
export RELEASE="$(rpm -E %fedora)"
