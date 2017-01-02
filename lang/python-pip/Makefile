#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=pip
PKG_VERSION:=8.1.2
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://pypi.python.org/packages/e7/a8/7556133689add8d1a54c0b14aeff0acb03c64707ce100ecd53934da1aa13/
PKG_MD5SUM:=87083c0b9867963b29f7aba3613e8f4a
PKG_USE_MIPS16:=0

HOST_BUILD_DEPENDS:=python-setuptools/host
ifeq ($(CONFIG_PACKAGE_python-pip),y)
HOST_BUILD_DEPENDS+=python python/host
endif
ifeq ($(CONFIG_PACKAGE_python3-pip),y)
HOST_BUILD_DEPENDS+=python3 python3/host
endif

PKG_BUILD_DIR:=$(BUILD_DIR)/$(BUILD_VARIANT)-$(PKG_NAME)-$(PKG_VERSION)
PKG_UNPACK=$(HOST_TAR) -C $(PKG_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

HOST_BUILD_DIR:=$(BUILD_DIR_HOST)/pip-$(PKG_NAME)-$(PKG_VERSION)
HOST_UNPACK:=$(HOST_TAR) -C $(HOST_BUILD_DIR) --strip-components=1 -xzf $(DL_DIR)/$(PKG_SOURCE)

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
$(call include_mk, python3-package.mk)

define Package/pip/Default
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Tool for installing packages
  URL:=https://pip.pypa.io
  DEPENDS:=+ca-certificates +python-pip-conf
  MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
endef

define Package/python-pip-conf
$(call Package/pip/Default)
  DEPENDS:=
  TITLE:=pip.conf file for both pip & pip3
endef

define Package/python-pip-conf/description
  Common configuration file for both pip & pip3.
endef

define Package/python-pip
$(call Package/pip/Default)
  TITLE+= for Python
  DEPENDS+=+python +python-setuptools
  VARIANT:=python
endef

define Package/python-pip/description
  A tool for installing and managing Python packages (for Python2).
endef

define Package/python3-pip
$(call Package/pip/Default)
  TITLE+= for Python3
  DEPENDS+=+python3 +python3-dev \
           +python3-lib2to3 +python3-setuptools
  VARIANT:=python3
endef

define Package/python3-pip/description
  A tool for installing and managing Python packages (for Python3).
endef

define Package/python-pip-conf/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/pip.conf $(1)/etc/
endef

define PyPackage/python-pip/filespec
+|$(PYTHON_PKG_DIR)
-|$(PYTHON_PKG_DIR)/pip/_vendor/distlib/*.exe
endef

define PyPackage/python-pip/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin
endef

define Py3Package/python3-pip/filespec
+|$(PYTHON3_PKG_DIR)
-|$(PYTHON3_PKG_DIR)/_vendor/distlib/*.exe
-|$(PYTHON3_PKG_DIR)/utils/outdated.py
endef

define Py3Package/python3-pip/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/pip$(PYTHON3_VERSION) $(1)/usr/bin
	$(LN) pip$(PYTHON3_VERSION) $(1)/usr/bin/pip3
endef

define Host/Compile
$(call HostPy/Compile/Default)
$(call HostPy3/Compile/Default)
endef

define Host/Install
endef

$(eval $(call HostBuild))

$(eval $(call PyPackage,python-pip))
$(eval $(call Py3Package,python3-pip))
$(eval $(call BuildPackage,python-pip-conf))
$(eval $(call BuildPackage,python-pip))
$(eval $(call BuildPackage,python3-pip))
