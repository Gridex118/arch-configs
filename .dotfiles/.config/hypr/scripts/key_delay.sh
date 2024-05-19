#!/bin/bash

CURRENT_DELAY="`xset -q | grep "delay" | awk '{print $4}'`"

hyprctl dismissnotify
if [ $CURRENT_DELAY = "250" ]; then
    notify-send "Turbo repeat"
    hyprctl keyword input:repeat_delay 85
    hyprctl keyword input:repeat_rate 25
else
    notify-send "Normal repeat"
    hyprctl keyword input:repeat_delay 250
    hyprctl keyword input:repeat_rate 30
fi

