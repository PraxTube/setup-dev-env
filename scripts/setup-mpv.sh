#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

sudo pacman -Syu mpv

mkdir -p ~/.config/mpv/

cp ../configs/mpv/input.conf ~/.config/mpv/input.conf

echo "done setting up mpv"
