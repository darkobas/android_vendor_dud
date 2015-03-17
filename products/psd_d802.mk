ifeq (DuD_d802,$(TARGET_PRODUCT))


# Use 4.x for the kernel
GCC_VERSION_ARM := 4.9
GCC_VERSION_ARMEABI := 4.8
# Override ARM settings

# Path to toolchain
UBER_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-$(GCC_VERSION_ARMEABI)
UBER_AND := $(shell $(UBER_AND_PATH)/bin/arm-linux-androideabi-gcc --version)

# Find strings in version info
ifneq ($(filter (UBERTC%),$(UBER_AND)),)
UBER_AND_NAME := $(filter (UBERTC%),$(UBER_AND))
# UBER_AND_DATE := $(filter 20150% 20151%,$(UBER_AND))
UBER_AND_VERSION := $(UBER_AND_NAME)-$(UBER_AND_DATE)
PRODUCT_PROPERTY_OVERRIDES += \
     ro.uber.android=$(UBER_AND_VERSION)
endif

UBER_KERNEL_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi--$(GCC_VERSION_ARM)
UBER_KERNEL := $(shell $(UBER_KERNEL_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (UBERTC%),$(UBER_KERNEL)),)
UBER_KERNEL_NAME := $(filter (UBERTC%),$(UBER_KERNEL))
UBER_KERNEL_DATE := $(filter 20150% 20151%,$(UBER_KERNEL))
UBER_KERNEL_VERSION := $(UBER_KERNEL_NAME)-$(UBER_KERNEL_DATE)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.uber.kernel=$(UBER_KERNEL_VERSION)
endif

# Set -fstrict-aliasing flag to global for hammerhead
MAKE_STRICT_GLOBAL := true
GRAPHITE_OPTS := true
FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
KRAIT_TUNINGS := true
include vendor/dud/configs/DuD_modular.mk

# Inherit telephony common stuff
$(call inherit-product, vendor/dud/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/dud/main.mk

# Inherit device configuration
$(call inherit-product, device/lge/d802/d802.mk)

# next camera
PRODUCT_PACKAGES += \
    Camera2 \
    AudioFX

# Override AOSP build properties
PRODUCT_NAME := DuD_d802
PRODUCT_DEVICE := d802
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D802
PRODUCT_MANUFACTURER := lge

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=d802 BUILD_FINGERPRINT=lge/g2_open_com/g2:4.4.2/KOT49I.D80220a/D80220a.1392133741:user/release-keys PRIVATE_BUILD_DESC="g2_open_com-user 4.4.2 KOT49I.D80220a D80220a.1392133741 release-keys"
endif
