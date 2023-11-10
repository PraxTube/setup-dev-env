#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

sudo pacman -Syu redshift --noconfirm

mkdir -p ~/.config/redshift/

cp configs/redshift/redshift.conf ~/.config/redshift/redshift.conf

mkdir -p ~/.config/autostart/

cp configs/redshift/redshift-gtk.desktop ~/.config/autostart/redshift-gtk.desktop

echo "done setting up redshift"
echo "NOTE: depending on redshift, it may auto start mutliple times, better check it"
