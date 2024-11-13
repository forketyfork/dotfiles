#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Exit immediately on a non-zero exit code, fail on unknown variables
set -eu

dir="$(dirname "$0")"                  # dotfiles directory
dir="$(realpath -- "$dir")"            # absolute path
olddir=~/dotfiles_old                  # old dotfiles backup directory
files="vimrc zshrc ocamlinit newsboat" # list of files/folders to symlink in homedir
config_dirs="nvim zed"                 # list of .config folders to symlink in homedir

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

# move any existing .config/ directories to dotfiles_old directory, then create symlinks
for config_dir in $config_dirs; do
	if [ -d "$HOME/.config/$config_dir" ]; then
		echo "Moving .config/$config_dir from ~ to $olddir"
		rm -f "$olddir/$config_dir"
		mv "$HOME/.config/$config_dir" "$olddir"
	fi
	echo "Creating symlink to $config_dir in .config directory"
	ln -fs "$dir/config/$config_dir" "$HOME/.config/$config_dir"
done
