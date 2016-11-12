# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils versionator git-r3

DESCRIPTION="Arduino LIRC plugin"
HOMEPAGE="https://github.com/geostarling/arduino-lirc-plugin"
EGIT_REPO_URI="https://github.com/geostarling/arduino-lirc-plugin.git"
DEST_DIR="/usr/lib/lirc/plugins"

KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="app-misc/lirc"
DEPEND="${RDEPEND}
	sys-devel/make
	virtual/pkgconfig"

src_compile() {
	emake all
}

src_install() {
	PLUGINDIR="${D%/}$(pkg-config --variable=plugindir lirc-driver)"
	CONFIGDIR="${D%/}$(pkg-config --variable=configdir lirc-driver)"
	PLUGINDOCS="${D%/}$(pkg-config --variable=plugindocs lirc-driver)"
	mkdir -p "${PLUGINDIR}" "${CONFIGDIR}" "${PLUGINDOCS}" || die
	emake PLUGINDIR="${PLUGINDIR}" \
		  CONFIGDIR="${CONFIGDIR}" \
		  PLUGINDOCS="${PLUGINDOCS}" \
		  install
	dodoc README LICENSE
}

pkg_postinst() {
	elog "For more information follow https://github.com/geostarling/arduino-lirc-plugin"
}
