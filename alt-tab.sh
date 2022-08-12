#!/bin/bash
#led=`sudo cat /sys/class/leds/input?::capslock/brightness`
file=`sudo ls /sys/class/leds/input?::capslock/brightness`

a=`i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name" | wc -l`
i3-msg scratchpad show
b=`i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name" | wc -l`

if [ "$a" -lt "$b" ]; then
   i3-msg scratchpad show
fi
sudo echo 1 > $file
echo "TAB" > "/home/frank/.wslast"
