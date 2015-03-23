ifeq (dud_bacon ,$(TARGET_PRODUCT))
TARGET_GCC_VERSION := 4.9
TARGET_ARCH := arm
# Set -fstrict-aliasing flag to global for hammerhead
MAKE_STRICT_GLOBAL := true
GRAPHITE_OPTS := true
FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
KRAIT_TUNINGS := true
ENABLE_GCCONLY := true
include vendor/dud/configs/uber.mk

TW_THEME := portrait_hdpi

# Include AOSPA common configuration
include vendor/dud/main.mk


# Inherit device configuration
$(call inherit-product, device/oppo/bacon/dud_bacon.mk)

# next camera
CAMERA_NEXT := true
PRODUCT_PACKAGES += \
    CameraNext 

# Override AOSP build properties
PRODUCT_NAME := dud_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := Oneplus
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := Oneplus

# Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=bacon TARGET_DEVICE=bacon

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
