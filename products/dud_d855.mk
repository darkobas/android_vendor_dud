ifeq (dud_d855,$(TARGET_PRODUCT))

USE_HOST_4_8=true

# Set -fstrict-aliasing flag to global for hammerhead
GRAPHITE_OPTS := true
FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
KRAIT_TUNINGS := true
include vendor/dud/configs/uber.mk

TW_THEME := portrait_hdpi

include vendor/dud/main.mk

include vendor/dud/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d855/dud_d855.mk)

# next camera
PRODUCT_PACKAGES += \
    Camera2 

# Override AOSP build properties
PRODUCT_NAME := dud_d855
PRODUCT_DEVICE := d855
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D855
PRODUCT_MANUFACTURER := lge

endif
