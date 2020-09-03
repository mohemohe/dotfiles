set fish_color_command green
set fish_color_quote yellow
set fish_color_param white

find "$HOME/.fish/include" -print0 | xargs -0 -I_ source '_'

source "$HOME/.fish/user.fish"

if [ "$DOTFILES_INSTALL" != 1 ]
    neofetch
end