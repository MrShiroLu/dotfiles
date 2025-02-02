#!/bin/bash

timestamp=$(date +"%Y-%m-%d %H-%M-%S")
output_dir="$HOME/Pictures/Screenshots"
output_file="${output_dir}/screenshot_${timestamp}.png"

grim -g "$(slurp)" "$output_file"
notify-send -t 2500 "${output_file} saved"
wl-copy < "${output_file}"
