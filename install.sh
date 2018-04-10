#!/bin/sh
set -xe

DOTFILES="$HOME/.dotfiles"

cd="$(pwd)"
if [[ -d "$DOTFILES" ]]; then
    cd "$DOTFILES"
    git pull
else
    git clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"
fi
cd "$cd"

command -v curl &> /dev/null
has_curl="$?"
command -v wget &> /dev/null
has_wget="$?"

if [[ ! -x "$pacapt" ]]; then
    if [[ "$has_curl" == "0" ]]; then
        alias fetch="curl"
    elif [[ "$has_wget" == "0" ]]; then
        alias fetch="wget -O -"
    else
        echo curlかwgetをインストールして再実行してください
        exit 1
    fi
fi

mkdir -p "$HOME/.local/bin"

## pacapt
pacapt="$HOME/.local/bin/pacapt"
fetch https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
chmod +x "$pacapt"

## sshconf
sshconf="$HOME/.local/bin/sshconf"
fetch https://raw.githubusercontent.com/mohemohe/sshconf/master/sshconf > "$sshconf"
chmod +x "$sshconf"

## zsh
ln -nfs "$DOTFILES/zsh/" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zshrc2"

## prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
ln -nfs "$HOME/.zprezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
ln -nfs "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
ln -nfs "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"