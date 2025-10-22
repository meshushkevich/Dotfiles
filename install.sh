#!/bin/bash

# Update hypr config
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.bak
cp -r hypr/configs ~/.config/hypr/configs
cp hypr/monitors.conf ~/.config/hypr/monitors.conf
cp hypr/hyprland.conf ~/.config/hypr/hyprland.conf

# Update sudo timeout
sudo cp sudoers/passwd_timeout /etc/sudoers.d/passwd_timeout

# Configure pacman
sudo mv /etc/pacman.conf /etc/pacman.conf.bak
sudo cp pacman/pacman.conf /etc/pacman.conf

# Update system and install building stuff
sudo pacman -Suy
sudo pacman -S --needed base-devel

# Install zsh
sudo pacman -S zsh fastfetch
cp zsh/.zshrc ~/.zshrc
chsh -s /usr/bin/zsh

# Install and enable NetworkManager
sudo pacman -S networkmanager
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

# Install and enbale Bluetooth
sudo pacman -S bluez bluez-utils bluedevil
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Install and configure rust
sudo pacman -S rustup
rustup default stable

# Install AUR helper (paru)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

# Installing waybar with preconfig
paru -S waybar
mv ~/.config/waybar{,.bak}
cp -r waybar ~/.config/waybar

# Apps and tools
## Python tools (Astral-sh)
## Browser (Firefox Nightly)
## VPN (Throne)
## Telegram
## Steam
## nvim
## cliphist
## obsidian
## nwg displays
## drawing
paru -S ruff ty firefox-nightly throne-git telegram-desktop steam nvim ark cliphist obsidian nwg-displays drawing

## Waypaper
paru -S hyprpaper waypaper

## File Manager (Dolphin)
paru -S dolphin dolphin-plugins kio-admin kompare konsole ffmpegthumbs icoutils \
\ kdegraphics-thumbnailers kdesdk-thumbnailers libappimage qt6-imageformats \
\ raw-thumbnailer resvg taglib

## Walker
paru -S elephant walker

## Zed Editor
paru -S zed-preview

## Brightnessctl
paru -S brightnessctl pavucontrol

## SDDM Theme
sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"

# reboot
sudo reboot

