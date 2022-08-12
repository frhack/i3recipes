led=`cat /sys/class/leds/input?::capslock/brightness`
v=`i3-msg -t get_workspaces  | jq '.[] | select(.focused==true).name'  | cut -d"\"" -f2`
file=`ls /sys/class/leds/input?::capslock/brightness`
old=`cat /home/frank/.wsold`
status=`cat /home/frank/.wsstatus`


if [ "$led" -eq "1" ]; then
   i3-msg "[class=.*] scratchpad show"
fi
if [ "$status" -eq "1" ]; then
   i3-msg workspace $old
   echo 0 > $file
   echo 0 > "/home/frank/.wsstatus"
else
   i3-msg workspace $(($(i3-msg -t get_workspaces | tr , '\n' | grep '"num":' | cut -d : -f 2 | sort -rn | head -1) + 1))
   i3-msg "[class=.*] scratchpad show"
   echo 1 > $file
   echo $v > "/home/frank/.wsold"
   echo 1 > "/home/frank/.wsstatus"
fi




