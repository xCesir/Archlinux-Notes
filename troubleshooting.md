# troubleshooting

## Schwarz Box um Gnome 47 Apps mit amdvlk driver
`GSK_RENDERER=ngl` in `/etc/environment`

## Kein Internet virtuelle Maschinen
Mit dem letzten Update von UFW wird der Internet Verkehr von libvirt, welcher für virtuelle Maschinen notwendig ist, gestört.
Die bisherige Lösung ist es bei der [Firewall](./Firewall.md) von `UFW` zu `Firewalld` zu wechseln.

## Kleopatra
Akutell kann es dazu kommen, dass Kleopatra nicht startet nach den letzten Update wie in diesem [Forum-Post](https://bbs.archlinux.org/viewtopic.php?id=296219) beschrieben.
Die Lösung ist es via Console mit folgendem Befehl zu starten:
````
export QT_QPA_PLATFORM=XCB && kleopatra
````
oder permanente variable setzen
`QT_QPA_PLATFORM=xcb` in `~/.zshenv`

https://bbs.archlinux.org/viewtopic.php?id=296219
https://bugs.gentoo.org/933441

## fonts
````
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
````

## Laptop Bluetooth not working

Es ist häufig der Fall, dass der Service nicht aktiviert ist

````
systemctl enable bluetooth
systemctl start bluetooth
````
## Wayland (disable)

````
/etc/gdm/custom.conf 
````

## ASPM

So, FINALLY, i made it work by permanently setting (via bootloader) either one of the parameters below, to the kernel cmdline:
````
pcie_aspm.policy=powersave
````
````
pcie_aspm.policy=performance
````
Seems that the default policy is to have it read/set directly from the bios, but obviously that doesn't always work.

[Post](https://bbs.archlinux.org/viewtopic.php?id=260589)
[RedHeat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/power_management_guide/aspm)

## [Possibly missing firmware for module XXXX](https://wiki.archlinux.org/title/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX)
````
yay -S mkinitcpio-firmware
````

# AppImage require FUSE to run
```
sudo pacman -S fuse2
```
