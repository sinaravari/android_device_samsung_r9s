#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r9s

# Inherit from samsung exynos2100
include device/samsung/exynos2100/BoardConfigCommon.mk

# Inherit from the proprietary version
include vendor/samsung/r9s/BoardConfigVendor.mk

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
