#!/bin/bash
rm -rf .repo/local_manifests
rm -rf frameworks/base
rm -rf device/lineage/sepolicy
repo init -u https://github.com/CherishOS/android_manifest.git -b uqpr2
git clone https://github.com/XeroMz69/manifest-lokal.git -b cherish .repo/local_manifests
/opt/crave/resync.sh
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
. build/envsetup.sh
brunch earth
