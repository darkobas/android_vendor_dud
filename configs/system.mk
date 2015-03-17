# Copyright (C) 2013 ParanoidAndroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/$(TARGET_PRODUCT)

# Copy custom ramdisk
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.pa.rc:root/init.pa.rc

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# changelog copy
PRODUCT_COPY_FILES += \
    Changelog.txt:system/etc/CHANGELOG.txt

# HFM Files
PRODUCT_COPY_FILES += \
	vendor/dud/prebuilt/etc/hosts.alt:system/etc/hosts.alt \
	vendor/dud/prebuilt/etc/hosts.og:system/etc/hosts.og

# Gapps backup script
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/$(VENDOR)/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh


# SuperSU
PRODUCT_COPY_FILES += \
    vendor/dud/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/dud/prebuilt/etc/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon  

# PRODUCT_PROPERTY_OVERRIDES += \
#    persist.sys.root_access=3
# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/dud/prebuilt/common/otasigcheck.sh:system/bin/otasigcheck.sh

# Layers Theme
PRODUCT_COPY_FILES += \
    vendor/dud/prebuilt/permissions/com.layers.theme.xml:system/etc/permissions/com.layers.theme.xml \
    vendor/dud/prebuilt/common/etc/Layers.apk:system/app/Layers/Layers.apk

#Include google messenger
PRODUCT_COPY_FILES += \
    vendor/dud/prebuilt/common/etc/PrebuiltBugle.apk:system/app/PrebuiltBugle/PrebuiltBugle.apk
