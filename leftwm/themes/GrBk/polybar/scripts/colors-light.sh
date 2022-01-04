#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

# Color files
PFILE="$HOME/.config/leftwm/themes/current/polybar/colors.ini"
RFILE="$HOME/.config/leftwm/themes/current/polybar/scripts/rofi/colors.rasi"
LFILE="$HOME/.config/leftwm/themes/current/theme.toml"
TFILE="$HOME/.config/leftwm/themes/current/template.liquid"

# Change colors
change_color() {
	# leftwm theme.toml
	sed -i -e 's/focused_border_color = "#.*/focused_border_color = "'$AC'"/g' $LFILE
	#sed -i -e 's/floating_border_color = "#.*/floating_border_color = "#bbbbbb"/g' $LFILE
	#sed -i -e 's/default_border_color = "#.*/default_border_color = "'$AC'"/g' $LFILE

	# leftwm template.liquid
	sed -i -e '0,/%{T1}%{F#....../s//%{T1}%{F'$AC'/' $TFILE
	sed -i -e '0,/{{tag.name}}%{F#....../s//{{tag.name}}%{F'$AC'/' $TFILE

	# polybar
	sed -i -e 's/background = #.*/background = #FFFFFF/g' $PFILE
	sed -i -e 's/background-alt = #.*/background-alt = #E7E7E7/g' $PFILE
	sed -i -e 's/foreground = #.*/foreground = #0a0a0a/g' $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #0a0a0a/g' $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	sed -i -e 's/red = #.*/red = #B71C1C/g' $PFILE
	sed -i -e 's/yellow = #.*/yellow = #F57F17/g' $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   #FFFFFFFF;
	  bga:  #E7E7E7FF;
	  fga:  #0a0a0aFF;
	  fg:   #0a0a0aFF;
	  ac:   ${AC}FF;
	}
	EOF

	polybar-msg cmd restart

	leftwm-command SoftReload
}

if  [[ $1 = "--amber" ]]; then
	AC="#ffb300"
	change_color
elif  [[ $1 = "--blue" ]]; then
	AC="#1e88e5"
	change_color
elif  [[ $1 = "--blue-gray" ]]; then
	AC="#546e7a"
	change_color
elif  [[ $1 = "--brown" ]]; then
	AC="#6d4c41"
	change_color
elif  [[ $1 = "--cyan" ]]; then
	AC="#00acc1"
	change_color
elif  [[ $1 = "--deep-orange" ]]; then
	AC="#f4511e"
	change_color
elif  [[ $1 = "--deep-purple" ]]; then
	AC="#5e35b1"
	change_color
elif  [[ $1 = "--green" ]]; then
	AC="#43a047"
	change_color
elif  [[ $1 = "--gray" ]]; then
	AC="#757575"
	change_color
elif  [[ $1 = "--indigo" ]]; then
	AC="#3949ab"
	change_color
elif  [[ $1 = "--light-blue" ]]; then
	AC="#039be5"
	change_color
elif  [[ $1 = "--light-green" ]]; then
	AC="#7cb342"
	change_color
elif  [[ $1 = "--lime" ]]; then
	AC="#c0ca33"
	change_color
elif  [[ $1 = "--orange" ]]; then
	AC="#fb8c00"
	change_color
elif  [[ $1 = "--pink" ]]; then
	AC="#d81b60"
	change_color
elif  [[ $1 = "--purple" ]]; then
	AC="#8e24aa"
	change_color
elif  [[ $1 = "--red" ]]; then
	AC="#e53935"
	change_color
elif  [[ $1 = "--teal" ]]; then
	AC="#00897b"
	change_color
elif  [[ $1 = "--yellow" ]]; then
	AC="#fdd835"
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--amber	--blue		--blue-gray	--brown
	--cyan	--deep-orange	--deep-purple	--green
	--gray	--indigo	--light-blue	--light-green
	--lime	--orange	--pink		--purple
	--red	--teal		--yellow
	_EOF_
fi