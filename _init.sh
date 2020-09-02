#!/bin/sh
if [ "${SILENT}" != "1" ]; then
    set -uxe
fi

DIRNAME="$(dirname "$0")"
DOTFILES=$(cd "$DIRNAME"; pwd)

# shellcheck disable=1090,2039
. "$DOTFILES/_lib.sh"

mkdir -p "$HOME/.local/bin"

loader pacapt "$DOTFILES/install/pacapt.sh"
loader sshconf "$DOTFILES/install/sshconf.sh"

if [ "$(has_command bash)" -eq "0" ]; then
    loader bash "$DOTFILES/install/bash.sh"
fi

if [ "$(has_command zsh)" -eq "0" ]; then
    loader zsh "$DOTFILES/install/zsh.sh"
    loader prezto "$DOTFILES/install/prezto.sh"
fi

if [ "$(has_command fish)" -eq "0" ]; then
    loader fish "$DOTFILES/install/fish.sh"
    loader fisher "$DOTFILES/install/fisher.sh"
fi

if [ "$(has_command tmux)" -eq "0" ]; then
    loader tmux "$DOTFILES/install/tmux.sh"
fi

if [ "$(has_command vim)" -eq "0" ]; then
    loader vim "$DOTFILES/install/vim.sh"
fi

if [ "$(has_command nvim)" -eq "0" ]; then
    loader neovim "$DOTFILES/install/nvim.sh"
fi

if [ "$(has_command compton)" -eq "0" ]; then
    loader compton "$DOTFILES/install/compton.sh"
fi

if [ "$(has_command tint2)" -eq "0" ]; then
    loader tint2 "$DOTFILES/install/tint2.sh"
fi

if [ "$(has_command jgmenu)" -eq "0" ]; then
    loader jgmenu "$DOTFILES/install/jgmenu.sh"
fi
