echo "***************************************************************************************"
echo "Applying Patches for permissions and WebView packages to resolve Google Play service FC"
echo "***************************************************************************************"
echo "Applying first patch..."
patch vendor/pixelrom/patches/DefaultPermissionGrantPolicy.patch > frameworks/base/services/core/java/com/android/server/pm/DefaultPermissionGrantPolicy.java
echo "Applying second patch..."
patch vendor/pixelrom/patches/config_webview_packages.patch > frameworks/base/core/res/res/xml/config_webview_packages.patch
echo "Removing sounds package (.ogg)"
rm -f frameworks/base/data/sounds/AllAudio.mk
