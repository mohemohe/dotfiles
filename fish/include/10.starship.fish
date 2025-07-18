if not [ command -v starship &>/dev/null ]
    starship init fish | source
    Z_VERBOSE_LOG DONE 'initialize starship'
end
