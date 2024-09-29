#!/bin/bash

# Clean up old manifests and repos
rm -rf .repo/local_manifests
rm -rf frameworks/base
rm -rf device/lineage/sepolicy
rm -rf vendor/lineage
rm -rf packages/overlays/Lineage
rm -rf packages/apps/Launcher3

# Initialize repo
repo init -u https://github.com/CipherOS/android_manifest.git -b fourteen-qpr
git clone https://github.com/CipherOS/android_frameworks_base.git -b fourteen-qpr frameworks/base --depth=1
git clone https://github.com/XeroMz69/manifest-lokal.git -b cipher-vanilla .repo/local_manifests

# Sync repos
/opt/crave/resync.sh

# Export environment variables
export TARGET_RELEASE=ap2a
export BUILD_TYPE=UNOFFICIAL
export BUILD_USERNAME=Xero
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export KBUILD_USERNAME=Xero
export KBUILD_HOSTNAME=crave
export TZ=Asia/Jakarta

# Set up the build environment
source build/envsetup.sh

# Try the first lunch option
if lunch cipher_earth-userdebug; then
    echo "Successfully set lunch to cipher_earth-userdebug"
    
# Try the second lunch option if the first one fails
elif lunch miku_earth-UNOFFICIAL-ap2a; then
    echo "First lunch failed, successfully set lunch to miku_earth-UNOFFICIAL-ap2a"
    
# Try the third lunch option if the first two fail
elif lunch miku_earth-ap2a-userdebug; then
    echo "First two lunch options failed, successfully set lunch to miku_earth-ap2a-userdebug"
    
# If all lunch options fail, exit with an error
else
    echo "All lunch options failed!"
    exit 1
fi

# Clean and build
make installclean
mka bacon -j$(nproc --all)
