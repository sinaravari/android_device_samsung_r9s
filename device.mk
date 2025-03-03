#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from exynos2100
$(call inherit-product, device/samsung/exynos2100/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/samsung/r9s/r9s-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Recovery/vendor_boot firmware
PRODUCT_COPY_FILES += \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/s3908_r9.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9_slsi.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/s3908_r9_slsi.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/s3908_r9.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9_slsi.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/s3908_r9_slsi.bin

# Sensors
PRODUCT_PACKAGES += \
    sensors.r9s

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
