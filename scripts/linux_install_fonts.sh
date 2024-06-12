#!/bin/sh
# Install the Nerd Font on Linux

set -e

# variables
font=IosevkaTerm
nerdfonts_version=v3.2.1
font_dir=~/.local/share/fonts

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
if [ -z "$DISPLAY" ]; then
	echo "Skipping the $font Nerd Font installation as Terminal default, as no DISPLAY is set"
else
	echo "Installing the $font Nerd Font as default for the Terminal"
	dconf write /org/gnome/terminal/legacy/profiles:/:"$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")"/font "'$font Nerd Font 12'"
fi
