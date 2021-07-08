#!/bin/bash

GRUB_CUSTOM_ACPI='/boot/thinkpad-e15-gen2-firmware-1.09-power-supply-fix.aml'
GRUB_ACPI_CFG='/etc/grub.d/01_acpi'
OUTPUT_DIR='thinkpad-e15-gen2-firmware-1.09-power-supply-fix'

if [ "$1" == '--help' ]; then
	echo "Fixes power supply events on Lenovo ThinkPad E15 Gen2 with firmware 1.09 R1AET33W"
	echo "Output will be located in $OUTPUT_DIR"
	echo ""
	echo "Options:"
	echo "--grub-setup-dsdt  - setup new DSDT table to grub"
	exit 0
fi

mkdir -p "$OUTPUT_DIR"
pushd $_

acpidump -b -n DSDT && \
iasl dsdt.dat && \
sed -i 's/Name (H8DR, 0x00)/Name (H8DR, One)/g' dsdt.dsl && \
iasl dsdt.dsl || \
exit 1

if [ "$1" == "--grub-setup-dsdt" ]; then
	if test -f "$GRUB_ACPI_CFG"; then
		echo "Failed to include custom DSDT: file $GRUB_ACPI_CFG already exists"
		exit 1
	fi

	cat <<EOF2 >$GRUB_ACPI_CFG
#!/bin/sh

GRUB_CUSTOM_ACPI="${GRUB_CUSTOM_ACPI}"

libdir=/usr/share

. \${libdir}/grub2/grub-mkconfig_lib

# Load custom ACPI table
if [ x\${GRUB_CUSTOM_ACPI} != x ] && [ -f \${GRUB_CUSTOM_ACPI} ] \\
        && is_path_readable_by_grub \${GRUB_CUSTOM_ACPI}; then
    echo "Found custom ACPI table: \${GRUB_CUSTOM_ACPI}" >&2
    prepare_grub_to_access_device \`\${grub_probe} --target=device \${GRUB_CUSTOM_ACPI}\` | sed -e "s/^/  /"
    cat << EOF
acpi (\\\$root)\`make_system_path_relative_to_its_root \${GRUB_CUSTOM_ACPI}\`
EOF
fi
EOF2
	chmod a+x "$GRUB_ACPI_CFG"
	cp -f dsdt.aml "$GRUB_CUSTOM_ACPI"
	grub2-mkconfig -o /boot/efi/EFI/opensuse/grub.cfg
fi
popd
