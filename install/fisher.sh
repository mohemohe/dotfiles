#!/bin/sh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

/usr/bin/env fish -c "fisher update"
