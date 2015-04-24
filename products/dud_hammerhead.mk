ifeq (dud_hammerhead ,$(TARGET_PRODUCT))
#GCC_VERSION_AND := 4.9
#GCC_VERSION_ARM := 4.9
# Set -fstrict-aliasing flag to global for hammerhead
GRAPHITE_OPTS := true
#FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
#KRAIT_TUNINGS := true
include vendor/dud/configs/uber.mk

TW_THEME := portrait_hdpi

# Include AOSPA common configuration
include vendor/dud/main.mk


# Inherit device configuration
$(call inherit-product, device/lge/hammerhead/dud_hammerhead.mk)

# next camera
#CAMERA_NEXT := true
PRODUCT_PACKAGES += \
    Camera2 

# Override AOSP build properties
PRODUCT_NAME := dud_hammerhead
PRODUCT_DEVICE := hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nesud 5
PRODUCT_MANUFACTURER := LGE


#PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
