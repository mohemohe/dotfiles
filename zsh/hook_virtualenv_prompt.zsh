#!/bin/zsh

function precmd_prompt-iikanji() {
  if [[ $PROMPT == \(* ]]; then
    export PROMPT="
virtualenv: ${PROMPT}"
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_prompt-iikanji
