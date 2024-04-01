# Qemu

## links
[Extern](https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/)

## install

````bash
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode swtpm libguestfs
````

````
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
````

## config

````
sudo nano /etc/libvirt/libvirtd.conf
````
uncomment:
````
#unix_sock_group = "libvirt"
#unix_sock_ro_perms = "0777"  # set to 0770 to deny non-group libvirt users
#unix_sock_rw_perms = "0770"
#auth_unix_ro = "none"
#auth_unix_rw = "none"
````
save and exit

````
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
````
````
sudo systemctl restart libvirtd.service
````
````
sudo modprobe -r kvm_amd
sudo modprobe kvm_amd nested=1
````
````
echo "options kvm-amd nested=1" | sudo tee /etc/modprobe.d/kvm-amd.conf
````

## virtual networks
````
virsh net-list --all
````
### if default existst:

````
Name                 State      Autostart
-----------------------------------------
default              active     yes
````

````
virsh net-autostart default
virsh net-start default
````

### if default does not existst:

````
Name                 State      Autostart
-----------------------------------------

````
open virt-manager > Edit > Connection Details > '+' > name: 'default'
````
