#!/bin/bash

LOG_FILE="$HOME/.config/zathura/recent.log"
touch $LOG_FILE

open_pdf() {
    zathura --fork "$1"
    # record opened PDF
    [ ! "$1" = "" ] && echo "$1" > $LOG_FILE
}

if [ "$1" = "" ] || [ "$1" = "--menu" ]; then
    LAST_PDF="`cat $LOG_FILE`"
    if [ ! "$LAST_PDF" = "" ] && [ ! "$1" = "--menu" ]; then
        open_pdf "$LAST_PDF"
    else
        DOCUMENTS=""
        for file in $HOME/Documents/*/*.pdf; do
            DOCUMENTS=$DOCUMENTS"$file"'\n'
        done
        SELECTED_PDF="`echo -e $DOCUMENTS | rofi -i -dmenu`"
        open_pdf "$SELECTED_PDF"
    fi
else
    open_pdf "$1"
fi

