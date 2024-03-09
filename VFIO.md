# [VFIO](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF) für UKI

## Motherboard

enable IOMMU and related

## Loading vfio-pci early

### config
````
/etc/mkinitcpio.conf
````
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

#### List

````
lspci -nnk
````

### add gpu

````
/etc/kernel/cmdline 
````
````
vfio-pci.ids=8086:56a5,8086:4f92
````
