#!/bin/bash

# Clean up old manifests and repos
rm -rf .repo/local_manifests
rm -rf frameworks/base
rm -rf device/lineage/sepolicy
rm -rf hardware/xiaomi
rm -rf device/mediatek/sepolicy_vndr
rm -rf vendor/lineage

# Initialize repo
repo init --depth=1 -u https://github.com/ProjectBlaze/manifest -b 14
git clone https://github.com/XeroMz69/manifest-lokal.git -b pb-a14 .repo/local_manifests

# Sync repos
/opt/crave/resync.sh

# Export environment variables
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# Set up the build environment
source build/envsetup.sh

# Try the first lunch option
if lunch blaze_earth-ap3a-userdebug; then
    echo "Successfully set lunch to blaze_earth-ap3a-userdebug"
    
# Try the second lunch option if the first one fails
elif lunch blaze_earth-ap2a-userdebug; then
    echo "First lunch failed, successfully set lunch to blaze_earth-ap2a-userdebug"
        
# If all lunch options fail, exit with an error
else
    echo "All lunch options failed!"
    exit 1
fi

# Clean and build
make installclean
make bacon
