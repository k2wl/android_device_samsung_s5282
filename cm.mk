## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := SamaungGalaxyStarDuos

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/s5282/device_s5282.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := s5282
PRODUCT_NAME := cm_s5282
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S5282
PRODUCT_MANUFACTURER := samsung

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=mintxx TARGET_DEVICE=mint BUILD_FINGERPRINT=samsung/mintxx/mint:4.1.2/JZO54K/S5282XXAMH4:user/release-keys PRIVATE_BUILD_DESC="mintxx-user 4.1.2 JZO54K S5282XXAMH4 release-keys"
