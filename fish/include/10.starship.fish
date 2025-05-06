if not [ command -v starship &> /dev/null ]
  starship init fish | source
  starship preset tokyo-night -o ~/.config/starship.toml
  Z_VERBOSE_LOG DONE 'initialize starship'
end
