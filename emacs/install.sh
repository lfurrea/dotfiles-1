#!/usr/bin/env bash

EMACSD_DIR=~/.emacs.d
CUSTOM_DIR=$EMACSD_DIR/custom
DOTFILES_ROOT=$(pwd -P)

if [[ -d ~/.emacs.d ]]
then
    mkdir -p "$CUSTOM_DIR" 
    for src in $(find -H "$DOTFILES_ROOT/emacs" -maxdepth 2 -name '*.el'  )
    do
	cp "$src" "$CUSTOM_DIR" 
    done
    cp "$DOTFILES_ROOT/emacs/Cask" "$EMACSD_DIR"
fi

# This depends on using Brewfile to install dependencies
# cd $EMACSD_DIR && cask install
