#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/waybar/config.jsonc"

if grep -q '"position": "top"' "$CONFIG_FILE"; then
    sed -i 's/"position": "top"/"position": "right"/' "$CONFIG_FILE"
elif grep -q '"position": "right"' "$CONFIG_FILE"; then
    sed -i 's/"position": "right"/"position": "bottom"/' "$CONFIG_FILE"
elif grep -q '"position": "bottom"' "$CONFIG_FILE"; then
    sed -i 's/"position": "bottom"/"position": "left"/' "$CONFIG_FILE"
else
    sed -i 's/"position": "left"/"position": "top"/' "$CONFIG_FILE"
fi

pkill waybar

while pgrep -u $UID -x waybar >/dev/null; do sleep 0.1; done

waybar > /dev/null 2>&1 &
