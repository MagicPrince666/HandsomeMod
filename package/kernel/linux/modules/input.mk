#
# Copyright (C) 2006-2013 OpenWrt.org
# Copyright (C) 2020-2021 HandsomeMod Project
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

INPUT_MODULES_MENU:=Input modules

define KernelPackage/hid
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=HID Devices
  DEPENDS:=+kmod-input-core +kmod-input-evdev
  KCONFIG:=CONFIG_HID CONFIG_HIDRAW=y CONFIG_HID_BATTERY_STRENGTH=y
  FILES:=$(LINUX_DIR)/drivers/hid/hid.ko
  AUTOLOAD:=$(call AutoLoad,61,hid)
endef

define KernelPackage/hid/description
 Kernel modules for HID devices
endef

$(eval $(call KernelPackage,hid))

define KernelPackage/hid-generic
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Generic HID device support
  DEPENDS:=+kmod-hid
  KCONFIG:=CONFIG_HID_GENERIC
  FILES:=$(LINUX_DIR)/drivers/hid/hid-generic.ko
  AUTOLOAD:=$(call AutoProbe,hid-generic)
endef

define KernelPackage/hid/description
 Kernel modules for generic HID device (e.g. keyboards and mice) support
endef

$(eval $(call KernelPackage,hid-generic))

define KernelPackage/input-core
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Input device core
  KCONFIG:=CONFIG_INPUT
  FILES:=$(LINUX_DIR)/drivers/input/input-core.ko
endef

define KernelPackage/input-core/description
 Kernel modules for support of input device
endef

$(eval $(call KernelPackage,input-core))


define KernelPackage/input-evdev
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Input event device
  DEPENDS:=+kmod-input-core
  KCONFIG:=CONFIG_INPUT_EVDEV
  FILES:=$(LINUX_DIR)/drivers/input/evdev.ko
  AUTOLOAD:=$(call AutoLoad,60,evdev)
endef

define KernelPackage/input-evdev/description
 Kernel modules for support of input device events
endef

$(eval $(call KernelPackage,input-evdev))

define KernelPackage/input-mousedev
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Input mouse device
  DEPENDS:=+kmod-input-core +kmod-input-evdev
  KCONFIG:=CONFIG_INPUT_MOUSE=y \
           CONFIG_MOUSE_PS2=y \
           CONFIG_MOUSE_PS2_ALPS=n \
           CONFIG_MOUSE_PS2_BYD=n \
           CONFIG_MOUSE_PS2_LOGIPS2PP=n \
           CONFIG_MOUSE_PS2_SYNAPTICS=y \
           CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y \
           CONFIG_MOUSE_PS2_CYPRESS=n \
           CONFIG_MOUSE_PS2_LIFEBOOK=n \
           CONFIG_MOUSE_PS2_TRACKPOINT=y \
           CONFIG_MOUSE_PS2_ELANTECH=n \
           CONFIG_MOUSE_PS2_TOUCHKIT=n \
           CONFIG_MOUSE_PS2_FOCALTECH=n \
           CONFIG_MOUSE_PS2_VMMOUSE=y \
           CONFIG_MOUSE_SERIAL=n \
           CONFIG_MOUSE_BCM5974=n \
           CONFIG_MOUSE_CYAPA=n \
           CONFIG_MOUSE_VSXXXAA=n \
           CONFIG_INPUT_MOUSEDEV \
           CONFIG_INPUT_MOUSEDEV_PSAUX=n \
           CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024 \
           CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
  FILES:=$(LINUX_DIR)/drivers/input/mousedev.ko
  AUTOLOAD:=$(call AutoLoad,60,mousedev)
endef

define KernelPackage/input-mousedev/description
 Kernel modules for support of mouse devices.
endef

$(eval $(call KernelPackage,input-mousedev))



