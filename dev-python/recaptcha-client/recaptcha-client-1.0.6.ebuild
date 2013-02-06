# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1

DESCRIPTION="Provides a CAPTCHA for Python using the reCAPTCHA service"
HOMEPAGE="http://pypi.python.org/pypi/recaptcha-client/"
SRC_URI="mirror://pypi/r/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pycrypto"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

PYTHON_MODNAME=recaptcha
