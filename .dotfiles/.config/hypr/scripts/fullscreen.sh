if [ -z "$(hyprctl binds | grep killactive)" ]; then
    hyprctl keyword bind ALT, Q, killactive
    for w in {1..9}; do
        hyprctl keyword bind ALT, $w, exec, hyprctl dispatch workspace $w
    done
else
    hyprctl keyword unbind ALT, Q
    for w in {1..9}; do
        hyprctl keyword unbind ALT, $w
    done
fi
