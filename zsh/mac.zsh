#!/bin/zsh

if [[ "$(uname -s)" == "Darwin" ]]; then
  alias ls='ls -G'
fi