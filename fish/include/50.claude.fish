if [ -d "$HOME/.claude/local" ]
  if not contains -- "$HOME/.claude/local" $fish_user_paths
    set -U fish_user_paths "$HOME/.claude/local" $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize claude'
end