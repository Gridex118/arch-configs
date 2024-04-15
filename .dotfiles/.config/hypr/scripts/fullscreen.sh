#!/bin/bash

hyprctl dispatch fullscreen

FULLSCR=`hyprctl activeworkspace| grep "hasfullscreen"| awk -F: '{print $2}'| tr -d ' '`
if [ $FULLSCR = '1' ]; then
    hyprctl dispatch submap fullscr
fi
