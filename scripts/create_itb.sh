#!/bin/bash

if [ -z "${UBOOT_PATH+x}" ]; then
  echo "[Error]: UBOOT env variable is not set"
  exit 1
fi

if [ -z "${OPENSBI_PATH+x}" ]; then
  echo "[Error]: OPENSBI_PATH env variable is not set"
  exit 1
fi

unset UBOOT_PATH
unset OPENSBI_PATH

UBOOT_PATH="../../bianbu/uboot-2022.10"

rm ../firmware/u-boot-opensbi.itb
rm ../firmware/u-boot-nodtb.bin
rm ../firmware/fw_dynamic.bin

cp $UBOOT_PATH/u-boot-nodtb.bin ../firmware/
cp /home/user0/.WORKDIR/kernelci_work/bianbu/opensbi/build/platform/generic/firmware/fw_dynamic.bin ../firmware/

$UBOOT_PATH/tools/mkimage -f ../firmware/uboot-opensbi.its -r ../firmware/u-boot-opensbi.itb