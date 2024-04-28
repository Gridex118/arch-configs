#!/bin/bash

CONF=~/.config/hypr/touchpad.conf

ENABLED=$(grep "enabled" $CONF| awk -F'=' '{print $2}'| tr -d '[:space:]')

if [[ $ENABLED -eq 1 ]]; then
    sed -i "s/enabled = 1/enabled = 0/" $CONF
    hyprctl notify -1 1000 "rgb(221122)" "fontsize:30 Touchpad Off"
else
    sed -i "s/enabled = 0/enabled = 1/" $CONF
    hyprctl notify -1 1000 "rgb(221122)" "fontsize:30 Touchpad On"
fi

hyprctl reload
