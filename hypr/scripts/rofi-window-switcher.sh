#!/usr/bin/env bash

# Lấy danh sách các cửa sổ hiện có trong Hyprland
clients=$(hyprctl -j clients)

# Dùng jq để lấy address và title
windows=$(echo "$clients" | jq -r '.[] | select(.title != "") | "\(.address) \(.class): \(.title)"')

# Nếu không có cửa sổ thì thoát
[ -z "$windows" ] && exit

# Hiển thị danh sách qua rofi
chosen=$(echo "$windows" | rofi -dmenu -i -p "Switch Window")

# Nếu chọn 1 cửa sổ thì lấy address và focus
if [ -n "$chosen" ]; then
    addr=$(echo "$chosen" | awk '{print $1}')
    hyprctl dispatch focuswindow address:$addr
fi
