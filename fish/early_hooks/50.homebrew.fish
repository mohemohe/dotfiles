if not [ command -v brew &> /dev/null ] && [ -d "/opt/homebrew" ] && not contains -- "/opt/homebrew/bin" $fish_user_paths
  set -U fish_user_paths "/opt/homebrew/bin" $fish_user_paths
else if not [ command -v brew &> /dev/null ] && [ -d "/usr/local/homebrew" ] && not contains -- "/usr/local/homebrew/bin" $fish_user_paths
  set -U fish_user_paths "/usr/local/homebrew/bin" $fish_user_paths
end

if [ command -v brew &> /dev/null ]
  export HOMEBREW_VERBOSE=1
  export HOMEBREW_GITHUB_API_TOKEN=(cat $HOME/.github_token 2> /dev/null)
  export HOMEBREW_NO_AUTO_UPDATE=1
  Z_VERBOSE_LOG DONE 'initialize homebrew'
end
