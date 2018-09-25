# Copyright 2018 Jiri Spacek
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="a git remote helper to push and pull from repositories encrypted with GnuPG"
HOMEPAGE="https://spwhitton.name/tech/code/git-remote-gcrypt"
SRC_URI="https://github.com/spwhitton/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="*"

LICENSE="GPL-3.0"
SLOT="0"

RDEPEND="app-crypt/gnupg
		dev-vcs/git"

src_install() {
	default

	prefix=/usr DESTDIR="${D}" ./install.sh
}
