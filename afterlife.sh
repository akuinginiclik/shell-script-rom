#!/bin/bash

CLANG_DLINK="https://github.com/XeroMz69/Clang/releases/download/Xero-Clang-20.0.0git-20250113/Xero-Clang-20.0.0git-20250113.tar.gz"
WORKDIR="$(pwd)"

# Remove some old shit
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy

# Syncing the DerpFest repo
repo init --depth=1 -u https://github.com/XeroMz69/android_manifest.git -b 14 --git-lfs
git clone https://github.com/XeroMz69/manifest-lokal.git -b afterlife .repo/local_manifests
# rm -rf $WORKDIR/packages/apps/FMRadio
/opt/crave/resync.sh

# Some fixes
rm -rf $WORKDIR/vendor/xiaomi
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git $WORKDIR/vendor/xiaomi/earth --depth 1
cd $WORKDIR/kernel/xiaomi/earth
rm -rf KernelSU-Next
rm -rf drivers/kernelsu
curl -LSs "https://raw.githubusercontent.com/rifsxd/KernelSU-Next/next/kernel/setup.sh" | bash -
cd $WORKDIR
# rm -rf frameworks/base
# git clone https://github.com/XeroMz69/afl_frameworks_base.git $WORKDIR/frameworks/base --depth 1
# git clone https://github.com/LineageOS/android_prebuilts_clang_kernel_linux-x86_clang-r416183b $WORKDIR/prebuilts/prebuilts/clang/host/linux-x86/clang-los --depth 1
rm -rf $WORKDIR/prebuilts/clang/host/linux-x86/clang-xero
mkdir -p $WORKDIR/prebuilts/clang/host/linux-x86/clang-xero
wget $CLANG_DLINK
tar -C $WORKDIR/prebuilts/clang/host/linux-x86/clang-los/ -zxvf Xero-Clang-20.0.0git-20250113.tar.gz
rm -rf Xero-Clang-20.0.0git-20250113.tar.gz
# rm -rf $WORKDIR/packages/apps/FMRadio
# git clone https://github.com/LineageOS/android_packages_apps_FMRadio.git $WORKDIR/packages/apps/FMRadio

# Some flags
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export BUILD_USERNAME=xero
export KBUILD_USERNAME=xero
export BUILD_HOSTNAME=crave
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# Setup the environment
. build/envsetup.sh

# Afterlife
make installclean
goafterlife earth
