#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

yay -S vieb-bin --noconfirm

mkdir -p /home/rancic/.config/Vieb

cp configs/vieb/Preferences ~/.config/Vieb/Preferences
cp configs/vieb/windowstate ~/.config/Vieb/windowstate

echo "done setting up vieb"
