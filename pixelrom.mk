# Set Pixel sounds as Default
PRODUCT_PROPERTY_OVERRIDES := \
	ro.config.ringtone=Zen.ogg \
	ro.config.notification_sound=Chime.ogg \
	ro.config.alarm_alert=Flow.ogg \

# Copy bootanimation from Pixel
PRODUCT_COPY_FILES := vendor/pixelrom/media/bootanimation.zip:system/media/bootanimation.zip:lge \

# Apply some build.prop stuff and enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.rotation_locked=true \
	ro.opa.eligible_device=true \
	ro.storage_manager.enabled=true \

# ADB Secure enable on user builds
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
	ro.adb.secure=1 \

endif

# Load SystemUIGoogle and friends :D
PRODUCT_PACKAGES += \
	SystemUIGoogle \
	Settings \
	SetupWizard \
	PixelSoundResources \
	WallpapersBReel \
	WallpapersUsTwo \
	WallpaperPickerGooglePrebuilt \
	NexusWallpapersStubPrebuilt

# Copy GES libraries
GES_LIBS := vendor/pixelrom/libs
GES_LIBS86 := $(GES_LIBS)/arm-v7
GES_LIBS64 := $(GES_LIBS)/arm64-v8a
PRODUCT_COPY_FILES := \
	$(GES_LIBS86)/libjpeg.so:system/lib/libjpeg.so:google \
	$(GES_LIBS64)/libgdx.so:system/lib64/libgdx.so:google \
	$(GES_LIBS64)/libgeswallpapers-jni.so:system/lib64/libgeswallpapers-jni:google \
	$(GES_LIBS64)/libjpeg.so:system/lib64/libjpeg.so:google

# Copy new mixer-paths
MIXER_PATHS_XML := vendor/pixelrom/patches/mixer_paths.xml
PRODUCT_COPY_FILES := \
	$(MIXER_PATHS_XML):system/etc/mixer_paths.xml:google
