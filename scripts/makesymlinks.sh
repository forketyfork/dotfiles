#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Exit immediately on a non-zero exit code, fail on unknown variables
set -eu

dir="$(dirname "$0")"         # dotfiles directory
dir="$(realpath -- "$dir")"   # absolute path
olddir=~/dotfiles_old         # old dotfiles backup directory
files="vimrc zshrc ocamlinit" # list of files/folders to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p "$olddir"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
	if [ -f "$HOME/.$file" ]; then
		echo "Moving .$file from ~ to $olddir"
		rm -f "$olddir/.$file"
		mv "$HOME/.$file" "$olddir"
	fi
	echo "Creating symlink to $file in home directory"
	ln -fs "$dir/$file" "$HOME/.$file"
done
