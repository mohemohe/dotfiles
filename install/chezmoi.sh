#!/bin/sh

set +u

if [ "$XDG_CONFIG_HOME" = "" ]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

mkdir -p "$XDG_CONFIG_HOME/chezmoi"
cp -rf "${DOTFILES}/chezmoi/chezmoi.toml" "${XDG_CONFIG_HOME}/chezmoi/chezmoi.toml"

chezmoi init git@github.com:mohemohe/chezmoi.git
