#!/bin/bash
if [ $XDG_CURRENT_DESKTOP = GNOME ] || [ $XDG_CURRENT_DESKTOP = COSMIC ] || [ $XDG_CURRENT_DESKTOP = KDE ]
then 
	pkill "blueman-applet"
else
	echo "Process not found"
fi
