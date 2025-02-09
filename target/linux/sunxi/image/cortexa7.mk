# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2019 OpenWrt.org
# Copyright (C) 2016 Yousong Zhou
# Copyright (C) 2020-2021 HandsomeMod Project

define Device/cubietech_cubieboard2
  DEVICE_VENDOR := Cubietech
  DEVICE_MODEL := Cubieboard2
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-sun4i-emac kmod-rtc-sunxi
  SOC := sun7i-a20
endef
TARGET_DEVICES += cubietech_cubieboard2

define Device/cubietech_cubietruck
  DEVICE_VENDOR := Cubietech
  DEVICE_MODEL := Cubietruck
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-rtc-sunxi kmod-brcmfmac
  SOC := sun7i-a20
endef
TARGET_DEVICES += cubietech_cubietruck

define Device/friendlyarm_nanopi-m1-plus
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi M1 Plus
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-leds-gpio kmod-brcmfmac \
	cypress-firmware-43430-sdio wpad-basic-wolfssl
  SOC := sun8i-h3
endef
TARGET_DEVICES += friendlyarm_nanopi-m1-plus

define Device/friendlyarm_nanopi-duo2
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi Duo 2
  DEVICE_PACKAGES:=kmod-rtc-sunxi \
	kmod-leds-gpio kmod-ledtrig-heartbeat \
	kmod-brcmfmac cypress-firmware-43430-sdio wpad-basic
  SOC := sun8i-h3
endef

TARGET_DEVICES += friendlyarm_nanopi-duo2

define Device/friendlyarm_nanopi-neo
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO
  SOC := sun8i-h3
endef
TARGET_DEVICES += friendlyarm_nanopi-neo

define Device/cputool_cbox-neo
  DEVICE_VENDOR := Cputools
  DEVICE_MODEL := Cbox
  SOC := sun8i-h3
  DEVICE_PACKAGES := kmod-usb2 kmod-usb-storage-extras kmod-video-core \
  kmod-usb-net kmod-usb-net-rndis openssh-sftp-server v4l-utils \
  luci kmod-fs-ext4 kmod-fs-vfat kmod-fuse usbutils usb-modeswitch usbmuxd \
  kmod-video-uvc wpa-supplicant-mini kmod-sunxi-cedarx kmod-sunxi-cedrus \
  kmod-rtc-sunxi kmod-input-touchscreen-ads7846 kmod-fb-tft-ili9341 \
  kmod-backlight-gpio kmod-video-mali kmod-usb-audio kmod-sun8i-codec
endef
TARGET_DEVICES += cputool_cbox-neo

define Device/friendlyarm_nanopi-neo-air
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi NEO Air
  DEVICE_PACKAGES := kmod-rtc-sunxi kmod-leds-gpio kmod-brcmfmac \
	cypress-firmware-43430-sdio wpad-basic-wolfssl
  SOC := sun8i-h3
endef
TARGET_DEVICES += friendlyarm_nanopi-neo-air

define Device/friendlyarm_nanopi-r1
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := NanoPi R1
  DEVICE_PACKAGES := kmod-rtc-sunxi kmod-usb-net-rtl8152 kmod-leds-gpio \
	kmod-brcmfmac cypress-firmware-43430-sdio wpad-basic-wolfssl
  SOC := sun8i-h3
endef
TARGET_DEVICES += friendlyarm_nanopi-r1

define Device/friendlyarm_zeropi
  DEVICE_VENDOR := FriendlyARM
  DEVICE_MODEL := ZeroPi
  DEVICE_PACKAGES := kmod-rtc-sunxi
  SOC := sun8i-h3
endef
TARGET_DEVICES += friendlyarm_zeropi

define Device/lamobo_lamobo-r1
  DEVICE_VENDOR := Lamobo
  DEVICE_MODEL := Lamobo R1
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-rtl8192cu swconfig wpad-basic-wolfssl
  SOC := sun7i-a20
endef
TARGET_DEVICES += lamobo_lamobo-r1

