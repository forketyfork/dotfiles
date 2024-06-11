#!/bin/sh
# Configure zsh shell as default one

set -eu

# make zsh the default shell
echo "Setting zsh as the default shell"
chsh -s "$(which zsh)"

echo "Installing oh-my-zsh"
ZSH="sh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# download the font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/IosevkaTerm.zip
cd ~/.local/share/fonts
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
