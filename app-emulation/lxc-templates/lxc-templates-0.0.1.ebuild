# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit eutils versionator git-r3

DESCRIPTION="LinuX Containers templates"
HOMEPAGE="https://github.com/geostarling/lxc-templates"
EGIT_REPO_URI="https://github.com/geostarling/lxc-templates.git"
EGIT_COMMIT="${PV}"
DEST_DIR="/usr/share/lxc"
LXC_TEMPLATE_CONFIG="${DEST_DIR}/config"

KEYWORDS="~amd64 ~arm ~arm64"

LICENSE="MIT"
SLOT="0"

RDEPEND="app-emulation/lxc"

#DEPEND="${RDEPEND}"

DOCS=(README LICENSE)

src_prepare() {

    mkdir -p "${T}/templates"

    sed -e "s|@LXC_TEMPLATE_CONFIG@|${LXC_TEMPLATE_CONFIG}|" \
	-e "s|@LOCALSTATEDIR@|${LOCALSTATEDIR}|" \
	${S}/templates/* > ${T}/templates/ \
	|| die "failed to filter templates"

}

src_install() {
	default

	insinto ${T}/templates
	doins templates/*
	insinto ${DEST_DIR}/hooks
	doins hooks/*
	insinto ${DEST_DIR}/config
	doins config/*
}

pkg_postinst() {
	elog "For more information about template configuration options follow https://github.com/geostarling/lxc-templates"
}