define KernelPackage/input-gpio-keys
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=GPIO key support
  DEPENDS:= @GPIO_SUPPORT +kmod-input-core
  KCONFIG:= \
	CONFIG_KEYBOARD_GPIO \
	CONFIG_INPUT_KEYBOARD=y
  FILES:=$(LINUX_DIR)/drivers/input/keyboard/gpio_keys.ko
  AUTOLOAD:=$(call AutoProbe,gpio_keys,1)
endef

define KernelPackage/input-gpio-keys/description
 This driver implements support for buttons connected
 to GPIO pins of various CPUs (and some other chips).

 See also gpio-button-hotplug which is an alternative, lower overhead
 implementation that generates uevents instead of kernel input events.
endef

$(eval $(call KernelPackage,input-gpio-keys))


define KernelPackage/input-gpio-keys-polled
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Polled GPIO key support
  DEPENDS:=@GPIO_SUPPORT +kmod-input-polldev
  KCONFIG:= \
	CONFIG_KEYBOARD_GPIO_POLLED \
	CONFIG_INPUT_KEYBOARD=y
  FILES:=$(LINUX_DIR)/drivers/input/keyboard/gpio_keys_polled.ko
  AUTOLOAD:=$(call AutoProbe,gpio_keys_polled,1)
endef

define KernelPackage/input-gpio-keys-polled/description
 Kernel module for support polled GPIO keys input device

 See also gpio-button-hotplug which is an alternative, lower overhead
 implementation that generates uevents instead of kernel input events.
endef

$(eval $(call KernelPackage,input-gpio-keys-polled))


define KernelPackage/input-gpio-encoder
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=GPIO rotary encoder
  DEPENDS:=@GPIO_SUPPORT +kmod-input-core
  KCONFIG:=CONFIG_INPUT_GPIO_ROTARY_ENCODER
  FILES:=$(LINUX_DIR)/drivers/input/misc/rotary_encoder.ko
  AUTOLOAD:=$(call AutoProbe,rotary_encoder)
endef

define KernelPackage/input-gpio-encoder/description
 Kernel module to use rotary encoders connected to GPIO pins
endef

$(eval $(call KernelPackage,input-gpio-encoder))


define KernelPackage/input-joydev
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Joystick device support
  DEPENDS:=+kmod-input-core
  KCONFIG:=CONFIG_INPUT_JOYDEV
  FILES:=$(LINUX_DIR)/drivers/input/joydev.ko
  AUTOLOAD:=$(call AutoProbe,joydev)
endef

define KernelPackage/input-joydev/description
 Kernel module for joystick support
endef

$(eval $(call KernelPackage,input-joydev))


define KernelPackage/input-polldev
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Polled Input device support
  DEPENDS:=+kmod-input-core
  KCONFIG:=CONFIG_INPUT_POLLDEV
  FILES:=$(LINUX_DIR)/drivers/input/input-polldev.ko
endef

define KernelPackage/input-polldev/description
 Kernel module for support of polled input devices
endef

$(eval $(call KernelPackage,input-polldev))


define KernelPackage/input-matrixkmap
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Input matrix devices support
  DEPENDS:=+kmod-input-core
  KCONFIG:=CONFIG_INPUT_MATRIXKMAP
  FILES:=$(LINUX_DIR)/drivers/input/matrix-keymap.ko
  AUTOLOAD:=$(call AutoProbe,matrix-keymap)
endef

define KernelPackage/input-matrixkmap/description
 Kernel module support for input matrix devices
endef

$(eval $(call KernelPackage,input-matrixkmap))


define KernelPackage/input-touchscreen-ads7846
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=ADS7846/TSC2046/AD7873 and AD(S)7843 based touchscreens
  DEPENDS:=+kmod-hwmon-core +kmod-input-core +kmod-spi-bitbang
  KCONFIG:= \
	CONFIG_INPUT_TOUCHSCREEN=y \
	CONFIG_TOUCHSCREEN_PROPERTIES=y \
	CONFIG_TOUCHSCREEN_ADS7846
  FILES:=$(LINUX_DIR)/drivers/input/touchscreen/ads7846.ko \
	$(LINUX_DIR)/drivers/input/touchscreen/of_touchscreen.ko
  AUTOLOAD:=$(call AutoProbe,ads7846)
