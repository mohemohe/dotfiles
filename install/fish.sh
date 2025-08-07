#!/bin/sh

set +u

if [ "$XDG_CONFIG_HOME" = "" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

rm -rf "$XDG_CONFIG_HOME/fish"
mkdir "$XDG_CONFIG_HOME/fish"

ln -nfs "$DOTFILES/fish" "$HOME/.fish"
ln -nfs "$DOTFILES/fish/config.fish" "$XDG_CONFIG_HOME/fish/config.fish"

touch "$HOME/.fish/user.fish"
