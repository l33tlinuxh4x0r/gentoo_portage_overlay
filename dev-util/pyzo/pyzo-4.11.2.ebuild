# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{5,6,7,8,9} )
PYTHON_REQ_USE="tk"

inherit distutils-r1 xdg-utils desktop

DESCRIPTION="Cross-platform Python IDE focused on interactivity and introspection, very suitable for scientific computing."
HOMEPAGE="https://pyzo.org"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/pyside2[${PYTHON_USEDEP}]"
#	dev-python/PyQt5[${PYTHON_USEDEP}]"


DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

python_install_all() {
    distutils-r1_python_install_all
    newmenu packaging/linux/org.pyzo.Pyzo.desktop pyzo.desktop
	doicon thonny/res/thonny.png
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
