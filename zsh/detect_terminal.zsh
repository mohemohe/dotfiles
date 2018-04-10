#!/bin/zsh

__TERMINAL_EMULATOR=
if [[ "${TERM_PROGRAM}" != "" ]]; then {
  # macOS
  __TERMINAL_EMULATOR="${TERM_PROGRAM}"
} else {
  # Linux
  __TERMINAL_EMULATOR=`basename "/"$(ps -f -p $(cat /proc/$(echo $$)/stat | cut -d \  -f 4) 2> /dev/null | tail -1 | sed 's/^.* //')` && Z_VERBOSE_LOG DONE "detect terminal emulator: ${__TERMINAL_EMULATOR=}"
} fi
Z_VERBOSE_LOG DONE "detect terminal ${__TERMINAL_EMULATOR}"
