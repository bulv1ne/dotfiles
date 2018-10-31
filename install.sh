#!/bin/sh

git submodule update --init --recursive

[ ! -e ~/.vimrc ] && ln -s `realpath .vimrc` ~/.vimrc
[ ! -e ~/.vim ] && ln -s `realpath .vim` ~/.vim
[ ! -e ~/.tmux.conf ] && ln -s `realpath .tmux.conf` ~/.tmux.conf
[ ! -e ~/.emacs ] && ln -s `realpath .emacs` ~/.emacs
