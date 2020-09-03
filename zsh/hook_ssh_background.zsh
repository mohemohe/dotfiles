#!/bin/zsh

KONSOLE_PROFILE=
function precmd_preexec_ssh-iikanji() {
  local CMD=${1}
  local NEXT_PROFILE=

  case "$CMD" in
    *ssh*prd* | *ssh*mobilus-misc-step* ) {
      NEXT_PROFILE=ArgonautRed
    } ;;

    *ssh*stg* ) {
      NEXT_PROFILE=ArgonautPurple
    } ;;

    *ssh*dev* ) {
      NEXT_PROFILE=ArgonautGreen
    } ;;

    *ssh*home* ) {
      NEXT_PROFILE=ArgonautBlue
    } ;;
  esac

  if [[ "$NEXT_PROFILE" == "" ]]; then {
    NEXT_PROFILE=Argonaut
  } fi

  if [[ ! "$KONSOLE_PROFILE" == "$NEXT_PROFILE" ]]; then {
    KONSOLE_PROFILE=$NEXT_PROFILE
    if [[ "${__TERMINAL_EMULATOR}" == "konsole" ]]; then {
      konsoleprofile colors=$NEXT_PROFILE
    } fi
    if [[ "${__TERMINAL_EMULATOR}" == "yakuake" ]]; then {
       konsoleprofile colors=$NEXT_PROFILE
     } fi
    if [[ "${__TERMINAL_EMULATOR}" == "iTerm.app" ]]; then {
      echo -e "\033]50;SetProfile=${NEXT_PROFILE}\a"
    } fi
  } fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_preexec_ssh-iikanji
add-zsh-hook preexec precmd_preexec_ssh-iikanji
