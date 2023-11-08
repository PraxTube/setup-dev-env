#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

sudo pacman -Syu redshift

mkdir -p $USER_HOME/.config/redshift/

cp configs/redshift/redshift.conf $USER_HOME/.config/redshift/redshift.conf

mkdir -p $USER_HOME/.config/autostart/

cp configs/redshift/redshift-gtk.desktop $USER_HOME/.config/autostart/redshift-gtk.desktop

echo "done setting up redshift"
echo "NOTE: depending on redshift, it may auto start mutliple times, better check it"
