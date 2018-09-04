#!/bin/sh

mkdir ~/vim-backup
mv ./.vimrc ~
mv ./.gvimrc ~

cp ./myvim/snippets/* ~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/
# cp ./myvim/colorschemes/* ~/.vim/dein/
