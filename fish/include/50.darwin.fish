#!/bin/fish

if [ "(uname -s)" = "Darwin" ]
  alias ls='ls -G'
  Z_VERBOSE_LOG DONE 'initialize darwin'
end