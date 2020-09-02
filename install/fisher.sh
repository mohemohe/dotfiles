#!/usr/bin/env fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

/usr/bin/env fish -c fisher add mohemohe/theme-paradox
/usr/bin/env fisher add edc/bass
/usr/bin/env fisher add oh-my-fish/plugin-expand
/usr/bin/env fisher add decors/fish-ghq