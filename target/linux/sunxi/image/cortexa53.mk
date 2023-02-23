# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org
# Copyright (C) 2016 Yousong Zhou

define Device/sun50i
  SUNXI_DTS_DIR := allwinner/
  KERNEL_NAME := Image
  KERNEL := kernel-bin
endef

define Device/sun50i-h5
  SOC := sun50i-h5
  $(Device/sun50i)
endef

define Device/sun50i-a64
  SOC := sun50i-a64
  $(Device/sun50i)
endef

define Device/friendlyarm_nanopi-neo-plus2
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO Plus2
  SUPPORTED_DEVICES:=nanopi-neo-plus2
  $(Device/sun50i-h5)
endef
TARGET_DEVICES += friendlyarm_nanopi-neo-plus2

define Device/friendlyarm_nanopi-neo2
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO2
  SUPPORTED_DEVICES:=nanopi-neo2
  $(Device/sun50i-h5)
endef
TARGET_DEVICES += friendlyarm_nanopi-neo2

define Device/libretech_all-h3-cc-h5
  DEVICE_VENDOR := Libre Computer
  DEVICE_MODEL := ALL-H3-CC
  DEVICE_VARIANT := H5
  $(Device/sun50i-h5)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-libretech-all-h3-cc
endef
TARGET_DEVICES += libretech_all-h3-cc-h5

define Device/olimex_a64-olinuxino
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A64-Olinuxino
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bs-firmware
  $(Device/sun50i-a64)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-olinuxino
endef
TARGET_DEVICES += olimex_a64-olinuxino

define Device/olimex_a64-olinuxino-emmc
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A64-Olinuxino
  DEVICE_VARIANT := eMMC
  DEVICE_PACKAGES := kmod-rtl8723bs rtl8723bs-firmware
  $(Device/sun50i-a64)
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-olinuxino-emmc
endef
TARGET_DEVICES += olimex_a64-olinuxino-emmc

define Device/pine64_pine64-plus
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := Pine64+
  $(Device/sun50i-a64)
endef
TARGET_DEVICES += pine64_pine64-plus

define Device/pine64_sopine-baseboard
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := SoPine
  $(Device/sun50i-a64)
endef
TARGET_DEVICES += pine64_sopine-baseboard

define Device/xunlong_orangepi-pc2
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi PC 2
  DEVICE_PACKAGES := usbutils usb-modeswitch v4l-utils openssh-sftp-server wpa-supplicant-mini \
  kmod-video-core kmod-video-uvc kmod-rtc-sunxi kmod-sunxi-ir kmod-pwm-gpio kmod-spi-dev \
  kmod-sound-core kmod-sun8i-codec kmod-usb-audio kmod-usb-storage-extras kmod-usb2 kmod-mt7601u \
  luci kmod-fs-ext4 kmod-fs-ntfs kmod-fs-vfat kmod-fuse
  $(Device/sun50i-h5)
  CONFIG_TARGET_ROOTFS_PARTSIZE := 7000
endef
TARGET_DEVICES += xunlong_orangepi-pc2

define Device/xunlong_orangepi-pc2-spinand
	DEVICE_VENDOR := Xunlong
	DEVICE_MODEL := Orange Pi PC 2 (SPINAND)
	DEVICE_PACKAGES := usbutils usb-modeswitch v4l-utils openssh-sftp-server wpa-supplicant-mini \
		kmod-video-core kmod-video-uvc kmod-rtc-sunxi kmod-sunxi-ir kmod-pwm-gpio kmod-spi-dev \
		kmod-sound-core kmod-sun8i-codec kmod-usb-audio kmod-usb-storage-extras kmod-usb2 kmod-mt7601u \
		luci kmod-fs-ext4 kmod-fs-ntfs kmod-fs-vfat kmod-fuse
	SOC := sun50i-h5
	SUNXI_DTS_DIR := allwinner/
	KERNEL_NAME := Image

	SUPPORTED_DEVICES := orangepi-pc2-spinand
  SUNXI_DTS := $$(SUNXI_DTS_DIR)$$(SOC)-orangepi-pc2

	KERNEL := kernel-bin | sunxi-kernelubifs
	IMAGES := ubispinand.img.gz
	
	MKUBIFS_OPTS := -F -m $(CONFIG_SUNXI_SPINAND_PAGESIZE) -e $(shell echo $$(($(CONFIG_SUNXI_SPINAND_BLOCKSIZE) - (($(CONFIG_SUNXI_SPINAND_PAGESIZE)/1024)*2))))KiB -c 880 -U
	UBINIZE_OPTS := -vv

	BLOCKSIZE := $(CONFIG_SUNXI_SPINAND_BLOCKSIZE)KiB
	PAGESIZE := $(CONFIG_SUNXI_SPINAND_PAGESIZE)
	SUBPAGESIZE := $(CONFIG_SUNXI_SPINAND_PAGESIZE)
	VID_HDR_OFFSET := $(CONFIG_SUNXI_SPINAND_PAGESIZE)
	IMAGE_SIZE := $(CONFIG_TARGET_ROOTFS_PARTSIZE)m
	KERNEL_IN_UBI := 1
	UBOOTENV_IN_UBI := 1

	IMAGE/ubispinand.img.gz := \
		sunxi-spinandboot | \
		pad-to $$(CONFIG_SUN8I_V3S_OFFSET_UBI) | \
		append-ubi | \
		gzip
endef
TARGET_DEVICES += xunlong_orangepi-pc2-spinand

define Device/xunlong_orangepi-zero-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi Zero Plus
  $(Device/sun50i-h5)
endef
TARGET_DEVICES += xunlong_orangepi-zero-plus
