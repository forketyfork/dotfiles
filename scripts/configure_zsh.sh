#!/bin/sh
# Configure zsh shell as default one
set -e

# make zsh the default shell
case "$SHELL" in
*/bin/zsh)
	echo "zsh is already the default shell, skipping"
	;;
*)
	echo "Setting zsh as the default shell"
	chsh -s "$(which zsh)"
	;;
esac

if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "oh-my-zsh is already installed, skipping"
fi
