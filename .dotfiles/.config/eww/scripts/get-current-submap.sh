#!/usr/bin/bash

SUBMAP_LOG="/tmp/hypr-submap"

handle_submap () {
    if [[ -n "$(grep 'submap' <(echo $1))" ]]; then
        SUBMAP="$(awk -F'>>' -e '/^submap>>/ {print $2}' <(echo $1))"
        if [[ -z $SUBMAP ]]; then
            echo "Global" > $SUBMAP_LOG
        else
            echo ${SUBMAP^} > $SUBMAP_LOG
        fi
    fi
    cat $SUBMAP_LOG
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock|
    while read -r line; do handle_submap "$line"; done
