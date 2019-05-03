#!/bin/sh

if !(type "git" > /dev/null 2>&1); then
	echo "Install git!!"
	echo "sudo apt install git"
	return
fi

if !(type "ctags" > /dev/null 2>&1); then
	echo "Install ctags!!"
	echo "sudo apt install ctags"
	return
fi

if !(type "gtags" > /dev/null 2>&1); then
	echo "Install gtags!!"
	echo "wget https://ftp.gnu.org/pub/gnu/global/global-6.6.3.tar.gz -O gtags.tar.gz"
	echo "tar zxvf gtags.tar.gz"
	echo "cd gtags"
	echo "./configure"
	echo "make"
	echo "make install"
	return
fi

mkdir ~/vim-backup
cp ./.vimrc ~
cp ./.gvimrc ~
cp ./.vsvimrc ~
cp ./.vrapperrc ~
cp ./ideavimrc/init/init.vim ~/.ideavimrc
cp ./myvim/snippets/* ~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/
