#!/bin/bash

if [ "$XDG_CONFIG_HOME" = "" ]; then
  XDG_CONFIG_HOME="$HOME/.config"
fi

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
ln -nfs "$DOTFILES/fish/fish_plugins" "$XDG_CONFIG_HOME/fish/fish_plugins"

(/usr/bin/env fish -c "fisher update")
