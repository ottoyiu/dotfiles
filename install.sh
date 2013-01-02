#!/bin/sh

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR; git submodule init; git submodule update;

VIM_DIR=".vim"
if [[ -d $HOME/$VIM_DIR || -L $HOME/$VIM_DIR ]];
    then
        mv ~/.vim ~/.vim.bak
    fi
ln -s $DIR/vim ~/.vim

VIM_RC=".vimrc"
if [[ -f $HOME/$VIM_RC || -L $HOME/$VIM_RC ]];
    then
        mv ~/.vimrc ~/.vimrc.bak
    fi
ln -s $DIR/vimrc ~/.vimrc

BASH_RC=".bashrc"
if [[ -f $HOME/$BASH_RC || -L $HOME/$BASH_RC ]];
    then
        mv ~/.bashrc ~/.bashrc.bak
    fi
ln -s $DIR/bashrc ~/.bashrc

cp $DIR/git-completion.bash ~/.git-completion.bash
cp $DIR/git-prompt.sh ~/.git-prompt.sh
