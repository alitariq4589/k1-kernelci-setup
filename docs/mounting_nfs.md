# Mounting `rootfs` through NFS

This document mentions how you can mount rootfs through NFS. You will need Bianbu buildrooot, linux-6.6 (though it may change in future as newer kernel is added), opensbi, u-boot, scripts and buildroot-ext repositories from gitee.

This document assumes that you already have a working u-boot in your board. For adding changes to the u-boot, refer to the `u-boot` directory and copy the files in it to the u-boot.

# NFS directory set up

This repository and documentation assumes that you have rootfs and bootfs directories already present in the `/nfsroot` directory of the computer and nfs server is already set up with `/nfsroot/rootfs` and `/nfsroot/bootfs` shared in the `/etc/exports` file.

_NOTE: Only NFS version 3 is supported by u-boot for file transfering through nfs. If for some reason the nfs is not working for transferring the file, use `tftpboot` command to transfer the files. Refer to the [u-boot-env.env](/u-boot-env.env) for list of commands._

The bootfs directory in the `/nfsroot` contains the kernel image (or uImage in our case. Because u-boot requires uImage), the device tree blob (dtb) and initramfs image. At minimum, it should have the files as mentioned in the following directory tree.

```
bootfs
├── initramfs-generic.img
├── k1-x_deb1_cloud_v.dtb
└── uImage-bianbu
```


All of the above required files are available in [u-boot](/u-boot) directory.




The first stage bootloader (FSBL) for kernelCI setup is the u-boot SPL (secondary program loader) which remains in the emmc and polls for u-boot proper from the UART Y-modem. It is built separately. It places the u-boot proper at the certain address in the volatile memory and then jumps to it, from there you can use the u-boot commands described in the [u-boot-env.env](/u-boot-env.env) to load the kernel through NFS.

The built `FSBL.bin`, `bootinfo` files are in the `build` directory and the files that you must replace in the u-boot to generate FSBL.bin

# Building rootfs from source

The buildroot is used for generating the rootfs as well as initramfs. You will have to change the `BR2_EXTERNAL_Bianbu_PATH` variable to where your builroot-ext repository is present. If this variable is not set, many paths will point to the relative path from `/` which will cause errors in the build (such as permission denied or no such file or directory).

There should be a bsp-src directory in one parent directory to the buildroot repository in which you will have to clone opensbi, linux6.6 and u-boot. In the same directory, you will have to clone scripts repository. After that you may have to edit the .config file to change the linux kernel directory path (it is linux-6.6 in our case).

Copy the the contents of `config` and `board` from buildroot-ext to buildroot repository

Once all of the above is done, use the following command to start building the buildroot.

```
make k1_defconfig
make ARCH=riscv64 -j$(nproc)
```

This will build the rootfs in the `buildroot/output/images` directory.

# Building the dtb

NOTE: The generated dtb file is generated from the [k1-x_deb1_cloud_v.dts](/k1-x_deb1_cloud_v.dts). It will throw some warnings and it is because the dts file was recovered from an already available dts and then some `phandle` were corrected and then it was used to generate dtb file. You can use following command to generate the dtb file.

```
dtc -O dtb -o /nfsroot/bootfs/k1-x_deb1_cloud_v.dtb k1-x_deb1_cloud_v.dts
```