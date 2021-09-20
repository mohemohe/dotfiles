#!/bin/zsh

export AWS_DEFAULT_REGION=ap-northeast-1
export AWS_REGION=ap-northeast-1

if command -v awless &> /dev/null; then {
  source <(awless completion zsh)
} fi

if [[ -x '/usr/local/bin/aws_completer' ]]; then {
  complete -C '/usr/local/bin/aws_completer' aws
} fi