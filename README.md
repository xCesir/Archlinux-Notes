# Arch-Linux
 My arch linux installation

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

## Programme

[Programme](./Programme.md)

## Commands

[Commands](./Commands.md)

## VFIO

[VFIO](./VFIO.md)

## Qemu

[Qemu](./Qemu.md)

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
