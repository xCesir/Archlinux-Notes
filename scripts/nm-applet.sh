#!/bin/bash
if [ $XDG_CURRENT_DESKTOP = GNOME ] || [ $XDG_CURRENT_DESKTOP = COSMIC ]
then 
	pkill "nm-applet"
else
	echo "Process not found"
fi
