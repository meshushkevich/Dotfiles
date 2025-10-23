#!/bin/bash

# Update sudo timeout
sudo echo "Defaults passwd_timeout=20" >> /etc/sudoers.d/passwd_timeout

# Configure pacman
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp ./pacman/pacman.conf /etc/pacman.conf

# Update system
sudo pacman -Suy

# Install AUR helper (paru)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..

# Install and configure Rust
sudo pacman -S rustup
rustup default stable

# Install comtrya
cargo install comtrya

# Run comtrya
~/.cargo/bin/comtrya -d ./manifests apply -m entrypoint.yaml

# reboot
sudo reboot

