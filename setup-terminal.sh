#!/bin/bash

# NOTE: The Font may not download correctly.
# NOTE: The autostart on boot of alacritty may not work on every Desktop Env

# Check if the script is run with sudo
if ! [ "$EUID" -ne 0 ]; then
    echo "This script must NOT be run with sudo."
    exit 1
fi

if ! command -v cargo &> /dev/null; then
  echo "Rust (Cargo) not installed!"
  echo "NOTE: Run curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
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

# Terminal setup

echo "\n---setting up terminal---\n"

## Copy paste config files

mkdir -p ~/.config

cp -r terminal/alacritty/ ~/.config/alacritty/
cp -r terminal/zellij/ ~/.config/zellij/
cp -r terminal/nushell/ ~/.config/nushell/
cp terminal/starship.toml ~/.config/starship.toml

### Copy paste alacritty.desktop

mkdir -p ~/.local/share/applications/
cp terminal/alacritty.desktop ~/.local/share/applications/

mkdir -p ~/.config/autostart/
ln -s ~/.local/share/applications/alacritty.desktop ~/.config/autostart/alacritty.desktop

## Install Terminal

cargo install alacritty
cargo install zellij
cargo install nu
cargo install starship

echo "\n---done setting up terminal---\n"

# Install Better Default Packages

echo "\n---installing better default packages---\n"

cargo install bat
cargo install exa
cargo install du-dust
cargo install bottom
cargo install ripgrep

echo "\n---done setting up terminal---\n"

echo "\n\n===DONE==="
echo "NOTE: you may want to run the setup-github-ssh.sh script"
