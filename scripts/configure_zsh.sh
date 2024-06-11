#!/bin/sh
# Configure zsh shell as default one

set -eu

# make zsh the default shell
echo "Setting zsh as the default shell"
chsh -s "$(which zsh)"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

