# K1 KernelCI setup

This repository contains RISC-V's spacemit k1 SoC bootflow setup for kernelCI. The board being used is Banana Pi F3.

## File descriptions

| File Name             | Description                                                                             |
|------------------------|-----------------------------------------------------------------------------------------|
| k1-x_deb1_bianbu.dts   | source of the `dtb` file acquired from rootfs of the bianbu linux by mounting it       |
| k1-x_deb1_cloud_v.dts  | The modified version of the `k1-x_deb1_bianbu.dts` which is expected to work with linux 6.6 from Bianbu Gitee repository |
| k1-x_deb1_linux6_6.dts | The source of the `dtb` file genearted when building linux 6.6 from bianbu gitee repository (it is not working)          |
| kernel_log.log         | The log of the kernel when booted with `k1-x_deb1_cloud_v.dts`. Each change to this file and its dts file will be in a commit |

## Setup

Refer to [MOUNTING_NFS.md](/docs/MOUNTING_NFS.md) for instructions related to booting the board with network filesystem and building the kernel and rootfs