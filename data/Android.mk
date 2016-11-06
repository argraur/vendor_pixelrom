LOCAL_PATH := $(call my-dir)
PIXEL_SOUND_RESOURCE_DIR := $(LOCAL_PATH)/sounds-pixel

PIXEL_SOUND_RESOURCES := $(patsubst $(PIXEL_SOUND_RESOURCE_DIR)/%,%,$(shell find $(PIXEL_SOUND_RESOURCE_DIR) -type f -o -type l))

define install-sound-files
include $$(CLEAR_VARS)
LOCAL_MODULE := $(2)$(1)
$(info $(LOCAL_MODULE))
LOCAL_MODULE_TAG := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_STEM := $(1)
LOCAL_PATH := $(3)
LOCAL_MODULE_PATH := $$(TARGET_OUT)/media/audio
LOCAL_SRC_FILES := $(1)
include $$(BUILD_PREBUILT)
endef

$(foreach fp, $(PIXEL_SOUND_RESOURCES),\
  $(eval $(call install-sound-files,$(fp),Pixel,$(PIXEL_SOUND_RESOURCE_DIR))))

include $(CLEAR_VARS)
LOCAL_MODULE := PixelSoundResources
LOCAL_REQUIRED_MODULES := $(foreach pn,$(PIXEL_SOUND_RESOURCES),Pixel$(pn))
LOCAL_OVERRIDES_PACKAGES := NexusSoundResources
include $(BUILD_PHONY_PACKAGE)
