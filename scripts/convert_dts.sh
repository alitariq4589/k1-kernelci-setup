#!/bin/bash

dtc -O dtb -o /nfsroot/bootfs/k1-x_deb1_cloud_v.dtb k1-x_deb1_cloud_v.dts > >(tee dts_conversion.log) 2>&1