#!/bin/bash

TOUCHPAD_ID="$(\
    xinput | grep -i "touch" \
    | awk -F'=' '{print $2}' | awk '{print $1}'
)"

ENABLED=$(xinput list-props $TOUCHPAD_ID | grep "Device Enabled" | awk -F: '{gsub(/\s+/, "", $2); print $2}')

if [ $ENABLED = 1 ]; then
    xinput disable $TOUCHPAD_ID
    awesome-client "require('naughty').notify {text = 'Mouse locked'}"
else
    xinput enable $TOUCHPAD_ID
    awesome-client "require('naughty').notify {text = 'Mouse unlocked'}"
fi
