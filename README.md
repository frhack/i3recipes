# i3recipes



Here are my very simple configurations and minimal scripts to obtain the following features:
### primary selection register
  After selected some text with shift+left click the primary selection is memorized, afterwards you can paste with shift+middle click
### scratchpad hide/unhide
 Press caps-lock to hide/unhide the windows in the scratchpad one after the other. The caps lock led indicate the scratchpad visibility
### scratchpad carousel
  Press alt-tab to show the next window in the scratchpad. 
### move to scratchpad
  Press mod+z to move window to scratchpad and turn off the capslock light


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
```

CAPS LOCK led requires sudo:

```bash
echo "frank  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/frank
```


