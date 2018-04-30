#!/bin/sh

ln -nfs "$DOTFILES/zsh" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -nfs "$DOTFILES/zsh/.zpreztorc" "$HOME/.zpreztorc"
touch "$HOME/.zshrc2"