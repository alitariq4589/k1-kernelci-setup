#!/bin/bash
UBOOT_PATH="../../bianbu/uboot-2022.10"
OPENSBI_PATH="/home/user0/.WORKDIR/kernelci_work/bianbu/opensbi"

rm u-boot-opensbi.itb
rm u-boot-nodtb.bin
rm fw_dynamic.bin

cp $UBOOT_PATH/u-boot-nodtb.bin ./
cp $OPENSBI/build/platform/generic/firmware/fw_dynamic.bin ./

$UBOOT_PATH/tools/mkimage -f uboot-opensbi.its -r u-boot-opensbi.itb