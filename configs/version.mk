ifneq ($(DUD_TYPE),)
        ROM_NAME := omni-$(DUD_TYPE)
        DUD_VERSION := $(DUD_TYPE)$(DUD_VERSION_MAJOR).$(DUD_VERSION_MINOR)$(DUD_VERSION_MAINTENANCE)
else
        DUD_VERSION := $(DUD_VERSION_MAJOR).$(DUD_VERSION_MINOR)$(DUD_VERSION_MAINTENANCE)
endif

export BUILD_DATE := $(shell date -u +%Y%m%d)
ifeq ($(TARGET_BUILD_VARIANT),user)
        export ODEX_BUILD := true
endif
export DUD_BUILD_NAME := $(DUD_VERSION)-$(BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dud.version=$(DUD_VERSION) \
    ro.dud.modversion=$(DUD_BUILD_NAME)

