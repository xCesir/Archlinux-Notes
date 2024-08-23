#!/bin/bash
if [ $XDG_CURRENT_DESKTOP = GNOME ]
then 
	pkill xwaylandvideobr
else
	echo "Process not found"
fi
