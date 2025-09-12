#!/usr/bin/env bash

URL="$(playerctl metadata mpris:artUrl)"

if [[ $URL == file://* ]];
then
    echo "${URL/file:\/\//}"
fi

if [[ $URL == https://* ]];
then
    IMG_PATH="/tmp/hyprlock/$(basename "$URL")"
    mkdir /tmp/hyprlock -p
    if [[ ! -f $PATH ]];
    then
        curl -s "$URL" -o "$IMG_PATH"
        magick "$IMG_PATH" "$IMG_PATH".png
        rm /tmp/hyprlock/latest.png
        ln -s "$IMG_PATH".png /tmp/hyprlock/latest.png
    fi
    echo "$IMG_PATH".png
fi
