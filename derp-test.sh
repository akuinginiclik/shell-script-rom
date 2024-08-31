rm -rf .repo/local_manifests/ rm -rf .repo/local-manifests && # Clone local_manifests repository
repo init -u https://github.com/DerpFest-AOSP/manifest.git -b 14 --depth=1 
 git clone https://github.com/XeroMz69/manifest-lokal.git --depth 1 -b derpfest .repo/local_manifests && 
# Sync the repositories
/opt/crave/resync.sh  && 
# Set up build environment
export BUILD_USERNAME=XeroMz69 
 export BUILD_HOSTNAME=crave 
 source build/envsetup.sh && 
echo Repository: XeroMz69/crave_aosp_builder
 echo Run ID: 10640067250
 
# Build the ROM
lunch derp_earth-user && make installclean && mka derp
