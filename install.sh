#!/bin/sh
set -uxe

DOTFILES="$HOME/.dotfiles"

git_pull_or_clone() {
    cd="$(pwd)"
    if [ -d "$2" ]; then
        cd "$2"
        git reset --hard
        git pull
        git submodule foreach git pull origin master
    else
        git clone --recursive "$1" "$2"
    fi
    cd "$cd"
}

git_pull_or_clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"

find "$DOTFILES/" -print0 -name '*.sh' | xargs -0 -I_ chmod +x '_'
__DOTFILES="$DOTFILES" "$DOTFILES/_init.sh"