#!/bin/sh
# Configure zsh shell as default one

set -eu

# variables
font=IosevkaTerm
nerdfonts_version=v3.2.1

# make zsh the default shell
echo "Setting zsh as the default shell"
chsh -s "$(which zsh)"

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed, skipping"
fi

# download the Iosevka font
cho "Downloading and installing the IosevkaTerm font"
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfonts_version/$font.zip
cd ~/.local/share/fonts
unzip $font.zip
rm $font.zip
fc-cache -fv
