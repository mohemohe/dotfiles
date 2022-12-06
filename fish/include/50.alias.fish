#!/bin/fish

abbr cls 'clear'
abbr restartkde 'killall plasmashell &> /dev/null; kstart5 plasmashell | sytemd-cat'
alias ssh "env TERM=xterm-256color ssh"
alias update-dotfiles '~/.dotfiles/install.sh'
alias view 'vim -Ro'
alias fishreload 'exec fish -l'
alias unset 'set -e'

if [ ! command -v pacman &> /dev/null ]
  alias pacman 'pacapt'
end

if ls --help 2>&1 | grep -e '--color' &> /dev/null
  alias ls 'ls --color'
end

Z_VERBOSE_LOG DONE 'initialize alias'
