#!/bin/zsh

[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ] && \
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" && \
  Z_VERBOSE_LOG DONE 'initialize prezto' && \
  autoload -Uz promptinit && \
  promptinit && \
  prompt paradox && \
  Z_VERBOSE_LOG DONE 'initialize prompt'
