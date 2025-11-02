#!/usr/bin/env bash
script=$(ls ~/.local/share/screenshot | rofi -dmenu -p 󰄀)
sleep 0.6

if [ -z "$script" ]; then
    exit 0
fi

path="$HOME/Pictures/Screenshots/screenshot-$(date +%Y-%m-%d_%H:%M:%S).png"
"$HOME/.local/share/screenshot/$script" -o "$path"

