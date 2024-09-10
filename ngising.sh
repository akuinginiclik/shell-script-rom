#!/bin/bash
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
git clone https://github.com/XeroMz69/manifest-lokal.git -b ngising .repo/local_manifests
rm -rf vendor/gms
rm -rf .repo/projects/vendor/gms.git
rm -rf .repo/project-objects/*/android_vendor_gms.git
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1
/opt/crave/resync.sh
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
. build/envsetup.sh
riseup earth user
make installclean
rise b
