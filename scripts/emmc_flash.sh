#!/bin/bash


# This script is used for flashing the onboard emmc of the banana pi f3. For this to work, you will have transfer it in the OS first and then execute the script from within the board's OS

echo 0 > /sys/block/mmcblk2boot0/force_ro
dd if=bootinfo_emmc.bin of=/dev/mmcblk2boot0
dd if=FSBL.bin of=/dev/mmcblk2boot0 bs=512 seek=1
sync
