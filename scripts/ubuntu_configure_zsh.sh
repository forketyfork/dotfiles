#!/bin/sh
# Configure zsh shell as default one
set -eu

# variables
font=IosevkaTerm
nerdfonts_version=v3.2.1
font_dir=~/.local/share/fonts

# make zsh the default shell
if [ "$SHELL" = /usr/bin/zsh ]; then
	echo "zsh is already the default shell, skipping"
else
	echo "Setting zsh as the default shell"
	chsh -s "$(which zsh)"
fi

if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "oh-my-zsh is already installed, skipping"
fi

# download the Iosevka font
if [ ! -f $font_dir/"$font"NerdFont-Regular.ttf ]; then
	echo "Downloading and installing the $font Nerd Font"
	mkdir -p $font_dir
	wget -O $font_dir/$font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/$nerdfonts_version/$font.zip
	cd $font_dir
	unzip -o $font.zip
	rm $font.zip
	fc-cache -fv
else
	echo "Font $font already exists, skipping"
fi

# install the Iosevka font as the terminal default
dconf write /org/gnome/terminal/legacy/profiles:/:"$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")"/font "'$font Nerd Font 12'"
