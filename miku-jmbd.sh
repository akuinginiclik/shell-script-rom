#!/bin/bash
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
rm -rf vendor/lineage
git clone https://github.com/XeroMz69/manifest-lokal.git -b miku .repo/local_manifests
repo init -u https://github.com/Miku-UI/manifesto -b Udon_v2
/opt/crave/resync.sh
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta
source build/envsetup.sh
. build/envsetup.sh
lunch miku_earth-userdebug-UNOFFICIAL
make installclean
make diva
