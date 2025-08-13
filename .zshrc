# .zshrc - Consolidated and Migrated from .bashrc

# --- ZSH Specific Initialization ---
# Auto-load Zsh's completion and version control information
autoload -Uz compinit
compinit
autoload -Uz vcs_info
precmd_functions+=(vcs_info)

# --- History Configuration ---
setopt APPEND_HISTORY     # Append history to the history file
setopt HIST_IGNORE_DUPS   # Ignore duplicate commands
setopt HIST_IGNORE_SPACE  # Don't add commands starting with a space
setopt EXTENDED_HISTORY   # Store history with timestamps
setopt INC_APPEND_HISTORY # Save history after each command
setopt SHARE_HISTORY      # Share history across all sessions

HISTSIZE=32768
SAVEHIST=${HISTSIZE}

# --- External Tool Integrations ---
# Mise (rtx)
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# Zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# FZF
if command -v fzf &>/dev/null; then
  # This is a more robust way to source fzf's scripts
  source <(fzf --zsh)
fi

# --- Environment Variables ---
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.local/share/omarchy/bin:./bin:$PATH"
unsetopt hashall

# --- Aliases and Functions ---
# Aliases
alias cl='clear && fastfetch'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias n='nvim'
alias g='git'
alias d='docker'
alias r='rails'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
alias decompress="tar -xzf"
# Simplified cd alias using zoxide's built-in functionality
alias cd="z"
# Function for opening files (more portable)
open() {
  xdg-open "$@" >/dev/null 2>&1
}

# Functions for web apps (unmodified, they are good)
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }

web2app() {
  if [ "$#" -ne 3 ]; then
    echo "Usage: web2app <AppName> <AppURL> <IconURL> (IconURL must be in PNG -- use https://dashboardicons.com)"
    return 1
  fi
  local APP_NAME="$1"
  local APP_URL="$2"
  local ICON_URL="$3"
  local ICON_DIR="$HOME/.local/share/applications/icons"
  local DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"
  local ICON_PATH="${ICON_DIR}/${APP_NAME}.png"
  mkdir -p "$ICON_DIR"
  if ! curl -sL -o "$ICON_PATH" "$ICON_URL"; then
    echo "Error: Failed to download icon."
    return 1
  fi
  cat >"$DESKTOP_FILE" <<EOF
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Comment=$APP_NAME
Exec=chromium --new-window --ozone-platform=wayland --app="$APP_URL" --name="$APP_NAME" --class="$APP_NAME"
Terminal=false
Type=Application
Icon=$ICON_PATH
StartupNotify=true
EOF
  chmod +x "$DESKTOP_FILE"
}

web2app-remove() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: web2app-remove <AppName>"
    return 1
  fi
  local APP_NAME="$1"
  local ICON_DIR="$HOME/.local/share/applications/icons"
  local DESKTOP_FILE="$HOME/.local/share/applications/${APP_NAME}.desktop"
  local ICON_PATH="${ICON_DIR}/${APP_NAME}.png"
  rm "$DESKTOP_FILE"
  rm "$ICON_PATH"
}

refresh-xcompose() {
  pkill fcitx5
  setsid fcitx5 &>/dev/null &
}

# --- Prompt Configuration (using a modern theme) ---
# Recommended: Install a prompt theme like Powerlevel10k or Starship.
# For example, to use Starship, simply add this line:
# eval "$(starship init zsh)"
#
# If you prefer a manual prompt, here's a simpler version:
precmd() { print -Pn "\e]1;%d\a"; } # Sets window title
PS1=$'%B%F{blue}[%1~]%f%b \uf0a9 '  # Simple, clean prompt with color

# --- Zsh Completion and Keybindings ---
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt AUTO_MENU AUTO_LIST MENU_COMPLETE LIST_TYPES MARK_DIRS NO_GLOB_DOTS
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey -v
