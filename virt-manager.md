# Virt-Manager

## Linux Guest

### GPU Passthrough

#### Set UEFI
UEFI x86_64: /usr/share/edk2/x64/OVMF_CODE.fd

#### Ändere xml in Overview

Ersetze den Abschitt `graphics` durch_

```xml
<graphics type="spice">
  <listen type="none"/>
  <image compression="off"/>
  <gl enable="no"/>
</graphics>
```
#### Video

Video Virtio: None

### Mount shared folder
```
sudo mount -t virtiofs {Target path (von Virt Filesystem)} {target in GuestOS}
```
Beispiel
```
sudo mount -t virtiofs mount_tag_pictures /mnt/pictures
```

### Linux guest tools

```
sudo pacman -S qemu-guest-agent spice-vdagent
sudo systemctl enable qemu-guest-agent
sudo systemctl start qemu-guest-agent
```
### Windows guest tools
[virtio-win-guest-tools.exe](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/)
[WinFSP](https://winfsp.dev)

