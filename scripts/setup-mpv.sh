#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

sudo pacman -Syu mpv

mkdir -p ~/.config/mpv/

cp configs/mpv/input.conf $USER_HOME/.config/mpv/input.conf

echo "done setting up mpv"
