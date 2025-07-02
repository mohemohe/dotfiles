#!/bin/sh

# Backup current Neovim files if they exist
if [ -d "${HOME}/.config/nvim" ] && [ ! -L "${HOME}/.config/nvim" ]; then
    echo "Backing up current Neovim configuration..."
    mv "${HOME}/.config/nvim" "${HOME}/.config/nvim.bak.$(date +%Y%m%d_%H%M%S)"
fi

if [ -d "${HOME}/.local/share/nvim" ]; then
    echo "Backing up Neovim data..."
    mv "${HOME}/.local/share/nvim" "${HOME}/.local/share/nvim.bak.$(date +%Y%m%d_%H%M%S)"
fi

if [ -d "${HOME}/.local/state/nvim" ]; then
    echo "Backing up Neovim state..."
    mv "${HOME}/.local/state/nvim" "${HOME}/.local/state/nvim.bak.$(date +%Y%m%d_%H%M%S)"
fi

if [ -d "${HOME}/.cache/nvim" ]; then
    echo "Backing up Neovim cache..."
    mv "${HOME}/.cache/nvim" "${HOME}/.cache/nvim.bak.$(date +%Y%m%d_%H%M%S)"
fi

# Remove existing symlink if it exists
if [ -L "${HOME}/.config/nvim" ]; then
    rm -f "${HOME}/.config/nvim"
fi

# Clone LazyVim starter
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter "${HOME}/.config/nvim"

# Remove .git folder
rm -rf "${HOME}/.config/nvim/.git"

echo "LazyVim installation complete!"
