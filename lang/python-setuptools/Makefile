#
# Copyright (C) 2014-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=setuptools
PKG_VERSION:=27.2.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/87/ba/54197971d107bc06f5f3fbdc0d728a7ae0b10cafca46acfddba65a0899d8/
PKG_MD5SUM:=b39715612fdc0372dbfd7b3fcf5d4fe5

HOST_BUILD_DEPENDS:=
ifdef CONFIG_PACKAGE_python-setuptools
HOST_BUILD_DEPENDS+=python python/host
endif
ifeq CONFIG_PACKAGE_python3-setuptools
HOST_BUILD_DEPENDS+=python3 python3/host
endif

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

HOST_BUILD_DIR_PYTHON:=$(BUILD_DIR_HOST)/python-$(PKG_NAME)-$(PKG_VERSION)
HOST_BUILD_DIR_PYTHON3:=$(BUILD_DIR_HOST)/python3-$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
$(call include_mk, python3-package.mk)

define Package/setuptools/Default
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Tool for installing packages
  URL:=https://bitbucket.org/pypa/setuptools
  DEPENDS:=+ca-certificates
  MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
endef

define Package/python-setuptools
$(call Package/setuptools/Default)
  TITLE:= for Python
  DEPENDS+=+python
  VARIANT:=python
endef

define Package/python-setuptools/description
  Easily download, build, install, upgrade, and uninstall Python packages
endef

define Package/python3-setuptools
$(call Package/setuptools/Default)
  TITLE:= for Python3
  DEPENDS+=+python3
  VARIANT:=python3
endef

define Package/python3-setuptools/description
  Easily download, build, install, upgrade, and uninstall Python3 packages
endef

define Host/Patch
	$(if $(HOST_QUILT),rm -rf $(1)/patches; mkdir -p $(1)/patches)
	$(call HostPatchDir,$(1),$(HOST_PATCH_DIR),)
	$(if $(HOST_QUILT),touch $(1)/.quilt_used)
endef

ifdef CONFIG_PACKAGE_python-setuptools
define Host/Prepare/python-setuptools
	$(HOST_TAR) -C $(HOST_BUILD_DIR_PYTHON) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)
	$(call Host/Patch,$(HOST_BUILD_DIR_PYTHON))
endef

define Build/InstallDev/python-setuptools
	$(INSTALL_DIR) $(PYTHON_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(PYTHON_LIB_DIR)
endef

endif # CONFIG_PACKAGE_python-setuptools

ifdef CONFIG_PACKAGE_python3-setuptools
define Host/Prepare/python-setuptools
	$(HOST_TAR) -C $(HOST_BUILD_DIR_PYTHON3) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)
	$(call Host/Patch,$(HOST_BUILD_DIR_PYTHON3))
endef

define Build/InstallDev/python-setuptools
	$(INSTALL_DIR) $(PYTHON3_LIB_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON3_PKG_DIR)/* \
		$(PYTHON3_LIB_DIR)
endef

endif # CONFIG_PACKAGE_python-setuptools

define Host/Prepare
$(call Host/Prepare/python-setuptools)
$(call Host/Prepare/python3-setuptools)
endef

define Host/Compile
$(call HostPy/Compile/Default)
$(call HostPy3/Compile/Default)
endef

Host/Install=:

define Build/InstallDev
$(call Build/InstallDev/python-setuptools)
$(call Build/InstallDev/python3-setuptools)
endef

$(eval $(call HostBuild))

$(eval $(call PyPackage,python-setuptools))
$(eval $(call Py3Package,python3-setuptools))
$(eval $(call BuildPackage,python-setuptools))
$(eval $(call BuildPackage,python3-setuptools))

