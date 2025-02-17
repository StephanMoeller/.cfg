
windowname="$1"
startcommand="$2"

# Check if program is running
if hyprctl clients | grep class | grep $windowname > /dev/null; then
    echo "focused"
    # If program is running, find the window and focus it
    hyprctl dispatch focuswindow $windowname
    hyprctl dispatch bringactivetotop 
else
    # If Discord is not running, start it
    echo "starting"
    $startcommand
fi

