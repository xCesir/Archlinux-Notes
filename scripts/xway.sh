#!/bin/bash
if [ $XDG_CURRENT_DESKTOP = GNOME ] || [ $XDG_CURRENT_DESKTOP = COSMIC ] || [ $XDG_CURRENT_DESKTOP = KDE ]
then 
	if pgrep -x "xwaylandvideobr" > /dev/null
	then
	    echo "Running"
	    pkill "xwaylandvideobr"
	else
	    echo "Stopped"
	fi
else
	echo "Process not found"
fi
