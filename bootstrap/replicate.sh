#!/bin/sh
tempfolder="/tmp/dots`uuidgen`"
gitdir="$HOME/.dotfiles"
git clone --recursive --separate-git-dir="$gitdir" git@github.com:rehashedsalt/home.git $tempfolder
rsync -rvl --exclude ".git" $tempfolder/ $HOME/
rm -r $tempfolder
git submodule update --init --recursive --remote --git-dir="$gitdir" --work-tree="$HOME" $HOME/
git config --git-dir="$gitdir" status.showUntrackedFiles no
