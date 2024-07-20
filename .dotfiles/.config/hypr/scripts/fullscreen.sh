#!/bin/bash

hyprctl dispatch fullscreen

FULLSCR=`hyprctl activeworkspace -j| jq ."hasfullscreen"`
[ $FULLSCR = 'true' ] && hyprctl dispatch submap fullscr
