set fish_color_command green
set fish_color_quote yellow
set fish_color_param white

source "$HOME/.fish/user.fish"

if [ "$DOTFILES_INSTALL" != 1 ]
    neofetch
end