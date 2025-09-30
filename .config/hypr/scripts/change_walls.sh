#!/bin/bash
# Wallpaper directory
WALL_DIR="$HOME/.config/Wallpapers/Eternal"

# Start swww-daemon if not running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    # wait until the daemon is fully started
    while ! pgrep -x "swww-daemon" > /dev/null; do
        sleep 0.2
    done
fi

# Get the currently used wallpaper (basename only, not full path)
WALL_PREV=$(swww query | awk -F'image: ' '{print $2}' | xargs basename)

# Pick a new wallpaper, make sure it’s not the same as the previous one
while :; do
    WALLPAPER=$(find "$WALL_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
    WALLPAPER_BASENAME=$(basename "$WALLPAPER")
    if [ "$WALLPAPER_BASENAME" != "$WALL_PREV" ]; then
        break
    fi
done

# Restart waybar to refresh colors
pkill waybar

# Generate colors with pywal
wal -i "$WALLPAPER" -n -q

# Set the wallpaper with swww
swww img "$WALLPAPER" --transition-type any

# Launch waybar again
waybar &
