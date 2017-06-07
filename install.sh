#!/bin/sh

git submodule foreach git pull origin master

ln -s `realpath .vimrc` ~/.vimrc
ln -s `realpath .vim` ~/.vim
ln -s `realpath .tmux.conf` ~/.tmux.conf

