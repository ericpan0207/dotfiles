#!/usr/bin/env bash
#
# Author: Eric Pan <me0207@gmail.com>
# Source: https://github.com/ericpan0207/dotfiles

echo "Installing dotfiles."
wget -P ~/.vim/ https://raw.githubusercontent.com/ericpan0207/dotfiles/master/vim/vim-plug.vim
wget -P ~/ https://raw.githubusercontent.com/ericpan0207/dotfiles/master/vim/.vimrc
wget -P ~/.vim/plugin https://raw.githubusercontent.com/jiangmiao/auto-pairs/master/plugin/auto-pairs.vim
wget -P ~/.vim/autoload/ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo -e "\nInstalling vim plugins..."
vim ~/.vim/vim-plug.vim +source\ % +PlugInstall +qall

cwd=$(pwd)
cd ~/.vim/plugged/youcompleteme/
./install.py --clangd-completer --java-completer
cd $cwd

echo -e "\n...Finished installing"
