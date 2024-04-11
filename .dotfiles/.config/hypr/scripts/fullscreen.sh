if [ -z "$(hyprctl binds | grep killactive)" ]; then
    hyprctl keyword bind ALT, Q, killactive
else
    hyprctl keyword unbind ALT, Q
fi
