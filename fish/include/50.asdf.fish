if command -v asdf >/dev/null
  set -U fish_user_paths "$HOME/.asdf/shims" $fish_user_paths
  Z_VERBOSE_LOG DONE 'initialize asdf'
end
