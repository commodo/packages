#
# Copyright (C) Alexandru Ardelean <ardeleanalex@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=django2
PKG_VERSION:=2.2.17
PKG_RELEASE:=1

PYPI_NAME:=Django
PKG_HASH:=cf5370a4d7765a9dd6d42a7b96b53c74f9446cd38209211304b210fe0404b861

PKG_MAINTAINER:=Alexandru Ardelean <ardeleanalex@gmail.com>
PKG_LICENSE:=BSD-3-Clause
PKG_LICENSE_FILES:=LICENSE LICENSE.python
PKG_CPE_ID:=cpe:/a:djangoproject:django

include ../pypi.mk
include $(INCLUDE_DIR)/package.mk
include ../python3-package.mk

define Package/python3-django2
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=The web framework for perfectionists with deadlines.
  URL:=https://www.djangoproject.com/
  DEPENDS:= \
	+python3 \
	+python3-pytz \
	+python3-sqlparse
  PROVIDES:=django
endef

define Package/python3-django2/description
  The web framework for perfectionists with deadlines (LTS 2.2 series).
endef

define Py3Package/python3-django2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/django-admin.py \
		$(1)/usr/bin/django-admin
endef

$(eval $(call Py3Package,python3-django2))
$(eval $(call BuildPackage,python3-django2))
$(eval $(call BuildPackage,python3-django2-src))
