#! /bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar primary &

if [[ $(xrandr -q | grep 'DP-1 connected') ]]; then
  polybar secondary &
fi