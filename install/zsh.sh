#!/bin/sh

ln -nfs "$DOTFILES/zsh" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
touch "$HOME/.zshrc2"