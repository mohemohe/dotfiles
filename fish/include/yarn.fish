if [ -d "$HOME/.yarn/bin" ]
  if not contains -- "$HOME/.yarn/bin" $fish_user_paths
    set -U fish_user_paths "$HOME/.yarn/bin" $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize yarn'
end