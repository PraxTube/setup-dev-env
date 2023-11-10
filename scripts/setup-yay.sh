#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

git clone https://aur.archlinux.org/yay.git

echo "\n---building yay---\n"

cd yay
makepkg -si

echo "\n---removing yay build files---\n"

cd ..
rm -rf yay
