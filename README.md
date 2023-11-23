# Arch-Linux
 My arch linux installation

## create usb

## run guided install

````
archinstall --script guided
````

## after installation as chroot


When you run grub-install by default it assumes the EFI system is mounted as /boot/efi

It depends on your distribution where EFI system is mounted and on some distributions it isn't mounted after boot.

First check if /boot/efi is mounted with

````
mount | grep /boot/efi
````

If that doesn't work first try the following to see if it is mounted elsewhere.
````
mount | grep /dev/[efi device]
````
If neither of those work do:
````
mount /dev/[efi device] /mnt
````
Now run:
````
grub-install --efi-directory=[efi dir]
grub-mkconfig -o /boot/grub/grub.cfg
````
*hab ich nicht genutzt*
where [efi dir] is either /boot/efi or /mnt and [efi device] is the device with the EFI system partition. If you don't know use the command lsblk -o NAME,PARTTYPE,MOUNTPOINT | grep -i "C12A7328-F81F-11D2-BA4B-00A0C93EC93B"
 
src:
https://unix.stackexchange.com/questions/405472/cannot-find-efi-directory-issue-with-grub-install