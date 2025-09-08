#!/bin/bash

WALL_DIR="$HOME/.config/Wallpapers/forswww"

# Start daemon if not running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    # daemon hazır olana kadar bekle
    while ! pgrep -x "swww-daemon" > /dev/null; do
        sleep 0.2
    done
fi

# pick wallpaper
WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)


pkill waybar

# set pywal colors
wal -i "$WALLPAPER" -n -q

# set wallpaper
swww img "$WALLPAPER" --transition-type any

waybar &
