#!/bin/bash

ENABLED=$(xinput list-props 9 | grep "Device Enabled" | awk -F: '{gsub(/\s+/, "", $2); print $2}')

if [ $ENABLED = 1 ]; then
    xinput disable 9
else
    xinput enable 9
fi
