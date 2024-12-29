export GOENV_ROOT="$HOME/.goenv"

if [ -d "$GOENV_ROOT" ]
  if not contains -- "$GOENV_ROOT/bin" $fish_user_paths
    set -U fish_user_paths "$GOENV_ROOT/bin" $fish_user_paths
  end
    if not contains -- "$GOENV_ROOT/shims" $fish_user_paths
    set -U fish_user_paths "$GOENV_ROOT/shims" $fish_user_paths
  end
  goenv init - | source
  Z_VERBOSE_LOG DONE 'initialize goenv'
end
