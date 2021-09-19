#!/bin/zsh

uname -r | grep WSL > /dev/null
if [[ "$?" == "0" ]]; then
  # vscode
  if [[ -x "/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin/code" ]]; then 
    export PATH="$PATH:/mnt/c/Users/$(whoami)/AppData/Local/Programs/Microsoft VS Code/bin"
  fi

  # docker desktop
  if [[ -x "/mnt/c/Program Files/Docker/Docker/resources/bin/docker" ]]; then 
    export PATH="$PATH:/mnt/c/Program Files/Docker/Docker/resources/bin"
  fi

  # keybase
  if [[ -x "/mnt/c/Users/$(whoami)/AppData/Local/Keybase/keybase.exe" ]]; then 
    alias keybase="/mnt/c/Users/$(whoami)/AppData/Local/Keybase/keybase.exe"
  fi
fi