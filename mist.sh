#!/bin/bash

# Deleting some repo
rm -rf .repo/local_manifests/
rm -rf device/lineage/sepolicy
rm -rf vendor/lineage
rm -rf vendor/gms
rm -rf .repo/projects/vendor/gms.git
rm -rf .repo/project-objects/*/android_vendor_gms.git
rm -rf hardware/mediatek
rm -rf device/mediatek/sepolicy_vndr

# Clone the repo
git clone https://github.com/XeroMz69/manifest-lokal.git -b ngising .repo/local_manifests
repo init -u https://github.com/Project-Mist-OS/manifest -b qpr3 --git-lfs

# Syncing the repo
/opt/crave/resync.sh

# Adding some flags
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# Setup environment
source build/envsetup.sh

# Build and compile the rom
lunch mist_earth-user
make installclean
make bacon
