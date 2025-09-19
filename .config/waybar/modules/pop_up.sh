#!/usr/bin/env bash
title=$(playerctl metadata title)
artist=$(playerctl metadata artist)
position=$(playerctl position)
duration=$(playerctl metadata mpris:length)
duration_sec=$((duration / 1000000))
cover=$(playerctl metadata mpris:artUrl)

# kapak resmini indir
tmpfile=$(mktemp --suffix .jpg)
curl -s "$cover" -o "$tmpfile"

zenity --info \
  --title="$title" \
  --text="$artist\n$position / $duration_sec saniye" \
  --window-icon="$tmpfile"

