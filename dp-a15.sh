#!/bin/bash

# Remove local manifests if they exist
rm -rf .repo/local_manifests
echo "======= remove local manifest success====="
# remove tree
rm -rf device/xiaomi/earth
rm -rf kernel/xiaomi/earth
rm -rf vendor/xiaomi/earth
rm -rf hardware/xiaomi
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9
rm -rf prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9
rm -rf prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9
echo "==============removing previous tree done=========="
# Initialize repo
git clone https://github.com/XeroMz69/manifest-lokal -b derpfest .repo/local_manifests --depth=1
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14
echo "================repo Initialize success========="
# repo sync
/opt/crave/resync.sh
echo "==========repo sync success====="
# remove source frameworks/base
rm -rf frameworks/base
echo "============remove frameworks/base success============" 
# hardware tree
git clone https://github.com/yaap/hardware_xiaomi.git -b fourteen hardware/xiaomi --depth=1
# prebuilts
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf --depth=1
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi --depth=1
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-linux-android-4.9.git -b lineage-19.1 prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9 --depth=1
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_x86_x86_64-linux-android-4.9.git -b lineage-19.1 prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.9 --depth=1
git clone https://github.com/LineageOS/android_prebuilts_gcc_linux-x86_arm_arm-linux-androideabi-4.9.git -b lineage-19.1 prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9 --depth=1
# source modification
git clone https://github.com/DerpFest-AOSP/frameworks_base.git -b 14 frameworks/base --depth=1
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




