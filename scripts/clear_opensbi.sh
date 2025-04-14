#!/bin/bash

# One sector = 512 bytes
# Opensbi location in sd card (sector) = 2048

if [ -z "${SD_CARD_PATH+x}" ]; then
  echo "[Error]: SD_CARD_PATH env variable is not set"
  echo "[HINT]: You may want to check it in disks utility or in /dev/ directory about what appears when you insert sd card"
  exit 1
fi
sudo dd if=/dev/zero of="$SD_CARD_PATH" bs=512 seek=2048 count=2048

sync