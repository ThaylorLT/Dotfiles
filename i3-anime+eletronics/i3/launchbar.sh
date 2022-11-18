 #!/usr/bin/env bash
# xrandr -s 1600x900
 feh --no-fehbg --bg-fill $HOME/Pictures/ign_circuit.png 
 killall polybar
 polybar -c $HOME/.config/i3/config.ini right
 sleep 1
 polybar -c $HOME/.config/i3/config.ini left