# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=(python2_{6,7})

inherit distutils-r1 mercurial

DESCRIPTION="Mozilla Sync Server Core libraries"
HOMEPAGE="https://hg.mozilla.org/services/server-core/"

EHG_REPO_URI="https://hg.mozilla.org/services/server-core"

case ${PV} in
9999)
	EHG_REVISION="default"
	;;
*)
	inherit versionator
	MY_PV=$(replace_version_separator 2 '-' "${PV}")
	MY_P="${PN}-${MY_PV}"
	EHG_REVISION="rpm-${MY_PV}"
	S="${WORKDIR}/${PN}"
	;;
esac

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Test require LDAP populated with mozilla data on ldap://localhost
RESTRICT="test"

RDEPEND=">=dev-python/metlog-cef-0.2[${PYTHON_USEDEP}]
		 >=dev-python/metlog-py-0.9.8[${PYTHON_USEDEP}]
		 >=dev-python/paste-1.7.5.1[${PYTHON_USEDEP}]
		 >=dev-python/pastedeploy-1.5.0[${PYTHON_USEDEP}]
		 >=dev-python/pastescript-1.7.5[${PYTHON_USEDEP}]
		 >=dev-python/recaptcha-client-1.0.6[${PYTHON_USEDEP}]
		 >=dev-python/repoze-lru-0.6[${PYTHON_USEDEP}]
		 >=dev-python/repoze-who-2.0[${PYTHON_USEDEP}]
		 >=dev-python/routes-1.13[${PYTHON_USEDEP}]
		 >=dev-python/simplejson-2.6.2[${PYTHON_USEDEP}]
		 >=dev-python/sqlalchemy-0.7.9[${PYTHON_USEDEP}]
		 >=dev-python/webob-1.0.7[${PYTHON_USEDEP}]
		 >=dev-python/wsgiproxy2-0.1[${PYTHON_USEDEP}]
		 >=dev-python/zope-deprecation-4.0[${PYTHON_USEDEP}]
		 >=dev-python/zope-interface-4.0.1[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
		test? ( dev-python/nose[${PYTHON_USEDEP}] )
		dev-python/setuptools[${PYTHON_USEDEP}]"

PATCHES=( ${FILESDIR}/${P}_wsgiproxy2.patch )

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}
