#!/bin/zsh

export GOPATH="${HOME}/develop"
export PATH="$GOPATH/bin:$PATH"

git config --global ghq.root "${GOPATH}/src"
