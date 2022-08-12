# i3recipes



Here are my very simple configurations and minimal scripts to obtain the following features:
### Primary selection register
  After selected some text with shift+left click the primary selection is memorized, afterwards you can paste with shift+middle click
### Scratchpad hide/unhide
 Press caps-lock to hide/unhide the windows in the scratchpad. The caps lock led indicate the scratchpad visibility
### scratchpad carousel
  Press alt-tab to show the next window in the scratchpad. 
### Move window to the scratchpad
  Press mod+z to move the focused window to the scratchpad and turn off the capslock light
### Show the scratchpad as new workspace
  Press mod+\` to show all the windows in the scratchpad in a new workspace (capslock led turn on). 
  Press mod+\` again to come back to the starting workspace  (capslock led turn off). 



## packages required:
```bash
sudo apt install xclip xsel  xvkbd
```

## install

execute:

```bash
sudo setxkbmap -option ctrl:nocaps
```

In /etc/default/keyboard add

```bash
XKBOPTIONS="ctrl:nocaps"
```


In .xbindkeyssrc add:


```bash
"/home/frank/primary-copy.sh"
  shift + b:1
"/home/frank/primary-paste.sh"
  shift + b:2 + Release
"sudo /home/frank/caps-lock.sh"
  c:66
"sudo /home/frank/alt-tab.sh"
  Alt + Tab
"sudo /home/frank/scratchpad-move.sh"
  Mod4 + z
"sudo /home/frank/scratchpad-show.sh"
  m:0x40 + c:49
```

CAPS LOCK led requires sudo:

```bash
echo "frank  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/frank
```


