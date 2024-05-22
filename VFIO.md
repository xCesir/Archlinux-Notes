# [VFIO](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF) für UKI

## Motherboard

enable IOMMU and related

## Loading vfio-pci early

### config
````
/etc/mkinitcpio.conf
````
Note: amdgpu durch den treiber für die main gpu ersetzen
````
MODULES=(... vfio_pci vfio vfio_iommu_type1 amdgpu ...)
````
````
HOOKS=(... modconf ...)
````

### load
````
sudo mkinitcpio -P
````
## PCI Device

#### List der Geräte mit ID

````
lspci -nnk
````

### add gpu

````
/etc/kernel/cmdline 
````
Example 2er IDs GPU und GPU-Audio
````
vfio-pci.ids=8086:56a5,8086:4f92
````
### load
````
sudo mkinitcpio -P
````
## X is not working
https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF#X_does_not_start_after_enabling_vfio_pci

## Reconfigure Xorg (maybe working?)

[Reddit](https://askubuntu.com/questions/1317929/force-xorg-to-use-amd-gpu-over-nvidia-gpu/1438355#1438355)

### Check if /etc/X11/xorg.conf already exists

#### If not, create it via Xorg -Configure (requires no active X session):
  Drop to TTY session (e.g. ctrl+alt+F3)<br>
  Stop gnome desktop manager service gdm stop<br>
  Xorg -configure<br>
  sudo cp /home/$USER/xorg.conf.new /etc/X11/xorg.conf
#### If it does, make a backup sudo cp /etc/X11/xorg.conf /etc/X11/xorg.conf.bak
  Uncomment Nvidia-GPU related Decive section in the xorg.conf.
#### Reboot
#### If the computer doesn't want to boot anymore, go into recovery mode and either delete /etc/X11/xorg.conf or roll out the backup.
