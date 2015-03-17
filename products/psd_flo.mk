ifeq (DuD_flo,$(TARGET_PRODUCT))


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

# Set  opts
MAKE_STRICT_GLOBAL := true
GRAPHITE_OPTS := true
FLOOP_NEST_OPTIMIZE := true
STRICT_ALIASING :=true
KRAIT_TUNINGS := true

# Include AOSPA common configuration
include vendor/dud/main.mk

# next camera
PRODUCT_PACKAGES += \
    Camera2 \
    AudioFX

# Check for target product

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := DuD_flo

# Include ParanoidAndroid common configuration
include vendor/dud/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/flo/full_flo.mk)

## Override AOSP build properties
PRODUCT_NAME := DuD_flo
#PRODUCT_BRAND := Google
#PRODUCT_MODEL := Nexus 7
#PRODUCT_MANUFACTURER := Asus
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=razor BUILD_FINGERPRINT="google/razor/flo:5.0/LRX21P/1570855:user/release-keys" PRIVATE_BUILD_DESC="razor-user 5.0 LRX21P 1570855 release-keys"
endif
