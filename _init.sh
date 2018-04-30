#!/bin/sh
set -uxe

DIRNAME="$(dirname "$0")"
DOTFILES=$(cd "$DIRNAME"; pwd)

source "$DOTFILES/_lib.sh"

loader pacapt "$DOTFILES/install/pacapt.sh"
loader sshconf "$DOTFILES/install/sshconf.sh"
loader zsh "$DOTFILES/install/zsh.sh"
loader prezto "$DOTFILES/install/prezto.sh"
