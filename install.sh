#!/bin/sh
set -x

DOTFILES="$HOME/.dotfiles"

git clone https://github.com/mohemohe/dotfiles.git "$DOTFILES"

echo "##################################################"
echo "  pacapt"
echo "##################################################"

command -v curl &> /dev/null
has_curl="$?"
command -v wget &> /dev/null
has_wget="$?"

pacapt="$HOME/.local/bin"
if [[ "$has_curl" == "0" ]]; then
    curl https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
elif [[ "$has_wget" == "0" ]]; then
    wget -O - https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
else
    echo curlかwgetをインストールして再実行してください
    exit 1
fi

chmod +x "$pacapt"

echo "##################################################"
echo "  zsh"
echo "##################################################"

ln -s "$DOTFILES/zsh/" "$HOME/.zsh"
ln -s "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zshrc2"

echo "##################################################"
echo "  prezto"
echo "##################################################"

git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
ln -s "$HOME/.zprezto/runcoms/zpreztorc" "$HOME/.zpreztorc"
ln -s "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
ln -s "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"