#!/bin/sh

pacapt="$HOME/.local/bin/pacapt"
if [ -e "$pacapt" ]; then
    rm -f "$pacapt"
fi
fetch 'https://raw.githubusercontent.com/icy/pacapt/ng/pacapt' > "$pacapt"
chmod +x "$pacapt"