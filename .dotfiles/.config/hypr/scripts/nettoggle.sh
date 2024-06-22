#!/bin/bash

iwctl station wlan0 scan on

LOG_FILE=/tmp/nettoggle.log

WLAN_STATUS=$(awk '{print $4}' <(rfkill | grep wlan))
if [ $WLAN_STATUS = "blocked" ]; then
    rfkill unblock all
fi
unset WLAN_STATUS

toggle_connection() {
    SSID=$1
    if [ -z "$(iw dev wlan0 link | grep $SSID)" ]; then
        iwctl station wlan0 connect $SSID || return 1
        echo "connected to $SSID" > $LOG_FILE
        notify-send "connected to $SSID"
    else
        iwctl station wlan0 disconnect
        echo "disconnected from $SSID" > $LOG_FILE
        notify-send "disconnected from $SSID"
    fi
    unset SSID
    return 0
}


for ssid in `cat ~/.networks`; do
    toggle_connection $ssid \
    || echo "Could not connect to "$ssid > $LOG_FILE
done

unset LOG_FILE
