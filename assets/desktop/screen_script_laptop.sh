#!/bin/sh

if xrandr | grep "HDMI-1 connected"; then
    xrandr --output DP-1 --off --output eDP-2 --primary --mode 2560x1440 --rate 240 --pos 1920x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 0x180 --rotate normal --rate 60
else
    xrandr --output DP-1 --off --output eDP-2 --primary --mode 2560x1440 --rate 240 --pos 1920x0 --rotate normal --output HDMI-1 --off
fi
