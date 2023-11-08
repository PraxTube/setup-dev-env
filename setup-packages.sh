#!/bin/bash

# Check if the script is run with sudo
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run with sudo."
    exit 1
fi

# Display a warning message
echo "This process is going to create/overwrite configs for various packages. Do you want to continue? [y/N]"

# Read user input into a variable
read user_input

# Check the user's response
if [ "$user_input" == "y" ] || [ "$user_input" == "Y" ]; then
    echo "User confirmed. Continuing..."
else
    echo "User canceled. Exiting..."
    exit 1
fi

# Installing packages

echo "\n---installing packages---\n"

sudo pacman -Syu tldr
sudo pacman -Syu neovim

echo "\n---done installing packages---\n"

# Copy Config Files

./scripts/setup-yay.sh

echo "\n---copying config files---\n"

./scripts/setup-mpv.sh
./scripts/setup-redshift.sh
./scripts/setup-vifm.sh
./scripts/setup-vieb.sh

echo "\n---done copying config files---\n"
