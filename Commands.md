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

## v4l2 loopback camera zu dummy device
Warum? Skalierung, v/hFlip, fps, fomrat
create dummy device
```
v4l2loopback-ctl add /dev/video2 
```
load module and redirect 2 dummy device
```
modprobe v4l2loopback exclusive_caps=1
ffmpeg -f v4l2 -input_format mjpeg -i /dev/video0 -vf "hflip,format=yuyv422" -f v4l2 /dev/video2
```
oder
```
ffmpeg -f v4l2 -input_format mjpeg -framerate 30 -video_size 1920x1080 -i /dev/video0 -vf "format=yuyv422" -f v4l2 /dev/video2
```
