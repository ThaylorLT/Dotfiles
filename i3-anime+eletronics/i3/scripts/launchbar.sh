 #!/usr/bin/env bash
 xrandr -s 1600x900
 feh --no-fehbg --bg-fill $HOME/.config/i3/image55.png
 killall polybar
 polybar -c $HOME/.config/i3/config.ini left & 
 sleep 1s 
 polybar -c $HOME/.config/i3/config.ini right &