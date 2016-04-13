#!/bin/bash

#xrdb -merge .xresources

# Status Bar
while true; do
    # Power/Battery Status
    if [ "$( cat /sys/class/power_supply/ACAD/online )" -eq "1" ]; then
        DWM_BATTERY="AC";
        DWM_RENEW_INT=3;
    else
        DWM_BATTERY=$(expr `cat /sys/class/power_supply/BAT1/charge_now` "*" 100 / `cat /sys/class/power_supply/BAT1/charge_full` );
        DWM_RENEW_INT=10;
    fi;
    # WiFi eSSID
    if [ "$( /sbin/iwgetid -r )" ]; then
        DWM_ESSID=$( /sbin/iwgetid -r );
    else
        DWM_ESSID="OFF";
    fi;

    # IBus keyboard
    DWM_KBD=$( ibus engine | cut -d : -f 2 );
    if [ $DWM_KBD == "us" ]; then
        DWM_KBD="en";
    elif [ $DWM_KBD == "hi" ]; then
        DWM_KBD="ne";
    fi;

    # Volume level
    # DWM_VOL=$( amixer -c1 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

    # Date and Time
    DWM_CLOCK=$( date '+%e %b %Y %a %k:%M' );

    # Overall output
    DWM_STATUS="⇅ $DWM_ESSID ⚡ $DWM_BATTERY ⌨ $DWM_KBD | $DWM_CLOCK";
    xsetroot -name "$DWM_STATUS"
    sleep $DWM_RENEW_INT;
done &

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
