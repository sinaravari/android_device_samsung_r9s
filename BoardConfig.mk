#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r9s


# Kernel Modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD :=  $(strip $(shell cat $(DEVICE_PATH)/modules.load.recovery))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

# Screen density
TARGET_SCREEN_DENSITY := 480

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# OTA assert
TARGET_OTA_ASSERT_DEVICE := r9s

# Inherit from universal2100
include device/samsung/universal2100-common/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/samsung/r9s/BoardConfigVendor.mk
