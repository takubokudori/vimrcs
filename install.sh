#!/bin/sh

if !(type "git" > /dev/null 2>&1); then
	echo "[Error] git is not intalled!!"
	echo "sudo apt install git"
	return
fi

if !(type "ctags" > /dev/null 2>&1); then
	echo "[Warning] ctags is not installed."
	echo "sudo apt install exuberant-ctags"
fi

if !(type "gtags" > /dev/null 2>&1); then
	echo "[Warning] gtags is not installed."
	echo "wget https://ftp.gnu.org/pub/gnu/global/global-6.6.4.tar.gz -O global-6.6.4.tar.gz"
	echo "tar zxvf global-6.6.4.tar.gz"
	echo "cd global-6.6.4"
	echo "./configure"
	echo "make"
	echo "make install"
fi

mkdir ~/vim-backup
cp ./.vimrc ~
cp ./.gvimrc ~
cp ./.vsvimrc ~
cp ./.vrapperrc ~
cp ./ideavimrc/init/init.vim ~/.ideavimrc
cp ./myvim/snippets/* ~/.vim/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/

