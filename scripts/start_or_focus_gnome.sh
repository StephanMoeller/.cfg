#!/bin/bash
windowclassname="$1" # find a window class name by calling: wmctrl -lx while the window is open. The class name is the first string on each line.
startcommand="$2"
wmctrl -x -a "$windowclassname"
if [[ "$?" == "1" ]]
then
  bash -c "$startcommand"
fi

# bash -c "wmctrl -a chrome ; [ "$?" == "1" ] && google-chrome-stable"

