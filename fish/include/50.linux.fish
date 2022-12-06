#!/bin/fish

if [ "(uname -s)" = "Linux" ] && command -v xclip &> /dev/null
  alias pbcopy='xclip -selection c'
  alias pbpaste='xclip -selection c -o'
  Z_VERBOSE_LOG DONE 'initialize linux'
end