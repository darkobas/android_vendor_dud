ifeq (dud_bacon ,$(TARGET_PRODUCT))
#GCC_VERSION_AND := 4.9
#GCC_VERSION_ARM := 4.9
# Set -fstrict-aliasing flag to global for hammerhead
GRAPHITE_OPTS := true
#FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
#KRAIT_TUNINGS := true
#include vendor/dud/configs/uber.mk

TW_THEME := portrait_hdpi

# Include AOSPA common configuration
include vendor/dud/main.mk


# Inherit device configuration
$(call inherit-product, device/oppo/bacon/dud_bacon.mk)

# next camera
CAMERA_NEXT := true
PRODUCT_PACKAGES += \
    SnapdragonCamera

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
