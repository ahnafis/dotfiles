#!/usr/bin/env bash

killall -q polybar
bash ~/.config/polybar/launch.sh &

setxkbmap -option caps:swapescape &

redshift -x
redshift &

killall -q flameshot
flameshot &

killall -q blueman-applet
blueman-applet &

killall -q nm-applet
nm-applet &

killall -q walgen
walgen &
