#!/usr/bin/env bash
if pgrep -x wvkbd-mobintl >/dev/null; then
    # If running, send toggle signal
    pkill -SIGRTMIN wvkbd-mobintl
else
    # If not running, launch it
    hyprctl dispatch focusmonitor "desc:Wacom Tech Wacom One 13T 5BQ01D1000268"
    wvkbd-mobintl -L 400 --landscape-layers full >/dev/null 2>&1 &
fi
