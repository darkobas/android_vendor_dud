ifeq (psd_klte,$(TARGET_PRODUCT))

# Use 4.x for the kernel
GCC_VERSION_ARM := 4.9
# Override ARM settings
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_ARM)),)
# GCC Colors only works on gcc >=4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_ARM))
SM_ARM_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_ARM))
SM_ARM_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
ifeq ($(filter (SaberMod%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

include vendor/psd/configs/psd_modular.mk

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif

# Disable strict aliasing modules
DISABLE_STRICT_MODULES += \
        libOmxVenc

DISABLE_STRICT_MODULES := \
		$(DISABLE_STRICT_MODULES)

# Set -fstrict-aliasing flag to global for hammerhead
MAKE_STRICT_GLOBAL := true

# Optimize memory
OPT_MEMORY := true

# Enable graphite
ENABLE_GRAPHITE := true

# Saber linux toolchains
#USING_SABER_LINUX := yes

# Inherit telephony common stuff
$(call inherit-product, vendor/psd/configs/telephony.mk)

# Include AOSPA common configuration
include vendor/psd/main.mk

# Inherit device configuration
$(call inherit-product, device/samsung/klte/klte.mk)

# next camera
PRODUCT_PACKAGES += \
    Camera2 \
    AudioFX

# Override AOSP build properties
PRODUCT_NAME := psd_klte
PRODUCT_DEVICE := klte
PRODUCT_BRAND := samsung
PRODUCT_MODEL := klte
PRODUCT_MANUFACTURER := samsung

endif