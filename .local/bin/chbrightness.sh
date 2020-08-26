#!/bin/sh

# Arbitrary but unique message id
msgId="991044"

# Change the volume using alsa
sudo xbacklight "$@" > /dev/null

# Query amixer for the current volume and whether or not the speaker is muted
brightness="$(xbacklight -get)"

# Show the volume notification
dunstify -a "chbrightness" -u normal -i brightness-change -r "$msgId" \
	"Brightness: ${brightness}%"
