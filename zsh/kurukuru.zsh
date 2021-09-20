#!/bin/zsh

INDICATOR_MESSAGE=
INDICATOR_PID=
function indicator() {
  trap "echo -en '\e[1A'; for ((i=0; i<`tput cols`; i++)); do { printf ' ' } done; kill $INDICATOR_PID &> /dev/null; exit 0" INT
  while :
  do {
    eval 'echo -e "  ⠋ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⠙ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⠸ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⢰ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⣠ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⣄ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⡆ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
    eval 'echo -e "  ⠇ $INDICATOR_MESSAGE\e[1A"'; sleep 0.05;
  } done
}

function startIndicator() {
  if [[ "$1" != "" ]]; then {
    INDICATOR_MESSAGE=$1
  } fi
  set +m
  indicator &
  INDICATOR_PID=$!
}

function stopIndicator() {
  kill $INDICATOR_PID &> /dev/null
  wait
  CLEAR_MESSAGE="$(echo "$INDICATOR_MESSAGE" | sed 's|.| |g' )"
  echo -e "    $CLEAR_MESSAGE\e[1A"
  set -m
}
