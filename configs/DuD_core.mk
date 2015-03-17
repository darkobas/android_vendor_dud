#
# Copyright (C) 2014 Paul Beeler
# Copyright (C) 2014 AOSPAL Paranoid SaberDroid
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
#

# begin MODULAR customizations
# Here will contain modular customizations for various ROM features or fixes.
# Most if not all of these features are disabled by default unless envoked elsewhere.
# Adding more modules here (device specific or not), will remain compatible accrossed all devices.
#

ifndef GCC_VERSION_AND
# GCC_VERSION_AND is not defined, set to 4.8 default
GCC_VERSION_AND := 4.8
SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-$(GCC_VERSION_AND)
SM_AND := $(shell $(SM_AND_PATH)/bin/arm-linux-androideabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_AND)),)
# GCC Colors only works on gcc >=4.9.x
$(shell `export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'`)
SM_AND_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_AND))
SM_AND_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_AND))
SM_AND_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_AND))
SM_AND_STATUS := $(filter (release) (prerelease) (experimental),$(SM_AND))

ifeq ($(filter (SaberMod%),$(SM_AND)),)
SM_AND_VERSION := $(SM_AND_NAME)_$(SM_AND_VERSION)_$(SM_AND_DATE)-$(SM_AND_STATUS)
else
SM_AND_VERSION := $(SM_AND_NAME)-$(SM_AND_DATE)-$(SM_AND_STATUS)
endif
endif

ifneq ($(SM_AND_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.android=$(SM_AND_VERSION)
endif
endif

ifndef GCC_VERSION_ARM
# GCC_VERSION_ARM is not defined, set to 4.8 default
GCC_VERSION_ARM := 4.8
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-$(GCC_VERSION_ARM)
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)

ifneq ($(filter (SM-Toolchain) (SaberMod%),$(SM_ARM)),)
# GCC Colors only works on gcc >=4.9.x
export GCC_COLORS := 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
SM_ARM_VERSION := $(filter 4.8 4.8.% 4.9 4.9.% 4.10 4.10.%,$(SM_ARM))
SM_ARM_NAME := $(filter (SM-Toolchain) (SaberMod%),$(SM_ARM))
SM_ARM_DATE := $(filter 20130% 20131% 20140% 20141%,$(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental),$(SM_ARM))

ifeq ($(filter (SaberMod%),$(SM_ARM)),)
SM_ARM_VERSION := $(SM_ARM_NAME)_$(SM_ARM_VERSION)_$(SM_ARM_DATE)-$(SM_ARM_STATUS)
else
SM_ARM_VERSION := $(SM_ARM_NAME)-$(SM_ARM_DATE)-$(SM_ARM_STATUS)
endif
endif

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif
endif
