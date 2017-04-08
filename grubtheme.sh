#! /bin/bash
cd br8e-grub
mkdir -p /boot/grub/themes/br8e
cp -r * /boot/grub/themes/br8e
echo -e \GRUB_THEME=\"/boot/grub/themes/br8e/theme.txt\" >> /etc/default/grub
