#!/bin/bash
windowname="$1"
startcommand="$2"
wmctrl -a "$windowname"
if [[ "$?" == "1" ]]
then
  bash -c "$startcommand"
fi

# bash -c "wmctrl -a chrome ; [ "$?" == "1" ] && google-chrome-stable"

