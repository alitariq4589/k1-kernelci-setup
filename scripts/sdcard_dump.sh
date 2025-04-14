#!/bin/bash


# This script gets the first 8191 sectors from the sd card which should include FSBL, bootinfo_sd.bin, env, opensbi and u-boot

if [ -z "${SD_CARD_PATH+x}" ]; then
  echo "[Error]: SD_CARD_PATH env variable is not set"
  echo "[HINT]: You may want to check it in disks utility or in /dev/ directory about what appears when you insert sd card"
  exit 1
fi

sudo dd if="$SD_CARD_PATH" bs=512 count=8191  | hexdump -C > ../dumps/modified_OS_dump_gparted_partition_flashed.log

echo "[INFO]: The dump has been stored in $(readlink -r ../dumps/modified_OS_dump_gparted_partition_flashed.log)"