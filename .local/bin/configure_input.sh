#!/bin/sh

xinput set-prop "Logitech USB Optical Mouse" "libinput Accel Speed" -1
xset r rate 250 100
setxkbmap "se(nodeadkeys)"
