# Thinkpad-E14-15-AMD-Gen-2-FIX

## Fn-keys not working - Thinkpad E14-15 AMD Gen 2

This script will fix non-working fn keys, sleep mode when the lid is closed and the battery is connected.


### Upgrade your kernel to version 5.8-5.9: 

Link: [ubuntu-mainline-kernel.sh](https://github.com/pimlie/ubuntu-mainline-kernel.sh) 

---
### Script instruction:

1. Download script
2. Make it executable
3. Run `sudo ./thinkpad-e15-gen2-firmware-fix.sh --grub-setup-dsdt`
4. Reboot
---
## Note:
#### If in your system bash:
Replace `#!/bin/sh` with `#!/bin/bash` in script

###If this dosent run well and create a grub config do the steps given below (tried in Ubuntu 20.04.2):

1) After downloading the script, you need to run `sed -i -e 's/\r$//' ./thinkpad-e15-gen2-firmware-fix.sh` to strip out ^M in the file 

2) You need to run the following commands to install acpidump

`sudo apt-get update`

`sudo apt-get install acpidump`

thanks to @sysintelligent from lenovo forums for this .

###Arch

Make sure you have acpica installed (`pacman -S acpica`) and run `thinkpad-e15-gen2-firmware-fix_arch.sh` instead. Tested with kernel `5.12.10-arch1-1`.
Normally the `^M` aren't present in this script, but if you get an error related to this then see above.
**NOTE: The script uses `#!/usr/bin/bash` as a crunchbang since it's the common Arch location for bash. You have to change it if you use another interpreter/it is located elsewhere!**

### fedora
sudo dnf install acpidump -y
Run the script named  `thinkpad-e15-gen2-firmware-fix_fedora.sh` and it should work . Tested in fedora 33 with 5.10.18 kernel.

---

###Pop Os
Pop os uses systemd-boot . So first we need to install grub . For that you can follow this video : https://youtu.be/wLOZfT0732Y
Then donwload the script for pop , make it executable and then run as : 
`sudo ./thinkpad-e15-gen2-firmware-fix_pop.sh --grub-setup-dsdt`




### Forums
 [forums.lenovo.com thread](https://forums.lenovo.com/t5/Other-Linux-Discussions/Linux-Fn-keys-not-working-Thinkpad-E14-AMD-Gen-2/m-p/5027791?page=8) 

---

Supported BIOS: 1.8 - 1.10

Link: [driver-list](https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-edge-laptops/thinkpad-e15-gen-2-type-20t8-20t9/downloads/driver-list/) 



My system:
Ubuntu 20.04
kernel 5.9.16

Thanks for attention

