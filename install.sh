#!/bin/bash

# Configure pacman
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp ./pacman/pacman.conf /etc/pacman.conf

# Update system
sudo pacman -Suy

# Install and configure Rust
sudo pacman -S rustup
rustup default stable

# Install AUR helper (paru)
git clone https://aur.archlinux.org/paru-bin.git
cd paru
makepkg -si
cd ..

# Install comtrya
cargo install comtrya

# Run comtrya
echo "Running comtrya to load manifests. Please, take a while"
~/.cargo/bin/comtrya -v -d ./manifests apply -m client.desktop

