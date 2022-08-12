#!/bin/sh
xclip -o -selection primary > /home/frank/.primarysel_old.txt
cat /home/frank/.primarysel.txt | xclip -i -selection primary 
xsel | xvkbd -delay 0 -xsendevent -file - 2>/dev/null
cat /home/frank/.primarysel_old.txt | xclip -i -selection primary 
#xdotool click 2
