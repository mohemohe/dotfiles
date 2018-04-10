#!/bin/sh
set -xe

DOTFILES="$HOME/.dotfiles"

git clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"

command -v curl &> /dev/null
has_curl="$?"
command -v wget &> /dev/null
has_wget="$?"

## pacapt
pacapt="$HOME/.local/bin/pacapt"
if [[ ! -x "$pacapt" ]]; then
    if [[ "$has_curl" == "0" ]]; then
        curl https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
    elif [[ "$has_wget" == "0" ]]; then
        wget -O - https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
    else
        echo curlかwgetをインストールして再実行してください
        exit 1
    fi
fi

chmod +x "$pacapt"

## zsh
ln -nfs "$DOTFILES/zsh/" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zshrc2"

## prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
ln -nfs "$HOME/.zprezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
ln -nfs "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
ln -nfs "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"