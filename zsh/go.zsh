#!/bin/zsh

export GOPATH="${HOME}/develop"
export PATH="$GOPATH/bin:$PATH"

git config --add --global ghq.root "${GOPATH}/src"
