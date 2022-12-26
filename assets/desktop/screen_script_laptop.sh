#!/bin/sh

if xrandr | grep "HDMI-0 connected"; then
    xrandr --output DP-1 --off --output eDP-1-1 --primary --mode 2560x1440 --rate 240 --pos 1920x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 0x180 --rotate normal --rate 60
else
    xrandr --output DP-1 --off --output eDP-1-1 --primary --mode 2560x1440 --rate 240 --pos 1920x0 --rotate normal --output HDMI-0 --off
fi

feh --bg-fill ~/.config/wallpaper.jpg
systemctl --user restart polybar
