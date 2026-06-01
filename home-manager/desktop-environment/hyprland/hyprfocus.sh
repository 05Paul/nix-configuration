#!/usr/bin/env bash

running=$(hyprctl -j clients | jq --arg name "$1" -r '.[] | select(.class == $name) | .address')

if [[ $running != "" ]]; then
    hyprctl dispatch focuswindow address:"$running"
else
    exit 1
fi
