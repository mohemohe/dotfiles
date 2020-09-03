#!/bin/zsh

__TERMINAL_EMULATOR=
if [[ "${TERM_PROGRAM}" != "" ]]; then {
  # macOS
  __TERMINAL_EMULATOR="${TERM_PROGRAM}"
} else {
  # Linux
  __TERMINAL_EMULATOR=$(ps -o comm= -p "$(($(ps -o ppid= -p "$(($(ps -o sid= -p "$$")))")))")
} fi
Z_VERBOSE_LOG DONE "detect terminal emulator: ${__TERMINAL_EMULATOR}"
