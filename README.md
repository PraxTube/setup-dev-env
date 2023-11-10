# My Development Environment Setup

This repo contains the core config files to get the setup I use for development.
The most important feature is of course the terminal. Currently it's missing the neovimg (nvchad) configs, but that is because I am not sure if I want to continue using it (mostly because it's a pain to set them up).

## Install Instructions

**This is supposed to be run on arch linux.**

```
sudo pacman -Syu
git clone https://github.com/PraxTube/setup-dev-env
cd setup-dev-env
./setup-packages.sh
./setup-terminal.sh
```

If everything went well, you should be able to simply open `alacritty`
or just reboot to let it be autostarted.
