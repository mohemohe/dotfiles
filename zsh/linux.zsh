#!/bin/zsh

if [[ "$(uname -s)" == "Linux" ]]; then
  if command -v xclip &> /dev/null; then {
    alias pbcopy='xclip -selection c'
    alias pbpaste='xclip -selection c -o'
} fi
fi