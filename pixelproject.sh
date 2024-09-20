#!/bin/bash

# Removing some stuff
rm -rf .repo/local_manifests
rm -rf frameworks/base
rm -rf device/lineage/sepolicy device/mediatek/sepolicy_vndr hardware/mediatek hardware/xiaomi
rm -rf vendor/lineage

# Cloning the repo and sync
repo init -u https://github.com/The-Pixel-Project/manifest -b fourteen-qpr3 -g default,-mips,-darwin,-notdefault --git-lfs
git clone https://github.com/XeroMz69/manifest-lokal.git -b pixelproject .repo/local_manifests
/opt/crave/resync.sh

# Build the rom
echo "Aku Nak PP"
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
. build/envsetup.sh
lunch aosp_earth-ap2a-userdebug
make installclean
make bacon -j$(nproc --all)
