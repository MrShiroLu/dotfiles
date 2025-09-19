#!/bin/bash

WALL_DIR="$HOME/.config/Wallpapers/ILIKEIT"

# Start daemon if not running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    # daemon hazır olana kadar bekle
    while ! pgrep -x "swww-daemon" > /dev/null; do
        sleep 0.2
    done
fi

WALL_PREV=$(swww query | awk -F'image: ' '{print $2}' | xargs basename)

# pick wallpaper
WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

if ["$WALL_PREV" = "$WALLPAPER"]; then
	WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1) 
fi

pkill waybar

# set pywal colors
wal -i "$WALLPAPER" -n -q

# set wallpaper
swww img "$WALLPAPER" --transition-type any

waybar &