#!/bin/bash
file=`ls /sys/class/leds/input?::capslock/brightness`
i3-msg move scratchpad
echo 0 > $file
