#!/bin/sh
set -xe

DOTFILES="$HOME/.dotfiles"

function git_pull_or_clone() {
    cd="$(pwd)"
    if [[ -d "$2" ]]; then
        cd "$2"
        git pull
        git submodule foreach git pull origin master
    else
        git clone --recursive "$1" "$2"
    fi
    cd "$cd"
}

git_pull_or_clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"

set +e
command -v curl &> /dev/null
has_curl="$?"
command -v wget &> /dev/null
has_wget="$?"
set -e

pacapt="$HOME/.local/bin/pacapt"
fetch=
if [[ ! -x "$pacapt" ]]; then
    if [[ "$has_curl" == "0" ]]; then
        fetch="curl -L"
    elif [[ "$has_wget" == "0" ]]; then
        fetch="wget -O -"
    else
        echo curlかwgetをインストールして再実行してください
        exit 1
    fi
fi

mkdir -p "$HOME/.local/bin"

## pacapt
if [[ -e "$pacapt" ]]; then
    rm -f "$pacapt"
fi
$fetch https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
chmod +x "$pacapt"

## sshconf
sshconf="$HOME/.local/bin/sshconf"
if [[ -e "$sshconf" ]]; then
    rm -f "$sshconf"
fi
$fetch https://raw.githubusercontent.com/mohemohe/sshconf/master/sshconf >| "$sshconf"
chmod +x "$sshconf"

## zsh
ln -nfs "$DOTFILES/zsh" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zshrc2"

## prezto
git_pull_or_clone https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
ln -nfs "$HOME/.zprezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
ln -nfs "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
ln -nfs "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"
