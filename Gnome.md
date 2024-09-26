# Gnome

## [Custom Wallpaper](https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/)

## [Pop-Shell](https://www.bing.com/search?&q=pop+shell+shorcuts) (Tilling WM)

#### mpv is not tilling properly

```
echo "no-keepaspect-window" >> ~/.config/mpv/mpv.conf
```

## sound volume overamplification
enable:
```
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true' 
```
disable:
```
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'false' 
```
