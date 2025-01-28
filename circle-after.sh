#!/bin/bash

workdir="$(pwd)"

export DEBIAN_FRONTEND=noninteractive
git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh
cd $workdir
git config --global user.name "XeroMz69"
git config --global user.email "adamyd18@gmail.com"
mkdir -p ccache

export CCACHE_DIR=$workdir/ccache
df -h

# sync
echo "Sync Repo"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt install git-lfs
mkdir -p derp
cd derp
git lfs install
repo init --depth=1 -u https://github.com/XeroMz69/android_manifest.git -b 14 --git-lfs
git-lfs install
git clone https://github.com/XeroMz69/manifest-lokal.git -b afterlife .repo/local_manifests
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
rm -rf vendor/xiaomi
git clone https://github.com/mt6768-dev/proprietary_vendor_xiaomi_earth.git $WORKDIR/vendor/xiaomi/earth --depth 1
git clone https://github.com/LineageOS/android_prebuilts_clang_kernel_linux-x86_clang-r416183b $WORKDIR/prebuilts/prebuilts/clang/host/linux-x86/clang-los --depth 1
      
#  Build_script:
echo "build"
export BUILD_USERNAME="xero"
export BUILD_HOSTNAME="urmom"
export KBUILD_BUILD_USER="xero"
export KBUILD_BUILD_HOST="urmom" 
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true
export TZ=Asia/Jakarta
. build/envsetup.sh
goafterlife earth 
