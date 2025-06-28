#!/bin/bash
USER_HOME="$(dirname "$(dirname "$(realpath "$0")")")"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
base="$SCRIPT_DIR/Resources"

sudo pacman -S --needed sddm qt5-graphicaleffects qt5-quickcontrols qt5-quickcontrols2 qt5-svg qt5-declarative qt5-translations noto-fonts ttf-roboto ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-common ttf-font-awesome

sudo cp -r "$base/Vimix" /usr/share/grub/themes/
sudo cp -r "$base/sugar-candy" /usr/share/sddm/themes/
sudo cp "$base/sddm.conf" /etc/sddm.conf
sudo cp "$base/grub" /etc/default/grub
sudo cp -r "$base/wofi" "$USER_HOME/.config/wofi"
sudo cp -r "$base/waybar" "$USER_HOME/.config/waybar"
sudo cp "$base/hyprland.conf" "$USER_HOME/hypr"
sudo cp "$base/Backgrounds/eva1.jpg" /usr/share/backgrounds/eva1.jpg
sudo grub-mkconfig -o /boot/grub/grub.cfg

