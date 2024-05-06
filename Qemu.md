# Qemu

## links
[Extern](https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/)
[Reddit Nested](https://www.reddit.com/r/archlinux/comments/j4j2ah/amd_nested_virtualization_in_linux/?rdt=57770)
[Nested](https://ostechnix.com/how-to-enable-nested-virtualization-in-kvm-in-linux/)

## install

````bash
sudo pacman -S qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode swtpm libguestfs spice-vdagent
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
sudo usermod -a -G libvirt $(logname)
newgrp libvirt
groups $(logname)
````
````
sudo systemctl restart libvirtd.service
````
## Enable Nested Virtualization In KVM In Linux
Before enabling nested VT feature, power off all running VMs.

Next, unload KVM modules.

To unload KVM module on INTEL systems, run:
````
$ sudo modprobe -r kvm_intel
````

On AMD systems:
````
$ sudo modprobe -r kvm_amd
````
Reload the KVM module with the nested feature enabled on INTEL CPUs with command:
````
$ sudo modprobe kvm_intel nested=1
````
Reload the KVM module with the nested feature enabled on AMD CPUs using command:
````
$ sudo modprobe kvm_amd nested=1
````
Enable Nested Virtualization Permanently

Please note that nested VT feature is only enabled until your reboot the KVM host system. To permanently enable the nested feature, edit /etc/modprobe.d/kvm.conf file:
````
$ sudo vi /etc/modprobe.d/kvm.conf
````
If the file doesn't exists, just create it.

Add the following line on INTEL hosts:
````
options kvm_intel nested=1
````
Add the following line on AMD hosts:
````
options kvm_amd nested=1
````
Save and close the file.

Done! We have enabled nested VT on KVM host system.

Verify If Nested Virtualization Is Enabled In KVM Host
If your processor is INTEL, check the "/sys/module/kvm_intel/parameters/nested" file using "cat" command:
````
$ cat /sys/module/kvm_intel/parameters/nested
````
If it returns "Y" or "1", it means that your system supports nested virtualization. If the output is "N" or "0", your system won't support nested virtualization.

If your processor is AMD, check the contents of "/sys/module/kvm_amd/parameters/nested" file.

Alternatively, you can use the following command to ensure "kvm_intel" kernel module has nesting enabled:
````
$ modinfo kvm_intel | grep -i nested
````
Sample output:
````
parm:           nested_early_check:bool
parm:           nested:bool
````
On AMD CPU:
````
$ modinfo kvm_amd | grep -i nested
````

Well, my KVM host supports nested virtualization and it is already enabled.
Enable Nested Virtualization On KVM Guest Machines
We can enable nested feature on a KVM VM either from command line or using a graphical KVM management applications like Virt-manager.

Enable nested feature in KVM guests from command line
Log in to the virsh console:
````
$ virsh
````
Edit the VM in which you want to enable nested feature:
````
virsh # edit centos
````
To find the all available VMs, run this command inside virsh console:
````
virsh # list --all
````
Find "cpu mode" parameter and set its value as "host-model".
````
<cpu mode='host-model' check='partial'/>
````
Save and close the file.

Start the VM:
````
virsh # start centos8
````
Verify if nested feature is enabled for the VM:
````
virsh # dumpxml centos8
````
You should see all the necessary feature policies under "cpu mode" directive are updated now:
````
<cpu mode='custom' match='exact' check='full'>
    <model fallback='forbid'>SandyBridge-IBRS</model>
    <vendor>Intel</vendor>
    <feature policy='require' name='vme'/>
    <feature policy='require' name='vmx'/>
    <feature policy='require' name='pcid'/>
    <feature policy='require' name='hypervisor'/>
    <feature policy='require' name='arat'/>
    <feature policy='require' name='tsc_adjust'/>
    <feature policy='require' name='umip'/>
    <feature policy='require' name='md-clear'/>
    <feature policy='require' name='stibp'/>
    <feature policy='require' name='arch-capabilities'/>
    <feature policy='require' name='ssbd'/>
    <feature policy='require' name='xsaveopt'/>
    <feature policy='require' name='ibpb'/>
    <feature policy='require' name='amd-ssbd'/>
    <feature policy='require' name='skip-l1dfl-vmentry'/>
    <feature policy='disable' name='aes'/>
  </cpu>
````

Nested virtualization feature has been enabled for CentOS 8 VM.

Enable Nested Feature In KVM Guests Using Virt-manager
Open Virt-manager GUI application and double click the KVM guest in which you want to enable nested VT feature. Click on the "Show virtual hardware details" button and go to the "CPUs" section in left menu.

Select the "Copy host CPU configuration" check box in the CPU configuration window and click Apply.

Now the physical host's CPU model and configuration will be applied to the VM.

Check If The KVM Guests Supports Virtualization
Power on and log in to the KVM guest machine in which you enabled the nested feature.

Run the following command in the KVM guest's Terminal to verify if the Virtualization is enabled or not:
````
# egrep --color -i "svm|vmx" /proc/cpuinfo
````

If you see “vmx” (Intel-VT technology) or “svm” (AMD-V support) in the output, the KVM guest machine can work as a hypervisor and host VMs. As you can see in the above output, my CentOS 8 KVM VM supports virtualization.

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
