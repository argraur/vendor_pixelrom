# Set Pixel sounds as Default
PRODUCT_PROPERTY_OVERRIDES := \
	ro.config.ringtone=Zen.ogg \
	ro.config.notification_sound=Chime.ogg \
	ro.config.alarm_alert=Flow.ogg \

# Copy bootanimation from Pixel
PRODUCT_COPY_FILES := vendor/pixelrom/media/bootanimation.zip:system/media/bootanimation.zip:google \

# Apply some build.prop stuff and enable Google Assistant
PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.rotation_locked=true \
	ro.opa.eligible_device=true \
	ro.storage_manager.enabled=true \

# ADB Secure enable on user builds
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
	ro.adb.secure=0 \
endif

# Load SystemUIGoogle and friends :D
PRODUCT_PACKAGES += \
	SystemUIGoogle \
	SettingsGoogle \
	SetupWizard \
	PixelSoundResources \
	WallpapersBReel \
	WallpapersUsTwo \
	WallpaperPickerGooglePrebuilt \
	NexusWallpapersStubPrebuilt

# Overlay
$(call inherit-product, vendor/pixelrom/product/pixelrom1.mk)
$(call inherit-product, vendor/pixelrom/product/pixelrom.mk)

