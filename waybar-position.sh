#CODE IS EXPLAINED
#MADE BY ZL PROJECTS/ZLLAI26
#GNU GPL 3.0 LICENSE

#!/usr/bin/env bash

#grabs the information from config.jsonc
CONFIG_FILE="$HOME/.config/waybar/config.jsonc"

#cycles the waybar position from top to right to bottom to left
if grep -q '"position": "top"' "$CONFIG_FILE"; then
    sed -i 's/"position": "top"/"position": "right"/' "$CONFIG_FILE"
elif grep -q '"position": "right"' "$CONFIG_FILE"; then
    sed -i 's/"position": "right"/"position": "bottom"/' "$CONFIG_FILE"
elif grep -q '"position": "bottom"' "$CONFIG_FILE"; then
    sed -i 's/"position": "bottom"/"position": "left"/' "$CONFIG_FILE"
else
    sed -i 's/"position": "left"/"position": "top"/' "$CONFIG_FILE"
fi

#kill waybar to prevent overloading memory and duplicated waybars

pkill waybar

#waiting for old waybar to close

while pgrep -u $UID -x waybar >/dev/null; do sleep 0.1; done

#Launching a new waybar

waybar > /dev/null 2>&1 &
