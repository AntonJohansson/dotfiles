#!/bin/sh

git clone --bare https://github.com/AntonJohansson/dotfiles $HOME/git/dotfiles

function conf {
   /usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME $@
}

conf checkout
conf config status.showUntrackedFiles no
