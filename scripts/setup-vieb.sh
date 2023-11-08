#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

sudo yay -S vieb-bin

mkdir -p /home/rancic/.config/Vieb

cp configs/vieb/Preferences $USER_HOME/.config/Vieb/Preferences
cp configs/vieb/windowstate $USER_HOME/.config/Vieb/windowstate

echo "done setting up vieb"
