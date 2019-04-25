#!/bin/sh

mkdir ~/vim-backup
cp ./.vimrc ~
cp ./.gvimrc ~
cp ./.vsvimrc ~
cp ./.vrapperrc ~
cp ./ideavimrc/init/init.vim ~/.ideavimrc
cp ./myvim/snippets/* ~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/
# cp ./myvim/colorschemes/* ~/.vim/dein/
