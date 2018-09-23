# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

CRATES="adler32-1.0.3
aho-corasick-0.6.6
anymap-0.12.1
argparse-0.2.1
arrayref-0.3.4
atty-0.2.11
backtrace-0.3.9
backtrace-sys-0.1.23
bitflags-1.0.3
blake2-0.7.1
block-buffer-0.3.3
build_const-0.2.1
byte-tools-0.2.0
bzip2-0.3.3
bzip2-sys-0.1.6
cc-1.0.18
cfg-if-0.1.5
cloudabi-0.0.3
cmake-0.1.32
constant_time_eq-0.1.3
crc-1.8.1
crypto-mac-0.5.2
digest-0.7.5
digest-writer-0.3.1
dir-signature-0.2.9
docopt-1.0.0
dtoa-0.4.3
either-1.5.0
env_logger-0.5.12
failure-0.1.2
failure_derive-0.1.2
fake-simd-0.1.2
filetime-0.2.1
flate2-1.0.2
fnv-1.0.6
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.23
futures-cpupool-0.1.8
generic-array-0.9.0
git2-0.7.5
globset-0.4.1
humannum-0.1.0
humantime-1.1.1
idna-0.1.5
itertools-0.7.8
itoa-0.4.2
lazy_static-1.1.0
libc-0.2.43
libgit2-sys-0.7.7
libmount-0.1.11
libz-sys-1.0.20
log-0.4.3
lzma-sys-0.1.10
matches-0.1.7
memchr-2.0.1
miniz-sys-0.1.10
miniz_oxide-0.1.3
miniz_oxide_c_api-0.1.3
mopa-0.2.2
msdos_time-0.1.6
net2-0.2.33
nix-0.11.0
num-traits-0.1.43
num-traits-0.2.5
num_cpus-1.8.0
openat-0.1.16
percent-encoding-1.0.1
pkg-config-0.3.13
podio-0.1.6
proc-macro2-0.4.11
quick-error-1.2.2
quire-0.4.1
quote-0.6.6
rand-0.5.5
rand_core-0.2.1
redox_syscall-0.1.40
redox_termios-0.1.1
regex-1.0.2
regex-syntax-0.6.2
remove_dir_all-0.5.1
resolv-conf-0.6.1
rustc-demangle-0.1.9
same-file-1.0.2
scan_dir-0.3.3
serde-1.0.71
serde_derive-1.0.71
serde_json-1.0.24
sha2-0.7.1
signal-0.6.0
strsim-0.7.0
syn-0.14.8
synstructure-0.9.0
tar-0.4.16
tempfile-3.0.3
termcolor-1.0.1
termion-1.5.1
thread_local-0.3.5
time-0.1.40
typenum-1.10.0
ucd-util-0.1.1
unicode-bidi-0.3.4
unicode-normalization-0.1.7
unicode-xid-0.1.0
unreachable-1.0.0
unshare-0.5.0
url-1.7.1
utf8-ranges-1.0.0
vcpkg-0.2.4
version_check-0.1.4
void-1.0.2
walkdir-2.2.0
winapi-0.3.5
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
wincolor-1.0.0
xattr-0.2.2
xz2-0.1.5
zip-0.4.2"

inherit cargo

DESCRIPTION="a fully-userspace container engine without daemons"
HOMEPAGE="https://github.com/tailhook/vagga"
SRC_URI="https://github.com/tailhook/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris ${CRATES})"
DEST_DIR="/usr"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm ~arm64"
DEPEND="virtual/rust"

src_test() {
	cargo test -v || die "tests failed"
}

src_install() {
	cargo_src_install
	dodoc -r docs/*

	# install bash/zsh completion and keybindings
	newbashcomp completions/bash-completion.sh vagga.sh
	newins completions/zsh-completion.sh "${DESTDIR}"/share/zsh/site-functions/_vagga
}

pkg_postinst() {
	elog "For more information about template configuration options follow https://github.com/geostarling/lxc-templates"
}
