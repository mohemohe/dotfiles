#!/bin/sh

git_pull_or_clone https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
ln -nfs "$HOME/.zprezto/runcoms/zprofile" "$HOME/.zprofile"
ln -nfs "$HOME/.zprezto/runcoms/zshenv" "$HOME/.zshenv"
