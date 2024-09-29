#!/bin/bash

# Remove local manifests if they exist
rm -rf .repo/local_manifests
echo "======= remove local manifest success====="
# remove tree
rm -rf device/xiaomi/sunny
rm -rf device/qcom/common
rm -rf device/qcom/qssi
rm -rf device/xiaomi/sunny-kernel
rm -rf vendor/xiaomi/sunny
rm -rf vendor/qcom/common
rm -rf vendor/qcom/opensource/core-utils
rm -rf hardware/xiaomi
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
echo "==============removing previous tree done=========="
# Initialize repo
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14
echo "================repo Initialize success========="
# repo sync
/opt/crave/resync.sh
echo "==========repo sync success====="
# remove source frameworks/base
rm -rf frameworks/base
echo "============remove frameworks/base success============" 
# device tree
git clone https://github.com/XeroMz69/Bumi-Device-Tree.git --depth 1 -b derpfest device/xiaomi/earth
# kernel tree
git clone https://github.com/XeroMz69/Bumi-Kernel-Tree.git --depth 1 -b lineage-21 device/xiaomi/sunny-kernel
# vendor tree
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git --depth 1 -b lineage-21 vendor/xiaomi/earth
# hardware tree
git clone https://github.com/yaap/hardware_xiaomi.git --depth 1 -b fourteen hardware/xiaomi
# prebuilts
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi
# source modification
git clone https://github.com/DerpFest-AOSP/frameworks_base.git --depth 1 -b 14 frameworks/base
# set build environment
. build/envsetup.sh
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
# Choose a target device
lunch derp_earth-userdebug
# clean install
# make installclean
# Compile DerpFest
mka derp




