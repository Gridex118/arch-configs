#!/bin/bash

CURRENT_DELAY="`xset -q | grep "delay" | awk '{print $4}'`"

if [ $CURRENT_DELAY = "310" ]; then
    awesome-client "require('naughty').notify {text = 'Turbo Repeat'}"
    xset r rate 85 25
else
    xset r rate 310 30
    awesome-client "require('naughty').notify {text = 'Normal Repeat'}"
fi

