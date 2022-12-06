export GOENV_DIR="$HOME/.goenv"
export GOPATH="$HOME/develop"
export GO111MODULES=on
export GOENV_DISABLE_GOPATH=1

if [ -d "$GOENV_DIR" ]
  if not contains -- "$GOENV_DIR/bin" $fish_user_paths
    set -U fish_user_paths "$GOENV_DIR/bin" $fish_user_paths
    set -U fish_user_paths "$GOPATH/bin" $fish_user_paths
    goenv init - | source
    git config --global ghq.root "$GOPATH/src"
  end
  Z_VERBOSE_LOG DONE 'initialize goenv'
end

