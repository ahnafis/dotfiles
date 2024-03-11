#!/usr/bin/env bash

setxkbmap -option caps:swapescape &

redshift -x
redshift &

# XFCE specific auto start commands.
if [ "$GDMSESSION" == "xfce" ]; then
  plank
fi

# BSPWM specific auto start commands.
if [ "$GDMSESSION" != "bspwm" ]; then
  exit
fi

pgrep -x sxhkd > /dev/null || sxhkd &

bash ~/.config/polybar/launch.sh &

killall -q blueman-applet
blueman-applet &

killall -q flameshot
flameshot &

killall -q walgen
walgen > /dev/null &
