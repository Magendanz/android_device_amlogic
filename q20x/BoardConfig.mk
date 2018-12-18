#
# Copyright (C) 2014 The Android Open Source Project
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

DEVICE_FOLDER := device/amlogic/q20x

# Inherit from the proprietary version

TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := meson8
TARGET_BOARD_HARDWARE := amlogic
TARGET_BOOTLOADER_BOARD_NAME := q20x

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9

TARGET_USES_64_BIT_BINDER := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Partitions (from device tree)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x2000000
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x2000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x80000000
BOARD_USERDATAIMAGE_PARTITION_SIZE:= 0x2E5000000
BOARD_CACHEIMAGE_PARTITION_SIZE := 0x20000000
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 0x20000

BOARD_EGL_CFG := $(DEVICE_FOLDER)/egl.cfg
USE_OPENGL_RENDERER := true

# Kernel
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x01080000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x00000000

TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/recovery/root/fstab.amlogic
TARGET_RECOVERY_INITRC := $(DEVICE_FOLDER)/recovery/root/init.rc
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_SUPPRESS_SECURE_ERASE := true

# TWRP
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_BRIGHTNESS_PATH := "/brightness"
TW_THEME := landscape_hdpi
TW_INCLUDE_CRYPTO := true
TW_NO_BATT_PERCENT := true
TW_NO_SCREEN_TIMEOUT := true
TWHAVE_SELINUX := true
TW_INCLUDE_FB2PNG := true
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_REBOOT_BOOTLOADER := true
