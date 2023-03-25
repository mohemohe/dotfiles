# .bashrc

if [ -f /etc/bashrc ]; then {
    source /etc/bashrc
} fi

export BASH_LIB="${HOME}/.dotfiles/bash"
source "${BASH_LIB}/init.sh"
export PATH=".:${PATH}"

stty -ixon

if [[ -s "${HOME}/.bashrc2" ]]; then {
    source "${HOME}/.bashrc2"
} fi

[[ -s "/home/mohemohe/.gvm/scripts/gvm" ]] && source "/home/mohemohe/.gvm/scripts/gvm"

source /Users/mohemohe/.docker/init-bash.sh || true # Added by Docker Desktop
. "$HOME/.cargo/env"
