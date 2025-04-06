echo 0 > /sys/block/mmcblk2boot0/force_ro
dd if=bootinfo_emmc.bin of=/dev/mmcblk2boot0
dd if=FSBL.bin of=/dev/mmcblk2boot0 bs=512 seek=1
