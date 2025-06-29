#!/bin/bash

set -e 


SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
base="$SCRIPT_DIR/Resources"


echo "downloading needed depedencies"
sudo pacman -S --needed \
    hyprland \
    wofi \
    waybar \
    grub \
    sddm \
    qt5-graphicaleffects \
    qt5-quickcontrols \
    qt5-quickcontrols2 \
    qt5-svg \
    qt5-declarative \
    qt5-translations \
    noto-fonts \
    ttf-roboto \
    ttf-nerd-fonts-symbols \
    ttf-nerd-fonts-symbols-common \
    ttf-font-awesome \
    kitty \
    swww


echo "Copying grub and sddm themes."
sudo cp -r "$base/Vimix" /usr/share/grub/themes/
sudo cp -r "$base/sugar-candy" /usr/share/sddm/themes/
sudo cp "$base/sddm.conf" /etc/sddm.conf
sudo cp "$base/grub" /etc/default/grub


echo "creating directories"
mkdir -p "$HOME/.config/wofi"
mkdir -p "$HOME/.config/waybar"
mkdir -p "$HOME/.config/hypr"
sudo mkdir -p /usr/share/backgrounds/

echo "Copying hyprland, wofi and waybar files."
sudo cp -r "$base/wofi/"* "$HOME/.config/wofi/"
sudo cp -r "$base/waybar/"* "$HOME/.config/waybar/"
sudo cp "$base/hyprland.conf" "$HOME/.config/hypr/"

echo "Copying Wallpapers"
sudo cp "$base/Backgrounds/eva1.jpg" /usr/share/backgrounds/eva1.jpg


echo "Generating grub-mkconfig"
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo "Sucess!"
