clear

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if [ `date '+%m'` -ne '12' ]; then
        startx
        logout
    else
        exec startx
    fi
fi
