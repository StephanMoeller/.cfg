
resolution=$(xrandr | grep '*' | awk '{print $1}')
screen_width=${resolution%x*}
screen_height=${resolution#*x}

pos_a=0;
pos_b=$((screen_width/4));
pos_c=$((screen_width/4*3));

width_a=$((screen_width/4));
width_b=$((screen_width/2));
width_c=$((screen_width/4));

current_x_pos=$(xdotool getactivewindow getwindowgeometry | grep "Position:" | awk '{split($2, pos, ","); print pos[1]}')
echo "X position is: $current_x_pos"

#ensure current window is not maximized
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz 

# Conditional logic
if [ "$current_x_pos" -gt $((pos_b + 25)) ]; then
  echo "A"
  xdotool getactivewindow windowsize 50% 100% 
  xdotool getactivewindow windowmove 25% 0
else
  echo "C"
  xdotool getactivewindow windowsize 25% 100% 
  xdotool getactivewindow windowmove 0 0
fi 

