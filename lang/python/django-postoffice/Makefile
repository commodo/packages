#
# Copyright (C) 2007-2017 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=django-postoffice
PKG_VERSION:=3.5.3
PKG_RELEASE:=1

PYPI_NAME:=django-post-office
PYPI_SOURCE_NAME:=django-post_office
PKG_HASH:=1454823691e7f323768e1e19f018590ca47890681ac72e5eee9cbac838ee04df

PKG_MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE.txt

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-django-postoffice
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=A Django app to monitor and send mail asynchronously
  URL:=https://github.com/ui/django-post_office
  DEPENDS:= \
	+python3 \
	+python3-django2 \
	+python3-django-jsonfield2
endef

define Package/python3-django-postoffice/description
  A Django app to monitor and send mail asynchronously, complete with template
  support
endef

$(eval $(call Py3Package,python3-django-postoffice))
$(eval $(call BuildPackage,python3-django-postoffice))
$(eval $(call BuildPackage,python3-django-postoffice-src))
