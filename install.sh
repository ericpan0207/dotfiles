#!/usr/bin/env bash
#
# Author: Eric Pan <me0207@gmail.com>
# Source: https://github.com/ericpan0207/dotfiles

echo "Installing dotfiles."

echo "Initializing submodule(s)"
git submodule update --init --recursive

# List of files to be installed
files="vim"

# Directories to install from and backup to
DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
OLDDOTFILES=~/.olddotfiles

echo -e "Creating $OLDDOTFILES for backup of any existing dotfiles in ~"
mkdir -p $OLDDOTFILES
echo -e "...done\n"

# Change to the my-dot-files directory
echo "Changing to the $DOTFILES directory"
cd $DOTFILES
echo -e "...done\n"

echo -e "Moving any existing dotfiles from ~ to $OLDDOTFILES\n"
for file in $files; do
    if [ -e ~/.$file ]; then
        if [ -d ~/.$file ]; then
            # Move entire folder
            mv -v ~/.$file $OLDDOTFILES/
        else
            mv -v ~/.$file $OLDDOTFILES/.$file
        fi
    fi
done
echo -n "${reset}"

# Create symlinks
echo -e "\nCreating symlinks in home directory."
for file in $files; do
    ln -snfv $DOTFILES/$file ~/.$file
done

git submodule update --nit --recursive

echo -e "\nInstalling vim plugins..."
vim -u NONE ./vim/vim-plug.vim +source\ % +PlugInstall +qall

echo -e "\n...Finished installing"
