include $(TOPDIR)/rules.mk

PKG_NAME:=linuxcar
PKG_VERSION:=master
PKG_RELEASE:=$(AUTORELEASE)

PKG_SOURCE_PROTO:=git
PKG_SOURCE_NAME:=linuxcar
PKG_SOURCE_URL:=https://github.com/MagicPrince666/linux-car.git
PKG_SOURCE_VERSION:=master
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_SOURCE_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1

PKG_MAINTAINER:=Leo huang

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=a linux car demo
	SUBMENU:=Prince
	DEPENDS:=+libstdcpp +libpthread +libx264
endef

define Package/$(PKG_NAME)/description
	a linux car demo
endef

CMAKE_OPTIONS += 

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d $(1)/etc
	$(CP) $(PKG_BUILD_DIR)/SmartCar $(1)/usr/sbin/
	$(CP) $(PKG_BUILD_DIR)/src/smart_car $(1)/etc/init.d/
	$(CP) $(PKG_BUILD_DIR)/docs/licheepizero_conf.json $(1)/etc/car_conf.json
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
