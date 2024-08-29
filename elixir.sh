#!/bin/bash
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
repo init --depth=1 -u https://github.com/Project-Elixir/manifest -b UNO --git-lfs
git clone https://github.com/XeroMz69/manifest-lokal.git -b elixir .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
lunch aosp_earth-userdebug
make installclean
mka bacon -j16
