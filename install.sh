#!/bin/sh
# Run the scripts from scripts/ directory according to the current operating system

set -eu

uname_result="$(uname)"

exec_common_scripts() {
	. scripts/configure_vim.sh
	. scripts/configure_zsh.sh
	. scripts/makesymlinks.sh
}

exec_darwin_scripts() {
	true
}

exec_linux_scripts() {
	. scripts/linux_install_apt_packages.sh
	. scripts/linux_install_fonts.sh
}

case "$uname_result" in
Darwin)
	echo "macOS detected"
	exec_darwin_scripts
	;;
Linux)
	echo "linux detected"
	exec_linux_scripts
	;;
*)
	echo "unknown OS"
	;;
esac

exec_common_scripts
