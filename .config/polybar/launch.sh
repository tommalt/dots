#!/bin/sh

#kill existing bars
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

for monitor in `xrandr | grep ' connected' | cut -d' ' -f1`; do
	MONITOR=$monitor polybar mine &
done
