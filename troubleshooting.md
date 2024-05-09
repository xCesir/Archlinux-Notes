# troubleshooting

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
