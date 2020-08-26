#!/bin/bash

export MON_BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)

echo "(($MON_BRIGHTNESS+180))" > /sys/class/backlight/intel_backlight/brightnews
