if [ -d "/opt/bin" ]
  if not contains -- "." $fish_user_paths
    set -U fish_user_paths "." $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize PWD'
end
