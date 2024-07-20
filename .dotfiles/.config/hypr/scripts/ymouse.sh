#!/bin/bash

SPEED_LOG=/tmp/mouse_SPEED

if [[ -f $SPEED_LOG ]]; then
    MOUSE_SPEED=$(cat $SPEED_LOG)
else
    MOUSE_SPEED=0
fi

if [[ $MOUSE_SPEED -ge 40 ]]; then
    MOUSE_SPEED=0
fi

MOUSE_BASE=10

MOUSE_SPEED=$(($MOUSE_SPEED + 10))

case "$1" in
    h)
        ydotool mousemove -- -$(($MOUSE_BASE + $MOUSE_SPEED)) 0
    ;;
    j)
        ydotool mousemove -- 0 $(($MOUSE_BASE + $MOUSE_SPEED))
    ;;
    k)
        ydotool mousemove -- 0 -$(($MOUSE_BASE + $MOUSE_SPEED))
    ;;
    l)
        ydotool mousemove -- $(($MOUSE_BASE + $MOUSE_SPEED)) 0
    ;;
    click)
        ydotool click 0xC0
    ;;
    reset)
        MOUSE_SPEED=0
    ;;
esac

echo $MOUSE_SPEED > $SPEED_LOG
