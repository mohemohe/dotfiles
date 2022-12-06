if [ -d "/opt/bin" ]
  if not contains -- "/opt/bin" $fish_user_paths
    set -U fish_user_paths "/opt/bin" $fish_user_paths
  end
  Z_VERBOSE_LOG DONE 'initialize /opt'
end
