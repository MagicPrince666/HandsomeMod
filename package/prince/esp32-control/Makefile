include $(TOPDIR)/rules.mk

PKG_NAME:=esp32-control

PKG_VERSION:=huangliquan-1.0

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=base
	CATEGORY:=Utilities
	TITLE:=esp32 sdio wifi bluetooth controler
	SUBMENU:=Prince
	DEPENDS:= +libpthread
endef

define Package/$(PKG_NAME)/description
	esp32 sdio wifi bluetooth controler
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/esp32_tool.out $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/rpi_init.sh $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
