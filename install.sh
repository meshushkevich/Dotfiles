#!/bin/bash

# Update sudo timeout
echo "Defaults passwd_timeout=20" >> passwd_timeout
sudo mv passwd_timeout /etc/sudoers.d/passwd_timeout

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
echo "Running comtrya to load manifests. Please, take a while"
cargo install comtrya

# Run comtrya
~/.cargo/bin/comtrya -d ./manifests apply

# reboot
# for now, rebooting is manually process
# sudo reboot

