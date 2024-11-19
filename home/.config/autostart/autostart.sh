#!/usr/bin/env bash

redshift -x
redshift &

killall -q blueman-applet
blueman-applet &

killall -q ibus-daemon
ibus-daemon &

setxkbmap -option caps:swapescape &

killall -q flameshot
flameshot &

# XFCE specific auto start commands.
if [ "$GDMSESSION" == "xfce" ]; then
  plank
fi

# BSPWM specific auto start commands.
if [ "$GDMSESSION" == "bspwm" ]; then
  pgrep -x sxhkd > /dev/null || sxhkd &

  bash ~/.config/polybar/launch.sh &

  killall -q walgen
  walgen > /dev/null &
fi
