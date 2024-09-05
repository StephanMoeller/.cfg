
echo "$1"
workspace="$1"
windowname="$2"
startcommand="$3"
multi="$4"

hyprctl dispatch workspace $workspace

# Check if program is running
if hyprctl clients | grep class | grep $windowname > /dev/null; then
    echo "focused"
    # If Discord is running, find the window and focus it
    hyprctl dispatch focuswindow $windowname
else
    # If Discord is not running, start it
    echo "starting"
    $startcommand
fi
