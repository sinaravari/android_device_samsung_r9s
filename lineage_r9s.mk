#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from r9s device
$(call inherit-product, device/samsung/r9s/device.mk)

# Inherit from common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_NAME := lineage_r9s
PRODUCT_DEVICE := r9s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G990E
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="r9sxxx-user 11 RP1A.200720.012 G990EXXSIGYI3 release-keys" \
    BuildFingerprint=samsung/r9sxxx/r9s:11/RP1A.200720.012/G990EXXSIGYI3:user/release-keys \
    DeviceProduct=r9sxxx

# Define PDA property for camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.build.PDA=G990EXXSIGYI3
