# Arch-Linux
 My arch linux installation

 [Beispiellink](./Programme.md)

## create usb

## run guided install

````
archinstall --script guided
````

## Wayland (disable)
````
/etc/gdm/custom.conf 
````

## Falsche Keymop in LUKS
````
sudo mkinitcpio -P
````
## LUKS

[Luks](./Luks.md)

## Laptop Bluetooth not working

Es ist häufig der Fall, dass der Service nicht aktiviert ist

````
systemctl enable bluetooth
systemctl start bluetooth
````

## fonts
````
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
````

## firejail firefox
````
firejail --private --dns=1.1.1.1 --dns=9.9.9.9 firefox -no-remote
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
