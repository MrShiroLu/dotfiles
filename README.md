## Package Installation

```bash
# Download essential dependencies
sudo pacman -S --needed git curl wget base-devel wayland hyprland waybar hyprpaper kitty --noconfirm

# Install additional packages listed in packages.txt
sudo pacman -S --needed --noconfirm $(cat packages.txt)
```

## Copy Configuration Files

```bash
mkdir -p ~/.config/{waybar,Wallpapers}
cp -r ./config/waybar ~/.config/
cp -r ./Wallpapers/* ~/.config/Wallpapers/
cp -r ./kitty/* ~/.config/kitty/
cp -r ./nemo/* ~/.config/nemo/
cp -r ./rofi/* ~/.config/rofi/
cp -r ./waybar/* ~/.config/waybar/
cp -r ./nvim/* ~/.config/nvim/
cp -r ./hypr/* ~/.config/hypr/
cp -r ./dunst/* ~/.config/dunst/
```

## Themes

Custom Rofi themes from: [adi1090x's rofi](https://github.com/adi1090x/rofi)

Custom SDDM display themes from: [Keyitdev's sddm-astronaut-theme](https://github.com/Keyitdev/sddm-astronaut-theme)

Custom Notification center from: [iyiolacak's swaync](https://github.com/iyioalcak)

## Screenshots

<div align="center">
<img src="img/desktop.png" width="600" alt="desktop screenshot">
<br><br>
<img src="img/newkitty.png" width="600" alt="kitty screenshot">
<img src="img/taskswitcher2.png" width="600" alt="task switcher">
</div>


## Installation Notes

- Make sure you have a working Arch Linux installation
- Ensure Wayland is properly configured
- Some packages may require AUR (Arch User Repository)
