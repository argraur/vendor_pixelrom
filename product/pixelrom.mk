PRODUCT_PACKAGE_OVERLAYS := \
	vendor/pixelrom/product/overlay-pixel \

PRODUCT_PACKAGES := \
	PixelSoundResources 

PRODUCT_PROPERTY_OVERRIDES := \
	ro.config.ringtone=Zen.ogg \
	ro.config.notification_sound=Chime.ogg \
	ro.config.alarm_alert=Flow.ogg \

PRODUCT_COPY_FILES := vendor/pixelrom/data/media/bootanimation.zip:system/media/bootanimation.zip:pixelrom \
	vendor/pixelrom/data/data-pixel/nexus.xml:system/etc/sysconfig/nexus.xml:pixelrom

PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.rotation_locked=true \
	ro.opa.eligible_device=true \
	ro.storage_manager.enabled=true \

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
	ro.adb.secure=1 \

endif
