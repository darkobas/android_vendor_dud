# Common settings and files
-include vendor/dud/configs/common.mk

# Add tablet overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/dud/overlay/common_tablet

PRODUCT_CHARACTERISTICS := tablet

