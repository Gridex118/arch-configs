#!/bin/bash

ACCEL_LOG=/tmp/mouse_accel

if [[ -f $ACCEL_LOG ]]; then
    MOUSE_ACCEL=$(cat $ACCEL_LOG)
else
    MOUSE_ACCEL=0
fi

if [[ $MOUSE_ACCEL -ge 40 ]]; then
    MOUSE_ACCEL=0
fi

MOUSE_BASE=10

MOUSE_ACCEL=$(($MOUSE_ACCEL + 10))

case "$1" in
    h)
        ydotool mousemove -- -$(($MOUSE_BASE + $MOUSE_ACCEL)) 0
    ;;
    j)
        ydotool mousemove -- 0 $(($MOUSE_BASE + $MOUSE_ACCEL))
    ;;
    k)
        ydotool mousemove -- 0 -$(($MOUSE_BASE + $MOUSE_ACCEL))
    ;;
    l)
        ydotool mousemove -- $(($MOUSE_BASE + $MOUSE_ACCEL)) 0
    ;;
    click)
        ydotool click 0xC0
    ;;
    reset)
        MOUSE_ACCEL=0
    ;;
esac

echo $MOUSE_ACCEL > $ACCEL_LOG
