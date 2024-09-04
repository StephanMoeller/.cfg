#!/bin/bash

# Check if Discord is running
if pgrep -x "discord" > /dev/null; then
    # If Discord is running, find the window and focus it
    hyprctl dispatch focuswindow "discord"
    echo "focused"
else
    # If Discord is not running, start it
    echo "starting"
    discord &
fi
