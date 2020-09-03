#!/bin/sh

mkdir -p "$HOME/.vim/autoload"
cp -rf "$DOTFILES/vim/.vim" "$HOME/"
ln -nfs "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
touch "$HOME/.vimrc2"

rm -f "${HOME}/.vim/autoload/plug.vim"
fetch https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > "${HOME}/.vim/autoload/plug.vim"

if [ "${CI:-0}" != "1" ]; then
    vim +silent +VimEnter +PlugInstall +qall
fi