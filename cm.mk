$(call inherit-product, device/htc/zara/full_zara.mk)

$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_RELEASE_NAME := zara

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/zara/device.mk)

# Device naming
PRODUCT_DEVICE := zara
PRODUCT_NAME := cm_zara
PRODUCT_BRAND := htc
PRODUCT_MODEL := Desire 601
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=zara BUILD_ID=JDQ39 BUILD_FINGERPRINT="htc/htc_europe/zara:4.2.2/JDQ39/258362.8:user/release-keys" PRIVATE_BUILD_DESC="1.10.401.8 CL258362 release-keys"
