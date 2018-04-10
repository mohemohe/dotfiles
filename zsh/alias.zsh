#!/bin/zsh

unalias rsync
unalias sl
unalias bower
unalias ls

alias -g C='| cat'
alias -g G='| grep'
alias -g I='| iconv -f utf-8-mac -t utf-8'
alias -g L='| less'
alias -g P='proxychains4'
alias -g V='vim -Ro'
alias cls='clear'
alias csharpinit='yo csharp-cli-app'
alias curl='curl --ipv4 -L'
alias explorer='ranger'
alias ex='explorer'
alias helpMac='sudo bash -c "pkill -HUP powerd; pkill -HUP blued; pkill -HUP quicklookd"'
alias preztoconfig='vim ~/.zpreztorc'
alias restartkde='killall plasmashell &> /dev/null; kstart plasmashell &> /dev/null'
alias -g sl='sl; ls'
alias serve-http='python2 -m SimpleHTTPServer'
alias ssh="env TERM=xterm-256color ssh"
alias sync='sync;sync;sync'
alias tmuxpowerlineconf='vim ~/.tmux/tmux-powerline/themes/default.sh'
alias view='vim -Ro'
alias vim='vim'
alias zshconfig='vim ~/.zshrc'
alias zshreload='exec zsh'
[ ! command -v pacman ] && alias pacman='pacapt'
alias -s py='python'
alias -s exe='mono'
