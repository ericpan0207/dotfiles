# My personal vim setup

## Features
* Using auto paranthesis / brackets / etc
* Fuzzy file finding
* Auto Completion

## Dependencies
See [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) Install instructions
* vim 7.4.1578 or higher
* Install development tools, CMake, and Python headers

## Installation

#### Manual Install
* Copy `vim/vim-plug.vim` to `~/.vim/`
* Copy `vim/.vimrc` to `~/`
* Install [auto-pairs](https://github.com/jiangmiao/auto-pairs)
* Install [vim-plug](https://github.com/junegunn/vim-plug)
* Enter into a vim environment and run `:PlugInstall`
* Install [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) by going to `~/.vim/plugged/youcompleteme` and running `./install.py` with your language support preferences

#### Auto Install
By default will include C-family languages (C/C++/Objective-C/Objective-C++/CUDA) and Java for [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe) plugin
```shell
git clone https://github.com/ericpan0207/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh
```

## Screenshot
![Screenshot](https://raw.githubusercontent.com/ericpan0207/dotfiles/master/vimrc.PNG)

## Future Changes
* Update ycm to run smoother
* more bindings
* Make own version of auto-pairs

## Issues
* Auto-pairs is sometimes buggy
* Semantic auto completion not yet fully integrated
