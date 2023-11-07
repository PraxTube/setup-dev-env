#!/bin/bash

# NOTE: The Font may not download correctly.
# NOTE: The autostart on boot of alacritty may not work on every Desktop Env

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

echo "\n---installing packages---\n"

sudo pacman -Syu tldr
sudo pacman -Syu neovim

echo "\n---done installing packages---\n"

# Terminal setup

echo "\n---setting up terminal---\n"

## Install DaddyTime Font

mkdir -p /usr/local/share/fonts/

# URL of the file to download
url="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DaddyTimeMono/DaddyTimeMonoNerdFont-Regular.ttf"

# Destination path to save the downloaded file
destination="/usr/local/share/fonts/DaddyTimeMonoNerdFont-Regular.ttf"

# Download the file using curl
curl -o "$destination" -L "$url"

# Check the exit status of curl
if [ $? -eq 0 ]; then
    echo "Daddy Font successfully donwloaded"
else
    echo "ERROR: Failed to download Daddy Font"
fi

## Copy paste config files

mkdir -p ~/.config

cp -r alacritty/ ~/.config/alacritty/
cp -r zellij/ ~/.config/zellij/
cp -r nushell/ ~/.config/nushell/
cp starship.toml ~/.config/starship.toml

## Copy paste alacritty.desktop
mkdir -p ~/.local/share/applications/
cp alacritty.desktop ~/.local/share/applications/

mkdir -p ~/.config/autostart/
ln -s ~/.local/share/applications/alacritty.desktop ~/.config/autostart/alacritty.desktop

## Install Terminal

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install alacritty
cargo install zellij
cargo install nu
cargo install starship

echo "\n---done setting up terminal---\n"

# Install Better Default Packages

echo "\n---installing better default packages---\n"

cargo install bat
cargo install du-dust
cargo install bottom
cargo install ripgrep

echo "\n---done setting up terminal---\n"

# Copy Config Files

echo "\n---copying config files---\n"

./scripts/setup-mpv.sh
./scripts/setup-vifm.sh
./scripts/setup-redshift.sh

echo "\n---done copying config files---\n"

echo "\n\n===DONE==="
echo "NOTE: you may want to run the setup-github-ssh.sh script"
