#! /bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar laptop-screen &

if [[ $(xrandr -q | grep 'DP-1 connected') ]]; then
  polybar external-screen &
fi