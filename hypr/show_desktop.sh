#!/bin/bash
# toggle all windows to scratchpad (minimize)
# and back when pressed again

# flag file để biết đang “minimized” hay chưa
FLAG="$HOME/.show_desktop_state"

if [ -f "$FLAG" ]; then
    # hiện lại tất cả window
    hyprctl dispatch togglespecialworkspace
    rm "$FLAG"
else
    # minimize tất cả
    hyprctl dispatch togglespecialworkspace
    touch "$FLAG"
fi
