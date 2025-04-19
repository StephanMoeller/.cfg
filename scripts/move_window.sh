x_pos="$1" # find a window class name by calling: wmctrl -lx while the window is open. The class name is the first string on each line.
width="$2"

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz 
xdotool getactivewindow windowsize $width 100% 
xdotool getactivewindow windowmove $x_pos 0%
