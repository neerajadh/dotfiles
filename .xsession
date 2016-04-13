#!/bin/bash

#xrdb -merge .xresources

# Let my own statusbar do the statusing
/home/neeraj/code/dwmstatus/dwmstatus &

# No bell
xset b off
# Start nitrogen
# nitrogen --restore &
# Start terminator
# terminator &
# Start redshift with lalitpur co-ordinates
redshift -l 27.682616:85.323944 &
# Lets have some eye candy!
compton -cCGf --shadow-exclude 'x=0 && y=0' &

exec dwm
