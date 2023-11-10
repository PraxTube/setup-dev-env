#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

sudo pacman -Syu vifm --noconfirm

mkdir -p ~/.config/vifm/colors/

cp configs/vifm/colors/bitcoinorange.vifm ~/.config/vifm/colors/bitcoinorange.vifm

# Set color theme in config
echo "color bitcoinorange" >> ~/.config/vifm/vifmrc

echo "done setting up vifm"
