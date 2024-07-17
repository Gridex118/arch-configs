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

case "$1" in
    h|1)
        ydotool mousemove -- -$(($MOUSE_BASE + $MOUSE_ACCEL)) 0
        MOUSE_ACCEL=$(($MOUSE_ACCEL + 10))
    ;;
    j|2)
        ydotool mousemove -- 0 $(($MOUSE_BASE + $MOUSE_ACCEL))
        MOUSE_ACCEL=$(($MOUSE_ACCEL + 10))
    ;;
    k|3)
        ydotool mousemove -- 0 -$(($MOUSE_BASE + $MOUSE_ACCEL))
        MOUSE_ACCEL=$(($MOUSE_ACCEL + 10))
    ;;
    l|4)
        ydotool mousemove -- $(($MOUSE_BASE + $MOUSE_ACCEL)) 0
        MOUSE_ACCEL=$(($MOUSE_ACCEL + 10))
    ;;
    click)
        ydotool click 0x40
        ydotool click 0x80
    ;;
esac


echo $MOUSE_ACCEL > $ACCEL_LOG
