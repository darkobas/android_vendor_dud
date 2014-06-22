ifneq ($(PSD_TYPE),)
        ROM_NAME := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)-$(ROM_VERSION_TAG)-$(PSD_TYPE)
        PSD_VERSION := $(PSD_TYPE)-V$(PSD_VERSION_MAJOR).$(PSD_VERSION_MINOR)-$(PSD_VERSION_MAINTENANCE)
else
        ROM_NAME := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)-$(ROM_VERSION_TAG)
        PSD_VERSION := V$(PSD_VERSION_MAJOR).$(PSD_VERSION_MINOR)-$(PSD_VERSION_MAINTENANCE)
endif

export BUILD_DATE := $(shell date -u +%Y%m%d)
ifeq ($(TARGET_BUILD_VARIANT),user)
        export ODEX_BUILD := true
endif
export PSD_BUILD_NAME := $(ROM_NAME)-$(BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.$(VENDOR).version=$(PSD_VERSION) \
    ro.$(VENDOR).modversion=$(PSD_BUILD_NAME)
