#!/bin/zsh

uname -r | grep WSL > /dev/null
if [[ "$?" == "1" ]]; then
  alias -s exe='mono'
fi