#
# Copyright (C) 2007-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=django-picklefield
PKG_VERSION:=3.0.1
PKG_RELEASE:=1

PYPI_NAME:=$(PKG_NAME)
PKG_HASH:=15ccba592ca953b9edf9532e64640329cd47b136b7f8f10f2939caa5f9ce4287

PKG_MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

PYTHON3_PKG_SETUP_VARS:= \
  PKG_VERSION="$(PKG_VERSION)"

define Package/python3-django-picklefield
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Pickled object field for Django
  URL:=https://github.com/gintas/django-picklefield/
  DEPENDS:= \
	+python3 \
	+python3-django2
endef

define Package/python3-django-picklefield/description
  Pickled object field for Django
endef

$(eval $(call Py3Package,python3-django-picklefield))
$(eval $(call BuildPackage,python3-django-picklefield))
$(eval $(call BuildPackage,python3-django-picklefield-src))
