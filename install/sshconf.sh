#!/bin/sh

sshconf="$HOME/.local/bin/sshconf"
if [ -e "$sshconf" ]; then
    rm -f "$sshconf"
fi
fetch https://raw.githubusercontent.com/mohemohe/sshconf/master/sshconf > "$sshconf"
chmod +x "$sshconf"