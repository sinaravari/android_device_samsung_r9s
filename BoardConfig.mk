#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r9s

# Kernel
KERNEL_SRC_PATH := kernel/samsung/r9s

ifneq ($(wildcard $(KERNEL_SRC_PATH)),)
# Build kernel from source
TARGET_KERNEL_NO_GCC := true
TARGET_KERNEL_SOURCE := $(KERNEL_SRC_PATH)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := r9s_defconfig

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
else
# Use prebuilt kernel
TARGET_KERNEL_DIR := $(DEVICE_PATH)-kernel

BOARD_PREBUILT_DTBOIMAGE := $(TARGET_KERNEL_DIR)/dtbo.img
#BOARD_PREBUILT_DTBIMAGE_DIR := $(TARGET_KERNEL_DIR)/dtb

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := $(TARGET_KERNEL_DIR)/kernel-headers
PRODUCT_COPY_FILES += \
    $(TARGET_KERNEL_DIR)/kernel:kernel

PRODUCT_COPY_FILES += \
    $(TARGET_KERNEL_DIR)/dtb/dtb.img:dtb.img

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(TARGET_KERNEL_DIR)/vendor_ramdisk/,$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules) \
    $(call find-copy-subdir-files,*,$(TARGET_KERNEL_DIR)/vendor_ramdisk/,$(TARGET_COPY_OUT_RECOVERY)/root/lib/modules)

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(TARGET_KERNEL_DIR)/vendor_ramdisk/modules.load))
endif

# Kernel Modules
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

# Screen density
TARGET_SCREEN_DENSITY := 480

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Inherit from exynos2100
include device/samsung/exynos2100/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/samsung/r9s/BoardConfigVendor.mk
