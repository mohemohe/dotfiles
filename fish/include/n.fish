export N_PREFIX="$HOME/.local/n"

# https://github.com/mklement0/n-install/issues/21
begin
    if not contains -- "$N_PREFIX/bin" $fish_user_paths
        set -U fish_user_paths "$N_PREFIX/bin" $fish_user_paths
    end
    
end