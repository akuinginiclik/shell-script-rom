#!/bin/bash
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 15
git clone https://github.com/XeroMz69/manifest-lokal.git -b derpfest .repo/local_manifests
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
rm -rf vendor/xiaomi
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git vendor/xiaomi/earth --depth 1
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=urmom
export TZ=Asia/Jakarta
source build/envsetup.sh
. build/envsetup.sh
lunch derp_earth-userdebug
make installclean
mka derp
