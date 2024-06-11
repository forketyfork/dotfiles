#!/bin/sh
# Installation of vim-pathogen and vim bundles

# Exit immediately on a non-zero exit code
set -e

# Install vim-pathogen
echo "Creating required vim configuration directories"
mkdir -p ~/.vim/autoload ~/.vim/bundle
echo "Downloading pathogen.vim"
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install haskell-vim bundle
haskell_vim_dir=~/.vim/bundle/haskell-vim
if [ -d "$haskell_vim_dir" ]; then
    echo "The $haskell_vim_dir directory exists, pulling"
    git -C "$haskell_vim_dir" pull
else
    echo "The $haskell_vim_dir directory doesn't exist, cloning"
    git clone https://github.com/neovimhaskell/haskell-vim.git "$haskell_vim_dir"
fi
