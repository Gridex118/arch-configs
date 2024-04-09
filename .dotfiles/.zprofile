clear

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec dbus-run-session Hyprland > /dev/null 2>&1
fi
