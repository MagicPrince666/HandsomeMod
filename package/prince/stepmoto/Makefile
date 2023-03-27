include $(TOPDIR)/rules.mk

PKG_NAME:=stepmoto
PKG_VERSION:=huangliquan-1.0
PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/$(PKG_NAME)
	SECTION:=base
	CATEGORY:=Utilities
	TITLE:=step moto contrl
	SUBMENU:=Prince
	DEPENDS:= +libstdcpp
endef

define Package/$(PKG_NAME)/description
	step moto contrl
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/etc/init.d
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/StepMote $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/smart_moto $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
