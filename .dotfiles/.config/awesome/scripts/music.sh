#!/bin/bash

DATA=/tmp/music.data

if [ $(pgrep cmus) ]; then
    PLAYING=$(grep 'playing' $DATA | awk -F':' '{print $2}')
    if [ $PLAYING = "true" ]; then
        cmus-remote -C player-pause
        sed -i "s/playing:true/playing:false/" $DATA
    else
        cmus-remote -C player-play
        sed -i "s/playing:false/playing:true/" $DATA
    fi
    unset PLAYING
else
    alacritty -t cmus -e cmus
    echo "playing:true" > $DATA
fi

unset DATA
