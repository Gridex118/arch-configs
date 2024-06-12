clear

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    if [ `date '+%m'` -ne '12' ]; then
        systemd-inhibit --what="handle-power-key" --mode="block" --why="Prevent shut down during graphical session" Hyprland
        logout
    else
        exec Hyprland
    fi
fi
