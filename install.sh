#!/bin/bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
base="$SCRIPT_DIR/Resources"

sudo pacman -S --needed \
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

sudo cp -r "$base/Vimix" /usr/share/grub/themes/
sudo cp -r "$base/sugar-candy" /usr/share/sddm/themes/
sudo cp "$base/sddm.conf" /etc/sddm.conf
sudo cp "$base/grub" /etc/default/grub

mkdir -p "$HOME/.config/wofi"
mkdir -p "$HOME/.config/waybar"
mkdir -p "$HOME/.config/hypr"

cp -r "$base/wofi/"* "$HOME/.config/wofi/"
cp -r "$base/waybar/"* "$HOME/.config/waybar/"
cp "$base/hyprland.conf" "$HOME/.config/hypr/"

sudo cp "$base/Backgrounds/eva1.jpg" /usr/share/backgrounds/eva1.jpg

sudo grub-mkconfig -o /boot/grub/grub.cfg
