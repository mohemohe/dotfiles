#!/bin/sh

mkdir -p "$HOME/.config"
ln -nfs "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"