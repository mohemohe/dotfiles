export GOENV_DIR="$HOME/.goenv"

begin
    if not contains -- "$GOENV_DIR/bin" $fish_user_paths
        set -U fish_user_paths "$GOENV_DIR/bin" $fish_user_paths
    end
end