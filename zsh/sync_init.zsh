#!/bin/zsh

if [[ -f "$HOME/.fzf.zsh" ]]; then {
    eval "$(source "$HOME/.fzf.zsh")"
    Z_VERBOSE_LOG DONE 'initialize fzf'
} fi

if [[ -d ~/.goenv ]]; then {
    export GOENV_ROOT="$HOME/.goenv"
    export PATH="$GOENV_ROOT/bin:$PATH"
    export GOENV_DISABLE_GOPATH=1
} fi

if command -v goenv &> /dev/null; then {
    eval "$(goenv init -)"
    Z_VERBOSE_LOG DONE 'initialize goenv'
} fi

if [[ -d ~/.rbenv ]]; then {
    export PATH="$HOME/.rbenv/bin:$PATH"
} fi

if command -v rbenv &> /dev/null; then {
    eval "$(rbenv init -)"
    Z_VERBOSE_LOG DONE 'initialize rbenv'
} fi

if [[ -d ~/.pyenv ]]; then {
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
} fi

if command -v pyenv &> /dev/null; then {
    eval "$(pyenv init -)"
    Z_VERBOSE_LOG DONE 'initialize pyenv'

    if pyenv virtualenv-init - &> /dev/null; then {
        eval "$(pyenv virtualenv-init -)"
        Z_VERBOSE_LOG DONE 'initialize pyenv-virtualenv'
    } fi
} fi

if [[ -d ~/.n ]]; then {
    export N_PREFIX="$HOME/.n"
    export PATH="$N_PREFIX/bin:$PATH"
    Z_VERBOSE_LOG DONE 'initialize n'
} fi

if [[ -d ~/.yarn ]]; then {
    export PATH="$HOME/.yarn/bin:$PATH"
    Z_VERBOSE_LOG DONE 'initialize yarn'
} fi

if [[ "$LUNCHY_DIR" != "" &&  -f "$LUNCHY_DIR/lunchy-completion.zsh" ]]; then {
    eval "$("$LUNCHY_DIR/lunchy-completion.zsh")"
    Z_VERBOSE_LOG DONE 'initialize launchy'
} fi

if [[ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]]; then {
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    Z_VERBOSE_LOG DONE 'initialize google-cloud-sdk (path)'
} fi

if [[ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]]; then {
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    Z_VERBOSE_LOG DONE 'initialize google-cloud-sdk (completion)'
} fi

if command -v fasd &> /dev/null; then {
    eval "$(fasd --init auto)" &> /dev/null && \
    Z_VERBOSE_LOG DONE 'initialize fasd'
} fi
    
if command -v thefuck &> /dev/null; then {
    eval "$(thefuck --alias)" && \
    Z_VERBOSE_LOG DONE 'initialize thefuck'
} fi

if command -v direnv &> /dev/null; then {
    eval "$(direnv hook $SHELL)" && \
    Z_VERBOSE_LOG DONE 'initialize direnv'
} fi
