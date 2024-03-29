# Copyright (C) 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common msm8960
-include device/htc/msm8960-common/BoardConfigCommon.mk

# Include Path
TARGET_SPECIFIC_HEADER_PATH := device/htc/zara/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := zara
TARGET_BOARD_PLATFORM := msm8960

# Kernel
BOARD_KERNEL_BASE := 0x80600000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=zara androidboot.selinux=permissive user_debug=31
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01608000
TARGET_KERNEL_CONFIG := zara_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/zara
#TARGET_PREBUILT_KERNEL := device/htc/zara/kernel

# Use GCC 4.6 to compile the kernel
#ARM_EABI_TOOLCHAIN :=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin

# Audio
BOARD_USES_FLUENCE_INCALL := true # use DMIC in call only
BOARD_USES_SEPERATED_AUDIO_INPUT := true # use distinct voice recog/camcorder use cases
BOARD_USES_SEPERATED_VOICE_SPEAKER := true # use distinct voice speaker user case
BOARD_USES_SEPERATED_VOIP := true # use distinct VOIP use cases
BOARD_HAVE_HTC_CSDCLIENT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/zara/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/htc/zara/bluetooth/libbt_vndcfg.txt
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := false

# Camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
COMMON_GLOBAL_CFLAGS += -DHTC_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
USE_DEVICE_SPECIFIC_CAMERA := true

# Graphics
TARGET_DISPLAY_INSECURE_MM_HEAP := true
TARGET_DISPLAY_USE_RETIRE_FENCE := false

# GPS
BOARD_HAVE_NEW_QC_GPS := true

# Power
TARGET_POWERHAL_VARIANT := cm

# RIL
BOARD_PROVIDES_LIBRIL := true
COMMON_GLOBAL_CFLAGS += -DNEW_LIBRIL_HTC

# USB
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE		 := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/system/etc/firmware/fw_bcm4334.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/etc/firmware/fw_bcm4334_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/system/etc/firmware/fw_bcm4334_p2p.bin"

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p22: 000ffa00 00000200 "misc"
#mmcblk0p34: 00fffe00 00000200 "recovery"
#mmcblk0p33: 01000000 00000200 "boot"
#mmcblk0p35: 71fffc00 00000200 "system"
#mmcblk0p29: 00140200 00000200 "local"
#mmcblk0p36: 0efffe00 00000200 "cache"
#mmcblk0p37: 130000000 00000200 "userdata"
#mmcblk0p25: 01400000 00000200 "devlog"
#mmcblk0p27: 00040000 00000200 "pdata"
#mmcblk0p30: 00010000 00000200 "extra"
#mmcblk0p16: 02d00000 00000200 "radio"
#mmcblk0p17: 00a00000 00000200 "adsp"
#mmcblk0p15: 00100000 00000200 "dsps"
#mmcblk0p18: 00500000 00000200 "wcnss"
#mmcblk0p19: 007ffa00 00000200 "radio_config"
#mmcblk0p23: 00400000 00000200 "modem_st1"
#mmcblk0p24: 00400000 00000200 "modem_st2"
#mmcblk0p32: 01fffc00 00000200 "reserve"
#mmcblk0p28: 00004000 00000200 "control"


# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1912601600
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5100273664
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VOLD_MAX_PARTITIONS := 39

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Charge mode
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/zara/rootdir/etc/fstab.zara
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

# Touch screen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# TWRP
DEVICE_RESOLUTION := 540x960
TW_FLASH_FROM_STORAGE := true
TW_DEFAULT_INTERNAL_STORAGE := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_INCLUDE_JB_CRYPTO := true
RECOVERY_SDCARD_ON_DATA := true


# inherit from the proprietary version
-include vendor/htc/zara/BoardConfigVendor.mk