endef

define KernelPackage/input-touchscreen-ads7846/description
  Kernel module for ADS7846/TSC2046/AD7873 and AD(S)7843 based touchscreens
endef

$(eval $(call KernelPackage,input-touchscreen-ads7846))

define KernelPackage/input-touchscreen-goodix
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Goodix I2C touchscreen
  DEPENDS:=+kmod-hwmon-core +kmod-i2c-core +kmod-input-evdev
  KCONFIG:= \
	CONFIG_INPUT_TOUCHSCREEN=y \
	CONFIG_TOUCHSCREEN_GOODIX
  FILES:=$(LINUX_DIR)/drivers/input/touchscreen/goodix.ko
  AUTOLOAD:=$(call AutoProbe,goodix)
endef

define KernelPackage/input-touchscreen-goodix/description
  Kernel module for Goodix I2C touchscreen
endef

$(eval $(call KernelPackage,input-touchscreen-goodix))


define KernelPackage/input-touchscreen-silead
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=Silead based touchscreens
  DEPENDS:=+kmod-hwmon-core +kmod-i2c-core +kmod-input-evdev
  KCONFIG:= \
	CONFIG_INPUT_TOUCHSCREEN=y \
	CONFIG_TOUCHSCREEN_SILEAD
  FILES:=$(LINUX_DIR)/drivers/input/touchscreen/silead.ko
  AUTOLOAD:=$(call AutoProbe,silead)
endef

define KernelPackage/input-touchscreen-silead/description
  Kernel module for Silead based touchscreens
endef

$(eval $(call KernelPackage,input-touchscreen-silead))

define KernelPackage/input-touchscreen-ft5x06
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=ft5x06 based touchscreens
  DEPENDS:=+kmod-hwmon-core +kmod-i2c-core +kmod-input-evdev
  KCONFIG:= \
	CONFIG_INPUT_TOUCHSCREEN=y \
	CONFIG_TOUCHSCREEN_EDT_FT5X06
  FILES:=$(LINUX_DIR)/drivers/input/touchscreen/edt-ft5x06.ko
  AUTOLOAD:=$(call AutoProbe,edt-ft5x06)
endef

define KernelPackage/input-touchscreen-ft5x06/description
  Kernel module for ft5x06 based touchscreens
endef

$(eval $(call KernelPackage,input-touchscreen-ft5x06))

define KernelPackage/keyboard-imx
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=IMX keypad support
  DEPENDS:=@(TARGET_mxs||TARGET_imx6) +kmod-input-matrixkmap
  KCONFIG:= \
	CONFIG_KEYBOARD_IMX \
	CONFIG_INPUT_KEYBOARD=y
  FILES:=$(LINUX_DIR)/drivers/input/keyboard/imx_keypad.ko
  AUTOLOAD:=$(call AutoProbe,imx_keypad)
endef

define KernelPackage/keyboard-imx/description
 Enable support for IMX keypad port.
endef

$(eval $(call KernelPackage,keyboard-imx))


define KernelPackage/input-uinput
  SUBMENU:=$(INPUT_MODULES_MENU)
  TITLE:=user input module
  DEPENDS:=+kmod-input-core
  KCONFIG:= \
	CONFIG_INPUT_MISC=y \
	CONFIG_INPUT_UINPUT
  FILES:=$(LINUX_DIR)/drivers/input/misc/uinput.ko
  AUTOLOAD:=$(call AutoProbe,uinput)
endef

define KernelPackage/input-uinput/description
  user input modules needed for bluez
endef

$(eval $(call KernelPackage,input-uinput))
