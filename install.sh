#!/bin/sh
set -uxe

DOTFILES="$HOME/.dotfiles"

git_pull_or_clone() {
    cd="$(pwd)"
    if [ -d "$2" ]; then
        cd "$2"
        git pull
        git submodule foreach git pull origin master
    else
        git clone --recursive "$1" "$2"
    fi
    cd "$cd"
}

git_pull_or_clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"

chmod +x "$DOTFILES/_init.sh"
__DOTFILES="$DOTFILES" "$DOTFILES/_init.sh"