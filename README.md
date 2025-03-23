# K1 KernelCI setup

This repository contains environment variables and commands for u-boot for acquiring kernel from tftp, booting it and mounting the nfs file system

The `file k1-x_deb1_cloud_v.dts` contains device tree source for generating dtb which is compatible with bianbu linux 6.6

The log file `kernel_log.log` contains The log output with respect to running k1-x_deb1_cloud_v.dts

| File Name             | Description                                                                             |
|------------------------|-----------------------------------------------------------------------------------------|
| k1-x_deb1_bianbu.dts   | source of the `dtb` file acquired from rootfs of the bianbu linux by mounting it       |
| k1-x_deb1_cloud_v.dts  | The modified version of the `k1-x_deb1_bianbu.dts` which is expected to work with linux 6.6 from Bianbu Gitee repository |
| k1-x_deb1_linux6_6.dts | The source of the `dtb` file genearted when building linux 6.6 from bianbu gitee repository (it is not working)          |
| kernel_log.log         | The log of the kernel when booted with `k1-x_deb1_cloud_v.dts`. Each change to this file and its dts file will be in a commit |