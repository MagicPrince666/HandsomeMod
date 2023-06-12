include $(TOPDIR)/rules.mk


PKG_NAME:=mp4play

PKG_VERSION:=huangliquan-1.0

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=base
	CATEGORY:=Utilities
	TITLE:=play mp4 with framebuffer
	SUBMENU:=Prince
	DEPENDS:= +libpthread +libstdcpp +ffmpeg
endef

define Package/$(PKG_NAME)/description
	play mp4 with framebuffer
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/mp4play $(1)/usr/bin/
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
