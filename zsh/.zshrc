#!/bin/zsh

source "$HOME/.zshconfig"
source "$HOME/.zsh/kurukuru.zsh"

UID="$(id -u)"

function Z_VERBOSE_LOG() {
  if [[ "$INIT_VERBOSE" == "true" ]]; then {
    local tmp="[$1]"
    shift 1
    tmp="$tmp $*"
    echo $tmp
  } fi
}

if [[ "$INIT_VERBOSE" == "false" ]]; then {
  startIndicator 'initializing zsh...'
} else {
  set +m
} fi

command -v neofetch &> /dev/null && neofetch 1> "/tmp/neofetch-$UID" 2>/dev/null &

# macOSのパス初期化　並列化してはいけない
[ -x /usr/libexec/path_helper ] && eval "$(/usr/libexec/path_helper -s)" && Z_VERBOSE_LOG DONE 'initialize path_helper'

source "$HOME/.zsh/prezto.zsh"
source "$HOME/.zsh/export.zsh"
source "$HOME/.zsh/alias.zsh"
source "$HOME/.zsh/detect_terminal.zsh"
source "$HOME/.zsh/hook_ssh_background.zsh"
source "$HOME/.zsh/hook_virtualenv_prompt.zsh"
source "$HOME/.zsh/hook_easy_bg_fg.zsh"
source "$HOME/.zsh/async_init.zsh"
source "$HOME/.zsh/sync_init.zsh"
source "$HOME/.zsh/linux.zsh"
source "$HOME/.zsh/wsl.zsh"
source "$HOME/.zsh/non-wsl.zsh"

source "$HOME/.zsh/homebrew.zsh"
command -v go &> /dev/null && source "$HOME/.zsh/go.zsh"

export PATH=.:$HOME/.local/bin:/opt/bin:./node_modules/.bin:$PATH

stopIndicator
wait
set -m

stty -ixon

if [[ -s "${ZDOTDIR:-$HOME}/.zshrc2" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc2"
fi

echo
[ -e "/tmp/neofetch-$UID" ] && cat "/tmp/neofetch-$UID"

# reset
echo . > /dev/null
