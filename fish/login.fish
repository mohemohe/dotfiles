function Z_VERBOSE_LOG
  echo "[$argv[1]] $argv[2..-1]"
end

Z_VERBOSE_LOG START early hooks

for i in ( find "$HOME/.fish/early_hooks" -type f )
  source "$i"
end

if command -v neofetch >/dev/null
  neofetch > /tmp/info-$fish_pid &
  set info_pid $last_pid
else if command -v archey >/dev/null
  archey > /tmp/info-$fish_pid &
  set info_pid $last_pid
end

Z_VERBOSE_LOG START initialize

set fish_color_command green
set fish_color_quote yellow
set fish_color_param white

for i in ( find "$HOME/.fish/include" -type f )
  source "$i"
end

source "$HOME/.fish/user.fish"

if [ "$info_pid" != "" ]
  wait $info_pid
  echo ''
  cat /tmp/info-$fish_pid
  rm -f /tmp/info-$fish_pid
  set -e info_pid
end

# if [ "$info_pid" != "" ]
#   tail -f /tmp/info-$fish_pid &
#   set tail_pid $last_pid
#   wait $info_pid
#   kill $tail_pid
#   rm -f /tmp/info-$fish_pid
#   set -e info_pid
#   set -e tail_pid
# end
