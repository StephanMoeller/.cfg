
windowname="$1"
startcommand="$2"

# Check if program is running

if wmctrl -l | grep $windowname > /dev/null; then
    echo "focused"
    windowId="$(wmctrl -l | grep $windowname)"
    wmctrl -a -i $windowId   
else
    # If Discord is not running, start it
    echo "starting"
    $startcommand
fi
