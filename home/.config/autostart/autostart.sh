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
if [ "$XDG_SESSION_DESKTOP" == "xfce" ]; then
  plank
fi

# BSPWM specific auto start commands.
if [ "$XDG_SESSION_DESKTOP" == "bspwm" ]; then
  pgrep -x sxhkd > /dev/null || sxhkd &

  bash ~/.config/polybar/launch.sh &

  killall -q walgen
  walgen > /dev/null &

  killall -q nm-applet
  nm-applet &

  xinput set-prop 10 313 1 1 &
fi
