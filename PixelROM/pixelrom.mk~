# Set overlay
PRODUCT_PACKAGE_OVERLAYS := \
	vendor/pixelrom/product/overlay-pixel \

# Load PixelSoundResources
PRODUCT_PACKAGES := \
	PixelSoundResources 

# Set Pixel sounds as Default
PRODUCT_PROPERTY_OVERRIDES := \
	ro.config.ringtone=Zen.ogg \
	ro.config.notification_sound=Chime.ogg \
	ro.config.alarm_alert=Flow.ogg \

# Copy bootanimation from Pixel
PRODUCT_COPY_FILES := vendor/pixelrom/data/media/bootanimation.zip:system/media/bootanimation.zip:pixelrom \

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

# Load SystemUIGoogle and SettingsGoogle
PRODUCT_PACKAGES += \
    SystemUIGoogle
    SettingsGoogle
