#!/bin/sh

set +u

if [ "$XDG_CONFIG_HOME" -eq "" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

set -u

ln -nfs "$DOTFILES/fish" "$HOME/.fish"
ln -nfs "$DOTFILES/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish"

touch "$XDG_CONFIG_HOME/fish/user.fish"
