echo "***************************************************************************************"
echo "Applying Patches for permissions and WebView packages to resolve Google Play service FC"
echo "***************************************************************************************"
echo "Applying first patch..."
patch ~/PixelROM/vendor/pixelrom/patches/DefaultPermissionGrantPolicy.patch > ~/PixelROM/frameworks/base/services/core/java/com/android/server/pm/DefaultPermissionGrantPolicy.java
echo "Applying second patch..."
patch ~/PixelROM/vendor/pixelrom/patches/config_webview_packages.patch > ~/PixelROM/frameworks/base/core/res/res/xml/config_webview_packages.patch
echo "Removing sounds package (.ogg)"
rm -f ~/PixelROM/frameworks/base/data/sounds/AllAudio.mk
