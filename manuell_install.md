# Installation manuell
Um die Tastaturbelegung zu setzen, übergeben Sie deren Namen an loadkeys. Zum Beispiel, um eine deutsche Tastaturbelegung zu setzen:
```
loadkeys de-latin1
```
---
Zuerst müssen wir den Namen unseres Laufwerks finden:
```
lsblk
```
```
NAME  MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0   7:0    0   673M  1 loop /run/archiso/airootfs
sr0    11:0    1 793.3M  0 rom  /run/archiso/bootmnt
vda   254:0    0    30G  0 disk 
```

Für genauere Infos zu den Laufwerken:
```
lshw -class disk -class storage
```

---

Unser Laufwerk ist in diesem Fall /dev/vda/, also verwenden wir sgdisk, um die Festplatte einzurichten:
```
sgdisk -Z /dev/vda
sgdisk -n1:0:+1G -t1:ef00 -c1:EFI -N2 -t2:8304 -c2:LINUXROOT /dev/vda
partprobe -s /dev/vda
```
---

Wir sollten nun eine EFI-Partition auf `/dev/vda1` und unsere Root-Partition auf `/dev/vda2` haben.

```
lsblk /dev/vda
```
```
NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
vda    254:0    0   30G  0 disk 
├─vda1 254:1    0  512M  0 part 
└─vda2 254:2    0 29.5G  0 part
```

---

Verschlüsseln wir unsere Root-Partition mit LUKS, indem wir cryptsetup verwenden:

```
cryptsetup luksFormat --type luks2 /dev/vda2
cryptsetup open /dev/vda2 linuxroot
```
---

Erstellen wir die Dateisysteme:
```
mkfs.vfat -F32 -n EFI /dev/vda1
mkfs.btrfs -f -L linuxroot /dev/mapper/linuxroot
```

---

Hängen wir unsere Partitionen ein und erstellen unsere btrfs-Subvolumes:

```
mount /dev/mapper/linuxroot /mnt
mkdir /mnt/efi
mount /dev/vda1 /mnt/efi
btrfs subvolume create /mnt/home
btrfs subvolume create /mnt/srv
btrfs subvolume create /mnt/var
btrfs subvolume create /mnt/var/log
btrfs subvolume create /mnt/var/cache
btrfs subvolume create /mnt/var/tmp
```
---

## Base install

Aktualisieren wir die pacman-Spiegel und erstellen wir mit pacstrap eine Basisinstallation:
```
reflector --country Germany --age 24 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
pacstrap -K /mnt base base-devel linux linux-firmware amd-ucode vim nano cryptsetup btrfs-progs dosfstools util-linux git unzip kitty networkmanager sudo
```

---

Aktualisieren Sie unsere Spracheinstellungen:
```
sed -i -e "/^#"de_DE.UTF-8"/s/^#//" /mnt/etc/locale.gen
systemd-firstboot --root /mnt --prompt
```

```
Welcome to your new installation of Arch Linux!
Please configure your system!

-- Press any key to proceed --
‣ Please enter system keymap name or number (empty to skip, "list" to list options): de-latin1
/mnt/etc/vconsole.conf written.
‣ Please enter timezone name or number (empty to skip, "list" to list options): Europe/Berlin
/mnt/etc/localtime written
‣ Please enter hostname for new system (empty to skip): archlinux
/mnt/etc/hostname written.

arch-chroot /mnt locale-gen
Generating locales...
  de_DE.UTF-8... done
Generation complete.
```
---
## Anlegen von Benutzern

Wir erstellen unser lokales Benutzerkonto, in diesem Fall den Benutzernamen `user`, ...

... füge die `sudo`-Guppe hinzu und geben sudo-Rechte:

### sudo (recommended):
```
arch-chroot /mnt useradd -G sudo -m user 
arch-chroot /mnt passwd user
echo "user ALL=(ALL) ALL" >> /mnt/etc/sudoers.d/00_user
```
... füge die `wheel`-Gruppe hinzu und geben der wheel-Gruppe sudo-Rechte:

### Wheel (not recommended):
```
arch-chroot /mnt useradd -G sudo -m user 
arch-chroot /mnt passwd user
sed -i -e '/^# %sudo ALL=(ALL:ALL) ALL/s/^# //' /mnt/etc/sudoers
```

---
## Unified Kernel Image

Wir wollen Unified Kernel Images erstellen, also erstellen wir zuerst unsere Kernel `cmdline`-Datei.

```
echo "quiet rw" >> /mnt/etc/kernel/cmdline
```
---

EFI-Ordnerstruktur erstellen:

```
mkdir -p /mnt/efi/EFI/Linux
```
---

Wir müssen die HOOKS in der Datei mkinitcpio.conf ändern, um systemd zu verwenden, so dass Ihre Datei wie folgt aussieht

```
vim /mnt/etc/mkinitcpio.conf
```

```
# vim:set ft=sh
MODULES=(btrfs)

BINARIES=()

FILES=()

HOOKS=(base systemd autodetect microcode modconf kms keyboard keymap sd-vconsole sd-encrypt block filesystems fsck)
```
---
Und nun aktualisieren wir die .preset-Datei, um eine UKI zu erzeugen:

```
nvim /mnt/etc/mkinitcpio.d/linux.preset
```
```
# mkinitcpio preset file to generate UKIs

ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-linux"

PRESETS=('default' 'fallback')

#default_config="/etc/mkinitcpio.conf"
#default_image="/boot/initramfs-linux.img"
default_uki="/efi/EFI/Linux/arch-linux.efi"
default_options="--splash /usr/share/systemd/bootctl/splash-arch.bmp"

#fallback_config="/etc/mkinitcpio.conf"
#fallback_image="/boot/initramfs-linux-fallback.img"
fallback_uki="/efi/EFI/Linux/arch-linux-fallback.efi"
fallback_options="-S autodetect"
```
---

Und UKIs generieren:
```
arch-chroot /mnt mkinitcpio -P
```

---

Wenn wir einen Blick in unsere EFI-Partition werfen, sollten wir unsere UKIs sehen:
```
ls -lR /mnt/efi
```
```
/mnt/efi:
total 4
drwxr-xr-x 3 root root 4096 Aug 25 20:51 EFI

/mnt/efi/EFI:
total 4
drwxr-xr-x 2 root root 4096 Aug 25 21:02 Linux

/mnt/efi/EFI/Linux:
total 118668
-rwxr-xr-x 1 root root 29928960 Aug  9 14:07 arch-linux.efi
-rwxr-xr-x 1 root root 91586048 Aug  9 14:07 arch-linux-fallback.efi
```
---

## Services and Boot Loader

OK, wir sind fast fertig mit dem Archiso, wir müssen nur noch einige Dienste aktivieren und unseren Bootloader installieren:

```
systemctl --root /mnt enable systemd-resolved systemd-timesyncd NetworkManager
systemctl --root /mnt mask systemd-networkd
arch-chroot /mnt bootctl install --esp-path=/efi
```
```
sync
systemctl reboot --firmware-setup
```
## ... und was jetzt?

- https://wiki.archlinux.org/title/General_recommendations
- https://github.com/SJ-Plan-B/Archlinux-Notes-By-xCesir/blob/main/README.md
- https://wiki.archlinux.org/title/List_of_applications