define Device/lemaker_bananapi
  DEVICE_VENDOR := LeMaker
  DEVICE_MODEL := Banana Pi
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-ata-sunxi
  SOC := sun7i-a20
endef
TARGET_DEVICES += lemaker_bananapi

define Device/sinovoip_bananapi-m2-berry
  DEVICE_VENDOR := Sinovoip
  DEVICE_MODEL := Banana Pi M2 Berry
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-ata-sunxi kmod-brcmfmac \
	brcmfmac-firmware-43430-sdio wpad-basic-wolfssl
  SUPPORTED_DEVICES:=lemaker,bananapi-m2-berry
  SOC := sun8i-v40
endef
TARGET_DEVICES += sinovoip_bananapi-m2-berry

define Device/sinovoip_bananapi-m2-ultra
  DEVICE_VENDOR := Sinovoip
  DEVICE_MODEL := Banana Pi M2 Ultra
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-ata-sunxi kmod-brcmfmac \
	brcmfmac-firmware-43430a0-sdio wpad-basic-wolfssl
  SUPPORTED_DEVICES:=lemaker,bananapi-m2-ultra
  SOC := sun8i-r40
endef
TARGET_DEVICES += sinovoip_bananapi-m2-ultra

define Device/lemaker_bananapro
  DEVICE_VENDOR := LeMaker
  DEVICE_MODEL := Banana Pro
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-ata-sunxi kmod-brcmfmac
  SOC := sun7i-a20
endef
TARGET_DEVICES += lemaker_bananapro

define Device/linksprite_pcduino3
  DEVICE_VENDOR := LinkSprite
  DEVICE_MODEL := pcDuino3
  DEVICE_PACKAGES:=kmod-sun4i-emac kmod-rtc-sunxi kmod-ata-sunxi kmod-rtl8xxxu \
	rtl8188eu-firmware
  SOC := sun7i-a20
endef
TARGET_DEVICES += linksprite_pcduino3

define Device/linksprite_pcduino3-nano
  DEVICE_VENDOR := LinkSprite
  DEVICE_MODEL := pcDuino3 Nano
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-ata-sunxi
  SOC := sun7i-a20
endef
TARGET_DEVICES += linksprite_pcduino3-nano

define Device/mele_m9
  DEVICE_VENDOR := Mele
  DEVICE_MODEL := M9
  DEVICE_PACKAGES:=kmod-sun4i-emac kmod-rtc-sunxi kmod-rtl8192cu
  SOC := sun6i-a31
endef
TARGET_DEVICES += mele_m9

define Device/olimex_a20-olinuxino-lime
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A20-OLinuXino-LIME
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-rtc-sunxi
  SOC := sun7i
endef
TARGET_DEVICES += olimex_a20-olinuxino-lime

define Device/olimex_a20-olinuxino-lime2
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A20-OLinuXino-LIME2
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-rtc-sunxi kmod-usb-hid
  SOC := sun7i
endef
TARGET_DEVICES += olimex_a20-olinuxino-lime2

define Device/olimex_a20-olinuxino-lime2-emmc
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A20-OLinuXino-LIME2
  DEVICE_VARIANT := eMMC
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-rtc-sunxi kmod-usb-hid
  SOC := sun7i
endef
TARGET_DEVICES += olimex_a20-olinuxino-lime2-emmc

define Device/olimex_a20-olinuxino-micro
  DEVICE_VENDOR := Olimex
  DEVICE_MODEL := A20-OLinuXino-MICRO
  DEVICE_PACKAGES:=kmod-ata-sunxi kmod-sun4i-emac kmod-rtc-sunxi
  SOC := sun7i
endef
TARGET_DEVICES += olimex_a20-olinuxino-micro

define Device/sinovoip_bananapi-m2-plus
  DEVICE_VENDOR := Sinovoip
  DEVICE_MODEL := Banana Pi M2+
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-leds-gpio kmod-brcmfmac \
	brcmfmac-firmware-43430a0-sdio wpad-basic-wolfssl
  SOC := sun8i-h3
endef
TARGET_DEVICES += sinovoip_bananapi-m2-plus

