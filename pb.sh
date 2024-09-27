#!/bin/bash

# Clean up old manifests and repos
rm -rf .repo/local_manifests
rm -rf frameworks/base
rm -rf device/lineage/sepolicy
rm -rf hardware/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/lineage

# Initialize repo
repo init -u https://github.com/ProjectBlaze/manifest -b 15 --git-lfs
git clone https://github.com/XeroMz69/manifest-lokal.git -b projectblaze .repo/local_manifests

# Sync repos
/opt/crave/resync.sh

# Export environment variables
export TARGET_RELEASE=ap3a
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# Set up the build environment
source build/envsetup.sh
lunch blaze_earth-ap3a-userdebug

# Clean and build
make installclean
make bacon
