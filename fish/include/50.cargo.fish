if [ -d "$HOME/.cargo/bin" ]
  if not contains -- "$HOME/.cargo/bin" $fish_user_paths
    set -U fish_user_paths "$HOME/.cargo/bin" $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize cargo'
end