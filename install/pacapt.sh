#!/bin/sh

pacapt="$HOME/.local/bin/pacapt"
if [ -e "$pacapt" ]; then
    rm -f "$pacapt"
fi
fetch https://github.com/icy/pacapt/raw/ng/pacapt > "$pacapt"
chmod +x "$pacapt"