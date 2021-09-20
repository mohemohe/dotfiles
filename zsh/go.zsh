#!/bin/zsh

export GOPATH="${HOME}/develop"
export PATH="$GOPATH/bin:$PATH"
export GO111MODULES=on

git config --global ghq.root "${GOPATH}/src"
