
windowname="$1"
startcommand="$2"

# Check if program is running
if hyprctl activewindow | grep class | grep $windowname > /dev/null; then
    echo "already in a window - create a new one"
    # If Discord is running, find the window and focus it
    $startcommand
elif hyprctl clients | grep class | grep $windowname > /dev/null; then
    # If Discord is not running, start it
    echo "Not already in a window, but a window exists - go to it"
    hyprctl dispatch focuswindow $windowname
    hyprctl dispatch bringactivetotop 
else
    # If Discord is not running, start it
    echo "no window running - start a new one"
    $startcommand
fi
