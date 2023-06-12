include $(TOPDIR)/rules.mk


PKG_NAME:=framebuffer

PKG_VERSION:=huangliquan-1.0

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=base
	CATEGORY:=Utilities
	TITLE:=key event firmware
	SUBMENU:=Prince
	DEPENDS:= +libpthread +libstdcpp
endef

define Package/$(PKG_NAME)/description
	uart use epoll firmware 
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/framebuffer $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
