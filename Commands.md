# Command

## Watch / Reload Terminal
run continously in terminal
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
