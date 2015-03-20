ifeq (DuD_bacon,$(TARGET_PRODUCT))

# Use 4.x for the kernel
GCC_VERSION_ARM := 4.9
GCC_VERSION_ARMEABI := 4.9
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

UBER_KERNEL_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
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
USE_O3_OPTIMIZATIONS := true

include vendor/dud/configs/DuD_modular.mk

ifeq (true,$(GRAPHITE_OPTS))
OPT1 := (graphite)
endif
ifeq (true,$(STRICT_ALIASING))
OPT2 := (strict)
endif
ifeq (true,$(USE_O3_OPTIMIZATIONS))
OPT3 := (O3)
endif
ifeq (true,$(KRAIT_TUNINGS))
OPT4 := (krait)
endif
ifeq (true,$(ENABLE_GCCONLY))
OPT5 := (gcconly)
endif

GCC_OPTIMIZATION_LEVELS := $(OPT1)$(OPT2)$(OPT3)$(OPT4)$(OPT5)
ifneq (,$(GCC_OPTIMIZATION_LEVELS))
PRODUCT_PROPERTY_OVERRIDES += \
    ro.uber.flags=$(GCC_OPTIMIZATION_LEVELS)
endif

TW_THEME := portrait_hdpi

# Inherit telephony common stuff
$(call inherit-product, vendor/dud/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/dud/main.mk

# Inherit device configuration
$(call inherit-product, device/oppo/bacon/omni_find7op.mk)

# next camera
CAMERA_NEXT := true
PRODUCT_PACKAGES += \
    CameraNext \
    AudioFX

# Override AOSP build properties
PRODUCT_NAME := DuD_bacon
PRODUCT_DEVICE := bacon
PRODUCT_BRAND := Oneplus
PRODUCT_MODEL := One
PRODUCT_MANUFACTURER := Oneplus

# Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=bacon TARGET_DEVICE=bacon

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

endif
