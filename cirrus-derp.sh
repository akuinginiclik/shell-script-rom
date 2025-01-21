#!/bin/bash
cd ~/
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
cd ~/
echo "
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi" >> .profile
source ~/.profile
curl https://raw.githubusercontent.com/XeroMz69/shell-script-rom/refs/heads/main/cirrus.sh | bash
mkdir -p ~/bin
mkdir -p ~/derp
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.email "adamyd18@gmail.com"
git config --global user.name "XeroMz69"
cd derp
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
. build/envsetup.sh
lunch derp_earth-userdebug
make installclean
mka derp
