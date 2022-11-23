#!/bin/sh

set +u

if [ "$XDG_CONFIG_HOME" = "" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

set -u

ln -nfs "$DOTFILES/fish" "$HOME/.fish"
ln -nfs "$DOTFILES/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish"
ln -nfs "$DOTFILES/fish/fish_plugins" "$XDG_CONFIG_HOME/fish/fish_plugins"

touch "$HOME/.fish/user.fish"
