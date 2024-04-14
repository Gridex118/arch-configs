#!/bin/bash

handle() {
    if [ "${1:0:10}" == "fullscreen" ]; then
        if [ "${1:12:1}" == "1" ]; then
            hyprctl dispatch submap fullscr
        fi
    fi
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
