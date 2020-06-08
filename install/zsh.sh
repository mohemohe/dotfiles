#!/bin/sh

ln -nfs "$DOTFILES/zsh" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -nfs "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -nfs "$DOTFILES/zsh/.zpreztorc" "$HOME/.zpreztorc"
ln -nfs "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"

if [[ ! -f "$HOME/.zshconfig" ]]; then {
    cp -f "$DOTFILES/zsh/.zshconfig" "$HOME/.zshconfig"
} fi
touch "$HOME/.zshrc2"
