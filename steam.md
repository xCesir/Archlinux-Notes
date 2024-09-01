## AMD Vulkan Driver
Add

VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd64.json:/usr/share/vulkan/icd.d/radeon_icd32.json %command%

To game launch options in order to force RADV

Or

VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/amd_icd64.json:/usr/share/vulkan/icd.d/amd_icd32.json %command%

To force AMDVLK
