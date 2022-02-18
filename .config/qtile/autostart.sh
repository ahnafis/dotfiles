#!/bin/sh

killall -q ibus-daemon flameshot redshift nitrogen polybar picom

flameshot &
picom &
redshift -l 23.707310:90.415482 -m randr -t 4250:3250 &
nitrogen --restore
