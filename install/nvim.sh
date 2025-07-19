#!/bin/sh

if [ -L "${HOME}/.config/nvim" ]; then
    rm -f "${HOME}/.config/nvim"
fi
ln -nfs "$DOTFILES/nvim" "${HOME}/.config/nvim"
