if command -v direnv >/dev/null
  direnv hook $SHELL | source
  Z_VERBOSE_LOG DONE 'initialize direnv'
end
