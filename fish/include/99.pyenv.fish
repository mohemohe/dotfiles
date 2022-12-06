export PYENV_ROOT="$HOME/.pyenv"

if [ -d "$PYENV_ROOT" ]
  if not contains -- "$PYENV_ROOT/bin" $fish_user_paths
    set -U fish_user_paths "$PYENV_ROOT/bin" $fish_user_paths
  end
  pyenv init - | source
  if [ "$ENABLE_PYENV_VIRTUALENV" = "1" ] && [ -d "$PYENV_ROOT/plugins/pyenv-virtualenv" ]
    pyenv virtualenv-init - | source
  end
  Z_VERBOSE_LOG DONE 'initialize pyenv'
end
