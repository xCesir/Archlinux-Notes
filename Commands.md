# Command

## Watch / Reload Terminal
watch lässt einen Command in einem geben Zeitinterval '-n Sekunden' immer wieder Ausgaben, in diesem Fall den Befehl 'sensors'
````bash
watch -n 2 sensors
````
## Print verfügbare Keyboard layouts
````
localectl list-keymaps
````
## set tty
````
kbdrate -d 300 -r 30
loadkeys de-latin1
````
## Konsole print Battery Status
````
upower -d
````
