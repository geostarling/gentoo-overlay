# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="A Glorified WM-Independent Dropdown Creator"
HOMEPAGE="https://github.com/noctuid/tdrop"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="xrandr tmux"

DEPEND=""
RDEPEND="
	x11-apps/xwininfo
	x11-misc/xdotool
	xrandr? ( x11-apps/xrandr )
	tmux? ( app-misc/tmux )
	${DEPEND}
"

src_compile() {
	emake DESTDIR="${D}"
}
