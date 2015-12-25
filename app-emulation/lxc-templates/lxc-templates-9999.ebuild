# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils versionator git-r3

DESCRIPTION="LinuX Containers templates"
HOMEPAGE="https://github.com/geostarling/lxc-templates"
EGIT_REPO_URI="https://github.com/geostarling/lxc-templates.git"
DEST_DIR="/usr/share/lxc"

KEYWORDS="~amd64 ~arm ~arm64"

LICENSE="MIT"
SLOT="0"

RDEPEND="app-emulation/lxc"

DOCS=(README.md LICENSE)

src_install() {
	default

	insinto ${DEST_DIR}/hooks
	doins hooks/*
	insinto ${DEST_DIR}/config
	doins config/*
}

pkg_postinst() {
	elog "For more information about template configuration options follow https://github.com/geostarling/lxc-templates"
}
