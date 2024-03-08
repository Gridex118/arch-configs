#!/bin/bash

LOG_FILE="$HOME/.config/zathura/recent.log"
touch $LOG_FILE

open_pdf() {
    zathura --fork "$1"
    # record opened PDF
    [[ "$1" = "" || "$1" ]] || echo "$1" > $LOG_FILE
}

if [ "$1" = "" ] || [ "$1" = "--menu" ]; then
    LAST_PDF="`cat $LOG_FILE`"
    if [ ! "$LAST_PDF" = "" ] && [ ! "$1" = "--menu" ]; then
        open_pdf "$LAST_PDF"
    else
        DOCUMENTS=""
        [ -d $HOME/Documents ] || exit -1
        cd $HOME/Documents
        for DIR in *; do
            if [ -d $DIR ]; then
                cd $DIR
                for FILE in *.pdf; do
                    DOCUMENTS=$DOCUMENTS"$DIR/$FILE"'\n'
                done
                cd ..
            fi
        done
        SELECTED_PDF="`echo -e $DOCUMENTS | rofi -i -dmenu`"
        open_pdf "$HOME/Documents/$SELECTED_PDF"
    fi
else
    open_pdf "$1"
fi

