#!/bin/bash

CURRENT_DELAY="`xset -q | grep "delay" | awk '{print $4}'`"

hyprctl dismissnotify
if [ $CURRENT_DELAY = "250" ]; then
    hyprctl notify -1 1500 "rgb(ffffff)" "fontsize:30 Turbo repeat"
    hyprctl keyword input:repeat_delay 85
    hyprctl keyword input:repeat_rate 25
else
    hyprctl notify -1 1500 "rgb(ffffff)" "fontsize:30 Normal repeat"
    hyprctl keyword input:repeat_delay 250
    hyprctl keyword input:repeat_rate 30
fi

