PRODUCT_PACKAGE_OVERLAYS := \
	vendor/pixelrom/product/overlay \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dataroaming=false \
	ro.com.android.mobiledata=false \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.rotation_locked=true \
	ro.opa.eligible_device=true \
	ro.storage_manager.enabled=true \

