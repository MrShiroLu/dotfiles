#!/bin/bash

set -e

echo "Arch Linux kişisel kurulum başlıyor!"

# Gerekli bağımlılıkların kurulumu
echo "Gerekli paketler kuruluyor..."
sudo pacman -S --needed git curl wget base-devel --noconfirm

# AUR helper (örneğin: yay) kurulumu
if ! command -v yay &> /dev/null; then
    echo "yay yükleniyor..."
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
else
    echo "yay zaten yüklü!"
fi

# Wayland ve Hyperland konfigürasyonları
echo "Wayland ve Hyperland kurulumu yapılıyor..."
sudo pacman -S --needed wayland hyperland waybar hyprpaper alacritty --noconfirm

echo "Gerekli paketler yükleniyor..."
sudo pacman -S --needed --noconfirm $(cat packages.txt)

# Duvar kağıdı ve Waybar temaları
echo "Kişiselleştirme ayarları yükleniyor..."
mkdir -p ~/.config/{waybar,wallpapers}
cp -r ./config/waybar ~/.config/
cp -r ./wallpapers/* ~/.config/wallpapers/

# Hizmetleri başlatma
echo "Sistem hizmetleri başlatılıyor..."
systemctl --user enable waybar

echo "Kurulum tamamlandı!!!!"
