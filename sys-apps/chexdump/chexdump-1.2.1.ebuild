# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

DESCRIPTION="Colorful hexdump"
HOMEPAGE="https://github.com/daaang/chexdump"
SRC_URI="https://github.com/daaang/${PN}/archive/${PV}.tar.gz"

LICENSE="BEER-WARE"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/libc"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="$D" install

	dodoc AUTHORS.md NEWS.md README.md
}
