rm -rf .repo/local_manifests/ rm -rf .repo/local-manifests && # Clone local_manifests repository
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14 --depth=1 
 git clone https://github.com/XeroMz69/manifest-lokal.git --depth 1 -b derpfest .repo/local_manifests && 
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=Xero 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
 
# Build the ROM
lunch derp_earth-user && make installclean && mka derp
