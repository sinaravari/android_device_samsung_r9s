#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from universal2100
$(call inherit-product, device/samsung/universal2100-common/common.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/samsung/r9s/r9s-vendor.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Camera - ID=52 is telephoto
$(call soong_config_set,samsungCameraVars,extra_ids,52)

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4633128672291735937.xml

# Recovery/vendor_boot firmware
PRODUCT_COPY_FILES += \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/s3908_r9.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9_slsi.bin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/firmware/s3908_r9_slsi.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/s3908_r9.bin \
    vendor/samsung/r9s/proprietary/vendor/firmware/s3908_r9_slsi.bin:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/vendor/firmware/s3908_r9_slsi.bin

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# UDFPS
$(call soong_config_set,samsungUdfpsVars,dim_layer_zorder,0xff)
$(call soong_config_set,samsungUdfpsVars,udfps_zorder,0x100)
$(call soong_config_set,surfaceflinger,udfps_lib,//hardware/samsung/fingerprint:libudfps_extension.samsung)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init/init.udfps.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.udfps.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
