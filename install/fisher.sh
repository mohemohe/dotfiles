#!/bin/sh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher_add() {
    /usr/bin/env DOTFILES_INSTALL=1 fish -c "fisher install $1"
}

fisher_add mohemohe/theme-paradox
fisher_add edc/bass
fisher_add oh-my-fish/plugin-expand
fisher_add decors/fish-ghq