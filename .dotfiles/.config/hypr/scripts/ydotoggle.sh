#!/bin/bash

if [[ $(pgrep ydotoold) ]]; then
    pkill ydotoold
    hyprctl dispatch submap reset
else
    ydotoold&
    hyprctl dispatch submap mouse
fi
