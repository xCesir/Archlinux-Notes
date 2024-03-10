# Qemu

## links
[Extern](https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/)

## install

````bash
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode
````
````
sudo pacman -S libguestfs
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

create default.xml:
````
sudo mkdir /usr/share/libvirt/networks/
sudo nano /usr/share/libvirt/networks/default.xml
````

````xml
<network>
  <name>default</name>
  <uuid>9a05da11-e96b-47f3-8253-a3a482e445f5</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:0a:cd:21'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
````
````
virsh net-define /usr/share/libvirt/networks/default.xml
````
````
virsh net-autostart default
virsh net-start default
````

### fehler:
internal error: Network is already in use by interface virbr0

````
sudo ifconfig virbr0 down
sudo brctl delbr virbr0
sudo virsh net-start default
````
