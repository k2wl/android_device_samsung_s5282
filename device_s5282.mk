$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/s5282/s5282-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/s5282/overlay

LOCAL_PATH := device/samsung/s5282

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/samsung/s5282/prebuilt/system,system) \
    
$(shell mkdir -p $(LOCAL_PATH)/../../../out/target/product/s5282/recovery/root/system/bin)
$(shell ln -sf -t $(LOCAL_PATH)/../../../out/target/product/s5282/recovery/root/system/bin ../../sbin/sh)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/init.sp8810.rc:root/init.sp8810.rc \
    $(LOCAL_PATH)/boot/init.sp8810.usb.rc:root/init.sp8810.usb.rc


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/fstab.sp8810:root/fstab.sp8810

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/boot/ueventd.sp8810.rc:root/ueventd.sp8810.rc

PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/bootanimation/240.zip:system/media/bootanimation.zip

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.conf:system/etc/vold.conf \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab \
    
# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# Usb accessory
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Device-specific packages
PRODUCT_PACKAGES += \
	SamsungServiceMode \

# Charger
PRODUCT_PACKAGES += \
	charger \
	charger_res_images

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_s5282
PRODUCT_DEVICE := s5282

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.adb.secure=0 \
    ro.secure=0 \

TARGET_BUILD_VARIANT := userdebug
PRODUCT_AAPT_CONFIG := normal ldpi mdpi nodpi
PRODUCT_AAPT_PREF_CONFIG := ldpi
