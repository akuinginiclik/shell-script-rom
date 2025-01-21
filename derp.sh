#!/bin/bash
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 15
git clone https://github.com/XeroMz69/manifest-lokal.git -b derpfest .repo/local_manifests
/opt/crave/resync.sh
rm -rf vendor/xiaomi
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git vendor/xiaomi/earth --depth 1
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
. build/envsetup.sh
lunch derp_earth-userdebug
make installclean
mka derp
