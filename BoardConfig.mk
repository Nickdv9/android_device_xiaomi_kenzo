#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common msm8956-common
-include device/xiaomi/msm8956-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/kenzo

# Assertions
TARGET_OTA_ASSERT_DEVICE := kate,kenzo

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Filesystem
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26838785024 # 26838801408 - 16384

# Kernel
TARGET_KERNEL_CONFIG := lineageos_kenzo_defconfig
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-gnu/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

# inherit from the proprietary version
-include vendor/xiaomi/kenzo/BoardConfigVendor.mk

SDCLANG := true

SDCLANG_PATH := prebuilts/snapdragon-llvm/toolchains/llvm-Snapdragon_LLVM_for_Android_3.8/prebuilt/linux-x86_64/bin

SDCLANG_LTO_DEFS := device/qcom/common/sdllvm-lto-defs.mk

SDCLANG_COMMON_FLAGS := -O3 -fvectorize-loops
