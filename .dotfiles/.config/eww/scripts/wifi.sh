#!/bin/bash

if  [ $(iwgetid -r) ]; then
    eww update wifi-icon="直"
    eww update wifi-text="Connected"
else
    eww update wifi-icon="睊"
    eww update wifi-text="Disconnected"
fi

wifiname=$(iwgetid -r)
echo $wifiname
