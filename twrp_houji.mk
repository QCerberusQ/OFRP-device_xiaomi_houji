#
# Copyright (C) 2024 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/houji

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

#Inherit Common TWRP / OrangeFox Configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# 4. Inherit OrangeFox OF_* Config
$(call inherit-product, $(DEVICE_PATH)/fox_houji.mk)

# Release name
PRODUCT_RELEASE_NAME := houji

## Device identifier
PRODUCT_DEVICE := houji
PRODUCT_NAME := twrp_houji
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi 14
PRODUCT_MANUFACTURER := Xiaomi

# Strongbox Device Decryption
TW_INCLUDE_OMAPI := true

# SPR
PRODUCT_PROPERTY_OVERRIDES += vendor.display.enable_spr=1
