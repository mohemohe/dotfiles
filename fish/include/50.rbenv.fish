export RBENV_ROOT="$HOME/.rbenv"

if [ -d "$RBENV_ROOT" ]
  if not contains -- "$RBENV_ROOT/bin" $fish_user_paths
    set -U fish_user_paths "$RBENV_ROOT/bin" $fish_user_paths
  end
  rbenv init - | source
  Z_VERBOSE_LOG DONE 'initialize rbenv'
end
