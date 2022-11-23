export N_PREFIX="$HOME/.n"

if [ -d "$N_PREFIX" ]
  # https://github.com/mklement0/n-install/issues/21
  if not contains -- "$N_PREFIX/bin" $fish_user_paths
    set -U fish_user_paths "$N_PREFIX/bin" $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize n'
end
