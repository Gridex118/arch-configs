#!/bin/bash

LOG_FILE=/tmp/nettoggle.log

WLAN_STATUS=$(awk '{print $4}' <(rfkill | grep wlan))
if [ $WLAN_STATUS = "blocked" ]; then
    rfkill unblock wlan
fi
unset WLAN_STATUS

toggle_connection() {
    SSID=$1
    if [ -z "$(iw dev wlan0 link | grep $SSID)" ]; then
        iwctl station wlan0 connect $SSID >> /dev/null 2>&1 || return 1
        echo "connected to $SSID" >> $LOG_FILE
    else
        iwctl station wlan0 disconnect
        echo "disconnected from $SSID" >> $LOG_FILE
    fi
    unset SSID
    return 0
}


if [ -z $2 ]; then
       toggle_connection "TooBothersome" \
    || toggle_connection "Asad"          \
    || toggle_connection "Moba"          \
    || echo "could not connect to any home network" >> $LOG_FILE
fi;

unset LOG_FILE
