# Security

## Firewall 

### firewalld (recommended)
```bash
sudo pacman -S firewalld
sudo systemctl enable firewalld.service
sudo systemctl start firewalld.service
```

#### firewalld QT tray applet
```bash
sudo pacman -S python-pyqt5
```
### [UFW](https://wiki.archlinux.org/title/Uncomplicated_Firewall)

```bash
sudo pacman -S ufw ufw-extras gufw
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw enable
```
Note: Kann zu Problemen bei libvirt Verbindungen führen (Stand 2024-06-07) die für VM nötig sind

## Secure Boot with [sbctl](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Assisted_process_with_sbctl)
First set secure boot mode to [Setup mode](https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface/Secure_Boot#Putting_firmware_in_%22Setup_Mode%22)
```bash
sudo pacman -S sbctl
```
Once you log back in, check the secure boot status:

```
sbctl status
```

You should see that sbctl is not installed and secure boot is disabled.

Then create your custom secure boot keys:

```
sbctl create-keys
```

Enroll your keys, with Microsoft's keys, to the UEFI:

```
sbctl enroll-keys -m
```
Check the secure boot status again:

```
sbctl status
```

sbctl should be installed now, but secure boot will not work until the boot files have been signed with the keys you just created.

### Signing

Check what files need to be signed for secure boot to work:

```
sbctl verify
```

Now sign all the unsigned files. Usually the [kernel](https://wiki.archlinux.org/title/Kernel "Kernel") and the [boot loader](https://wiki.archlinux.org/title/Boot_loader "Boot loader") need to be signed. For example:

```
sbctl sign -s /boot/vmlinuz-linux
sbctl sign -s /boot/EFI/BOOT/BOOTX64.EFI
...
```
The files that need to be signed will depend on your system's layout, kernel and boot loader.

reboot and enable secure boot.

## clamAV
```bash
sudo pacman -S clamav
```

edit `/etc/clamav/clamd.conf` as needed if you need help see [Configuration](https://wiki.archlinux.org/title/ClamAV#Configuration)

add `VirusEvent /etc/clamav/virus-event.bash` in `sudo nvim /etc/clamav/clamd.conf`

add `clamav ALL = (ALL) NOPASSWD: SETENV: /usr/bin/notify-send` in `/etc/sudoers.d/clamav`

create `sudo nivm /etc/clamav/virus-event.bash`
```bash
#!/bin/bash
PATH=/usr/bin
ALERT="Signature detected by clamav: $CLAM_VIRUSEVENT_VIRUSNAME in $CLAM_VIRUSEVENT_FILENAME"

# Send an alert to all graphical users.
for ADDRESS in /run/user/*; do
    USERID=${ADDRESS#/run/user/}
    /usr/bin/sudo -u "#$USERID" DBUS_SESSION_BUS_ADDRESS="unix:path=$ADDRESS/bus" PATH=${PATH} \
        /usr/bin/notify-send -t 2000 -u normal -h "string:desktop-entry:org.kde.konsole" -a "clamAV" -i /etc/clamav/ClamAV_Logo.png "Incident found!" "$ALERT"
done
```
[ClamAV Logo](https://upload.wikimedia.org/wikipedia/commons/f/f2/ClamAV_Logo.png) used in script

in`sudo systemctl edit clamav-clamonacc.service` add:
```bash
[Service]
ExecStart=
ExecStart=/usr/sbin/clamonacc -F --fdpass --log=/var/log/clamav/clamonacc.log
```

then

```bash
sudo aa-complain clamd
```

then

```bash
sudo freshclam
```

then

```bash
sudo systemctl enable --now clamav-freshclam.service clamav-clamonacc.service clamav-daemon.service
```

for testing see [testing clamAV](https://wiki.archlinux.org/title/ClamAV#Testing_the_software)






