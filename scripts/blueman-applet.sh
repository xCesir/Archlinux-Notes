#!/bin/bash
if [ $XDG_CURRENT_DESKTOP = GNOME ] || [ $XDG_CURRENT_DESKTOP = COSMIC ]
then 
	pkill "blueman-applet"
else
	echo "Process not found"
fi
