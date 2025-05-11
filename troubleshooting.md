# troubleshooting

## coolercontrol-bin not showing up properly
https://gitlab.com/coolercontrol/coolercontrol/-/issues/405
```
env __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=ngl GALLIUM_DRIVER=ngl coolercontrol
```
### autostart
`~/.config/autostart/coolercontrol.desktop`
```bash
[Desktop Entry]
Comment[en_US]=
Comment=
Exec=env __GLX_VENDOR_LIBRARY_NAME=mesa __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/50_mesa.json MESA_LOADER_DRIVER_OVERRIDE=ngl GALLIUM_DRIVER=ngl /bin/coolercontrol
GenericName[en_US]=coolercontrol
GenericName=coolercontrol
Icon=coolercontrol
MimeType=
Name[en_US]=coolercontrol
Name=coolercontrol
Path=
StartupNotify=false
Terminal=false
TerminalOptions=
Type=Application
X-GNOME-Autostart-Delay=10
X-GNOME-Autostart-enabled=true
X-KDE-SubstituteUID=false
X-KDE-Username=
```
alternativ von coolercontrol-bin auf coolercontrol wechseln.

## Schwarz Box um Gnome 47 Apps mit amdvlk driver
`GSK_RENDERER=ngl` and `VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json` in `/etc/environment`


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

oder:
````
pcie_aspm=off acpi_enforce_resources=lax
````

## [Possibly missing firmware for module XXXX](https://wiki.archlinux.org/title/Mkinitcpio#Possibly_missing_firmware_for_module_XXXX)
````
yay -S mkinitcpio-firmware
````

# AppImage require FUSE to run
```
sudo pacman -S fuse2
```