define Device/xunlong_orangepi-one
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi One
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-h3
endef
TARGET_DEVICES += xunlong_orangepi-one

define Device/xunlong_orangepi-pc
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi PC
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-gpio-button-hotplug
  SOC := sun8i-h3
endef
TARGET_DEVICES += xunlong_orangepi-pc

define Device/xunlong_orangepi-pc-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi PC Plus
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-gpio-button-hotplug
  SOC := sun8i-h3
endef
TARGET_DEVICES += xunlong_orangepi-pc-plus

define Device/xunlong_orangepi-plus
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi Plus
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-h3
endef
TARGET_DEVICES += xunlong_orangepi-plus

define Device/xunlong_orangepi-r1
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi R1
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-usb-net-rtl8152
  SOC := sun8i-h2-plus
endef
TARGET_DEVICES += xunlong_orangepi-r1

define Device/xunlong_orangepi-zero
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi Zero
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-h2-plus
endef
TARGET_DEVICES += xunlong_orangepi-zero

define Device/xunlong_orangepi-2
  DEVICE_VENDOR := Xunlong
  DEVICE_MODEL := Orange Pi 2
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-h3
endef
TARGET_DEVICES += xunlong_orangepi-2

define Device/handsome_et-q8-v1.6
  DEVICE_VENDOR := Handsome
  DEVICE_MODEL := Q8 Tablet
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-a33
endef

TARGET_DEVICES += handsome_et-q8-v1.6

define Device/sipeed_licheepi-zero-dock
  DEVICE_VENDOR := Sipeed
  DEVICE_MODEL := Lichee Pi Zero With Dock
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-v3s
  CONFIG_TARGET_ROOTFS_PARTSIZE := 7168
endef

TARGET_DEVICES += sipeed_licheepi-zero-dock

define Device/sipeed_licheepi-zero-spinand
	SOC := sun8i-v3s
	DEVICE_VENDOR := LicheePi
	DEVICE_MODEL := Zero (SPI-NAND)
	DEVICE_PACKAGES:=kmod-rtc-sunxi
	SUPPORTED_DEVICES:=licheepi,licheepi-zero
	SUNXI_DTS:=sun8i-v3s-licheepi-zero-spinand

	KERNEL := kernel-bin | lzma | uImage lzma | sunxi-kernelubifs
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
	# UBINIZE_PARTS := dtb=$(DTS_DIR)/$$(SUNXI_DTS).dtb=1
	IMAGE/ubispinand.img.gz := \
		sunxi-spinandboot | \
		pad-to $$(CONFIG_SUN8I_V3S_OFFSET_UBI) | \
		append-ubi | \
		gzip
endef

TARGET_DEVICES += sipeed_licheepi-zero-spinand

define Device/sinlinx_sinlinx-sinv3s
  DEVICE_VENDOR := SinLinx
  DEVICE_MODEL := SinV3s
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-esp8089
  SOC := sun8i-v3s
endef

TARGET_DEVICES += sinlinx_sinlinx-sinv3s

define Device/sinlinx_sinlinx-sina33
  DEVICE_VENDOR := SinLinx
  DEVICE_MODEL := SinA33
  DEVICE_PACKAGES:=kmod-rtc-sunxi
  SOC := sun8i-a33
endef

TARGET_DEVICES += sinlinx_sinlinx-sina33

define Device/sinlinx_sinlinx-sina33-v3
  DEVICE_VENDOR := SinLinx
  DEVICE_MODEL := SinA33 V3.4
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-brcmfmac kmod-input-touchscreen-ft5x06 \
	brcmfmac-firmware-43362-sdio wpad-basic-wolfssl
  SOC := sun8i-a33
endef

TARGET_DEVICES += sinlinx_sinlinx-sina33-v3

define Device/pine64_pinecube
  DEVICE_VENDOR := Pine64
  DEVICE_MODEL := Pinecube IPCam
  DEVICE_PACKAGES:=kmod-rtc-sunxi kmod-rtl8189es kmod-sun6i-csi kmod-video-csi-ov5640
  SOC := sun8i-s3
endef

TARGET_DEVICES += pine64_pinecube


