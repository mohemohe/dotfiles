#!/bin/zsh

( \
  [ -f ~/.fzf.zsh ] && \
    eval "$(source ~/.fzf.zsh)" && \
    Z_VERBOSE_LOG DONE 'initialize fzf' \
) & ( \
  [ -d ~/.rbenv ] && \
    eval "$(rbenv init -)" && \
    Z_VERBOSE_LOG DONE 'initialize rbenv' \
) & ( \
  [ -d ~/.pyenv ] && \
    eval "$(pyenv init -)" &&
    export PATH="~/.pyenv/bin:$PATH" && \
    Z_VERBOSE_LOG DONE 'initialize pyenv' && \
  [ -d ~/.pyenv/plugins/pyenv-virtualenv ] && \
    eval "$(pyenv virtualenv-init -)" && \
    Z_VERBOSE_LOG DONE 'initialize pyenv-virtualenv' \
) & ( \
  [ -d ~/.yarn ] && \
    eval "$(export PATH=$HOME/.yarn/bin:$PATH)" && \
    Z_VERBOSE_LOG DONE 'initialize yarn' \
) & ( \
  [ -f $LUNCHY_DIR/lunchy-completion.zsh ] && \
    eval "$($LUNCHY_DIR/lunchy-completion.zsh)" && \
    Z_VERBOSE_LOG DONE 'initialize launchy' \
) & ( \
  [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ] && \
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' && \
    Z_VERBOSE_LOG DONE 'initialize google-cloud-sdk (path)' \
) & ( \
  [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ] && \
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' && \
    Z_VERBOSE_LOG DONE 'initialize google-cloud-sdk (completion)' \
) & ( \
  command -v fasd &> /dev/null && \
  [ "$?" -eq "0" ] && \
    eval "$(fasd --init auto)" &> /dev/null && \
    Z_VERBOSE_LOG DONE 'initialize fasd' \
) & ( \
  command -v thefuck &> /dev/null && \
  [ "$?" -eq "0" ] && \
    eval $(thefuck --alias) && \
    Z_VERBOSE_LOG DONE 'initialize thefuck' \
) & ( \
  #[ -z "$SSH_AUTH_SOCK" ] && \
  #  eval `ssh-agent -s` && \
  #  ssh-add ~/.ssh/* &> /dev/null && \
  #  Z_VERBOSE_LOG DONE 'initialize ssh-agent' \
) & ( \
  #command -v sshconf &> /dev/null && \
  #[ "$?" -eq "0" ] && \
  #  eval "$(sshconf -g)" &> /dev/null && \
  #  Z_VERBOSE_LOG DONE 'generated ~/.ssh/config' \
) &
