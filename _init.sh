#!/bin/sh
set -uxe

DIRNAME="$(dirname "$0")"
DOTFILES=$(cd "$DIRNAME"; pwd)

# shellcheck disable=1090,2039
source "$DOTFILES/_lib.sh"

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

if [ "$(has_command tmux)" -eq "0" ]; then
    loader tmux "$DOTFILES/install/tmux.sh"
fi
