#!/bin/sh
set -uxe

DIRNAME="$(dirname "$0")"
DOTFILES=$(cd "$DIRNAME"; pwd)

# shellcheck disable=1090,2039
source "$DOTFILES/_lib.sh"

loader pacapt "$DOTFILES/install/pacapt.sh"
loader sshconf "$DOTFILES/install/sshconf.sh"
loader zsh "$DOTFILES/install/zsh.sh"
loader prezto "$DOTFILES/install/prezto.sh"
loader tmux "$DOTFILES/install/tmux.sh"
