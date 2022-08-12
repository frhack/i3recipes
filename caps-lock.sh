#!/bin/bash
#led=`cat /sys/class/leds/input?::capslock/brightness`
file=`ls /sys/class/leds/input?::capslock/brightness`

a=`i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name" | wc -l`
# one window at time
#i3-msg scratchpad show 
i3-msg "[class=.*] scratchpad show"
b=`i3-msg -t get_tree | jq ".nodes|.[]|.|.nodes|.[]|.nodes|.[]|select(.name==\"__i3_scratch\")|.floating_nodes|.[]|.nodes|.[]|.name" | wc -l`

if [ "$a" -gt "$b" ]; then
   echo 1 > $file
else
   echo 0 > $file
fi
