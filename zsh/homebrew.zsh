#!/bin/zsh

if [[ "$(command -v brew)" != "" ]]; then {
  export BYOBU_PREFIX=$(brew --prefix)
} fi
export HOMEBREW_GITHUB_API_TOKEN="$(cat ${HOME}/.github_token)"
export HOMEBREW_NO_AUTO_UPDATE=1
