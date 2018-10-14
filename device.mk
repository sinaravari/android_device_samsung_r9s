#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from exynos2100
$(call inherit-product, device/samsung/exynos2100/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/samsung/r9s/r9s-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
