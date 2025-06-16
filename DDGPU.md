# Set GPU
Wenn unter Linux mehrere dedizierte GPUs verwendet werden, kann es vorkommen, dass Wayland die falsche GPU als primäre GPU (`GPU0`) erkennt.\
Um dies zu korrigieren, kann man folgendermaßen vorgehen:
## `/etc/environment`:

### set [Mesa device](https://wiki.archlinux.org/title/Vulkan#Switching_between_devices) (recommended)
```bash
$ MESA_VK_DEVICE_SELECT=list vulkaninfo
selectable devices:
  GPU 0: 8086:56a5 "Intel(R) Arc(tm) A380 Graphics (DG2)" discrete GPU 0000:06:00.0
  GPU 1: 1002:744c "AMD Radeon RX 7900 XTX (RADV NAVI31)" discrete GPU 0000:10:00.0
  GPU 2: 1002:744c "AMD Radeon RX 7900 XTX" discrete GPU 0000:10:00.0
  GPU 3: 1002:744c "AMD Radeon RX 7900 XTX" discrete GPU 0000:10:00.0
  GPU 4: 10005:0 "llvmpipe (LLVM 19.1.7, 256 bits)" CPU 0000:00:00.0
```
```bash
MESA_VK_DEVICE_SELECT=1002:744c
```
### set GPU via PCI-Address (not recommended)
```
DRI_PRIME=pci-0000_10_00_0
```

# Set GPU AMDGPU driver
## set ICD 
### RADV
```
AMD_VULKAN_ICD=RADV
```
### AMDVLK
```
AMD_VULKAN_ICD=amdvlk # set amdvlk ICD Driver
```

## re-enable ICD loader
to re-enable the ICD loader method below.
```bash
DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1 
```
## set VK_DRIVER_FILES
### RADV
``` 
VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd64.json:/usr/share/vulkan/icd.d/radeon_icd32.json
```
oder:

### amdvlk
```
VK_DRIVER_FILES=/usr/share/vulkan/icd.d/amd_icd64.json:/usr/share/vulkan/icd.d/amd_icd32.json # set amdvlk ICD Driver
```
oder


## my current version
```
#
# This file is parsed by pam_env module
#
# Syntax: simple "KEY=VAL" pairs on separate lines
#
ANV_VIDEO_DECODE=1
#LIBVA_DRIVER_NAME=radeonsi,i965
DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1=1
MESA_VK_DEVICE_SELECT=1002:744c
GSK_RENDERER=ngl
#VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd64.json:/usr/share/vulkan/icd.d/radeon_icd32.json
AMD_VULKAN_ICD=RADV
#VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_icd64.json:/usr/share/vulkan/icd.d/amd_icd32.json
#AMD_VULKAN_ICD=amdvlk
#DRI_PRIME=pci-0000_10_00_0
#VK_DRIVER_FILES=/usr/share/vulkan/icd.d/radeon_icd.i686.json:/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
```
