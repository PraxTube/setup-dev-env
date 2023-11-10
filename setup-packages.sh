#!/bin/bash

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
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

sudo pacman -Syu tldr neovim cmake --noconfirm
sudo pacman -S --needed git base-devel --noconfirm

echo "\n---done installing packages---\n"

# Copy Config Files

echo "\n---copying config files---\n"

./scripts/setup-yay.sh
./scripts/setup-vieb.sh
./scripts/setup-mpv.sh
./scripts/setup-redshift.sh
./scripts/setup-vifm.sh

echo "\n---done copying config files---\n"

# Install DaddyTime Font

echo "\n---installing daddy time fone---\n"

sudo mkdir -p /usr/local/share/fonts/

# URL of the file to download
url="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DaddyTimeMono/DaddyTimeMonoNerdFont-Regular.ttf"

tmp_destination="./tmp-daddy.ttf"
# Destination path to save the downloaded file
destination="/usr/local/share/fonts/DaddyTimeMonoNerdFont-Regular.ttf"

# Download the file using curl
curl -o "$tmp_destination" -L "$url"
sudo mv "$tmp_destination" "$destination"

# Check the exit status of curl
if [ $? -eq 0 ]; then
    echo "Daddy Font successfully donwloaded"
else
    echo "ERROR: Failed to download Daddy Font"
fi

echo "\n---done installing daddy time fone---\n"
