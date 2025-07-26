# Dotfiles

Personal configuration files managed with GNU Stow.

## Usage

```bash
# Install all configs
stow .

# Install specific config
stow .config

# Remove configs
stow -D .

# Restow (useful after changes)
stow -R .
```

## Structure

- `.bash_profile`, `.bashrc` - Shell configuration
- `.config/btop/` - System monitor
- `.config/fastfetch/` - System info
- `.config/hypr/` - Hyprland window manager
- `.config/kitty/` - Terminal emulator
- `.config/nvim/` - Neovim editor
- `.config/tmux/` - Terminal multiplexer
- `.config/waybar/` - Status bar