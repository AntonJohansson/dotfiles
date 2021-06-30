#!/bin/sh

# Disable "Disable While Typing"
xinput set-prop 13 310 0
xinput set-prop 13 "libinput Accel Speed" -0.25
xinput set-prop "Logitech USB Optical Mouse" "libinput Accel Speed" -1
xset r rate 250 100
setxkbmap "se(nodeadkeys)"

# Remap keys for broken mac keyboard
#xmodmap -e "keycode 133 = Mode_switch NoSymbol"
#xmodmap -e "keycode 43 = h H g G"
