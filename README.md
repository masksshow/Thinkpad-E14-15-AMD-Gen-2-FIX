# Thinkpad-E14-15-AMD-Gen-2-FIX
Fn-keys not working - Thinkpad E14-15 AMD Gen 2

## Fn-keys not working - Thinkpad E14-15 AMD Gen 2

This script will fix non-working fn keys, sleep mode when the lid is closed and the battery is connected.


Update kernel: https://github.com/pimlie/ubuntu-mainline-kernel.sh

1. Download script
2. Make it executable
3. If in your system bash: Replace `#!/bin/sh` with `#!/bin/bash`
3. Run
`
sudo ./thinkpad-e15-gen2-firmware-fix.sh --grub-setup-dsdt
`

4. Reboot

My version
Bios 1.08

Ubuntu 20.04

kernel 5.9.16

Thanks for attention
