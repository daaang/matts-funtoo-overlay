# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

PNU="${PN//-/_}"
DESCRIPTION="Duo two-factor authentication for Unix systems"
HOMEPAGE="https://github.com/duosecurity/duo_unix"
SRC_URI="https://github.com/duosecurity/${PNU}/archive/${PNU}-${PV}.tar.gz"

LICENSE="GPL-2-with-linking-exception"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/openssl virtual/pam sys-libs/zlib
	sys-devel/autoconf-wrapper"
RDEPEND="${DEPEND}"

src_configure() {
	if ! cd "$S"; then
		die "couldn't enter working directory"
	fi

	if ! autoreconf -vfi -I autotools; then
		die "coundn't generate ./configure"
	fi

	if ! econf --with-pam; then
		die "configuration failed"
	fi
}

src_install() {
	emake DESTDIR="$D" install
}
