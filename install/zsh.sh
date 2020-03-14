#!/bin/sh

ln -nfs "$DOTFILES/zsh" "$HOME/.zsh"
ln -nfs "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
ln -nfs "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
ln -nfs "$DOTFILES/zsh/.zpreztorc" "$HOME/.zpreztorc"
ln -nfs "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"

cat "$HOME/.zshconfig" 1> /dev/null 2> /dev/null
if [[ "$?" != "0" ]]; then {
    cp -f "$DOTFILES/zsh/.zshconfig" "$HOME/.zshconfig"
} fi
touch "$HOME/.zshrc2"