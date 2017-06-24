#!/bin/sh

git submodule update --init --recursive

ln -s `realpath .vimrc` ~/.vimrc
ln -s `realpath .vim` ~/.vim
ln -s `realpath .tmux.conf` ~/.tmux.conf

