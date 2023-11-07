#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

sudo pacman -Syu vifm

if [ ! -d ~/.config/vifm ]; then
  echo "vifm dir does not exist in .confg"
  exit 1
fi

mkdir -p ~/.config/vifm/colors/

cp ../configs/vifm/colors/bitcoinorange.vifm ~/.config/vifm/colors/bitcoinorange.vifm

# Set color theme in config
echo "color bitcoinorange" >> ~/.config/vifm/vifmrc

echo "done setting up vifm"
