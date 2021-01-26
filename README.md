# Thinkpad-E14-15-AMD-Gen-2-FIX

## Fn-keys not working - Thinkpad E14-15 AMD Gen 2

This script will fix non-working fn keys, sleep mode when the lid is closed and the battery is connected.


### Upgrade your kernel to version 5.8-5.9: 

Link: [ubuntu-mainline-kernel.sh](https://github.com/pimlie/ubuntu-mainline-kernel.sh) 


### Script instruction:

1. Download script
2. Make it executable
3. If in your system bash: Replace `#!/bin/sh` with `#!/bin/bash`
3. Run
`
sudo ./thinkpad-e15-gen2-firmware-fix.sh --grub-setup-dsdt
`
4. Reboot

---
*Note: If you are running this on Arch make sure you have acpica installed and change the line "update-grub" to "grub-mkconfig -o /boot/grub/grub.cfg"

---

 [forums.lenovo.com thread](https://forums.lenovo.com/t5/Other-Linux-Discussions/Linux-Fn-keys-not-working-Thinkpad-E14-AMD-Gen-2/m-p/5027791?page=8) 

---

My version
Bios 1.08

Ubuntu 20.04

kernel 5.9.16

Thanks for attention

