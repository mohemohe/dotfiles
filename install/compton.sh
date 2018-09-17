#!/bin/sh

mkdir -p "$HOME/.config"
ln -nfs "$DOTFILES/compton/compton.conf" "$HOME/.config/compton.conf"