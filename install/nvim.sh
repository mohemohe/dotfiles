#!/bin/sh

mkdir -p "${HOME}/.local/share/nvim/site/autoload"
mkdir -p "${HOME}/.config/nvim"
cp -rf "${DOTFILES}/vim/.vim" "${HOME}/"
ln -nfs "${DOTFILES}/vim/.vimrc" "${HOME}/.config/nvim/init.vim"
touch "${HOME}/.vimrc2"

rm -f "${HOME}/.local/share/nvim/site/autoload/plug.vim"
fetch https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > "${HOME}/.local/share/nvim/site/autoload/plug.vim"

if [ "${CI}" != "1" ]; then
    nvim +silent +VimEnter +PlugInstall +qall
fi