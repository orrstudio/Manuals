#!/bin/bash

# Ensure the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Update system
pacman -Syu --noconfirm

# Install some packages
pacman -S --noconfirm base-devel git

# Clone and install yay AUR helper
if [[ ! -d "/opt/yay-git" ]]; then
    cd /opt
    git clone https://aur.archlinux.org/yay-git.git
    chown -R gosh:gosh ./yay-git
    cd yay-git
    sudo -u gosh makepkg -si --noconfirm
else
    echo "yay-git directory already exists in /opt. Please check it before running the script again."
    exit 1
fi

