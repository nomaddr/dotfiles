# .zshrc - Consolidated and Migrated from .bashrc


# --- ZSH Specific Initialization ---
# This is crucial for Zsh's powerful completion system
autoload -Uz compinit
compinit

autoload -Uz vcs_info
precmd_functions+=(vcs_info)

# --- Zsh Completion Customization ---
# Use LS_COLORS for completion list colors
# This assumes LS_COLORS is already set by eza or dircolors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Customize the display of the completion menu
# Show descriptions below each item (e.g., for options)
zstyle ':completion:*' menu select

# Group completions by type (files, directories, commands, etc.)
zstyle ':completion:*' group-name ''

# Add a header for different groups of completions
zstyle ':completion:*:manuals' tag-order 'manuals'
zstyle ':completion:*:options' tag-order 'options'
zstyle ':completion:*:parts' tag-order 'parts'
zstyle ':completion:*:parameters' tag-order 'parameters'
zstyle ':completion:*:corrections' tag-order 'corrections'
zstyle ':completion:*:approx-patterns' tag-order 'approximate patterns'
zstyle ':completion:*:urls' tag-order 'URLs'
zstyle ':completion:*:default' tag-order 'default'
zstyle ':completion:*:descriptions' format '%B%d%b' # Bold description

# More subtle separators
zstyle ':completion:*:*:*:*:processes' command 'ps -axco pid,command'

# Hide auto-completion menu if only one option (useful if you don't want it to immediately jump)
# setopt noautomenu # You might have this already if you prefer bash-like behavior

# To see a simple list on first tab, then menu on second
setopt auto_menu # Show completion menu on subsequent tab presses
setopt menu_complete # Cycle through completions on tab

# If you want to see the list immediately after first tab
setopt auto_list

# Load Zsh's history configuration
setopt APPEND_HISTORY     # Append history to the history file
setopt HIST_IGNORE_DUPS   # Ignore duplicate commands in history (like Bash's HISTCONTROL=ignoreboth)
setopt HIST_IGNORE_SPACE  # Don't add commands starting with a space to history
setopt EXTENDED_HISTORY   # Store history with timestamps
setopt INC_APPEND_HISTORY # Save history after each command
setopt SHARE_HISTORY      # Share history across all sessions

HISTSIZE=32768
SAVEHIST=${HISTSIZE} # Zsh uses SAVEHIST for file size, not HISTFILESIZE

# --- External Tool Integrations ---

# Mise (rtx) - Multi-language version manager
# This should activate mise for zsh
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# Zoxide - Fast cd command that learns your habits
# This should initialize zoxide for zsh
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# FZF - Fuzzy finder for your shell
# Zsh completion and key-bindings for fzf.
# Note: Paths might vary slightly by distribution. Adjust if needed.
if command -v fzf &>/dev/null; then
  # Usually, fzf provides its own init script for zsh.
  # This often includes both completion and key-bindings.
  if [[ -f /usr/share/fzf/fzf.zsh ]]; then
    source /usr/share/fzf/fzf.zsh
  elif [[ -f /usr/local/opt/fzf/shell/completion.zsh ]]; then # Common for Homebrew on macOS/Linux
    source /usr/local/opt/fzf/shell/completion.zsh
    source /usr/local/opt/fzf/shell/key-bindings.zsh
  # Add other potential paths if the above don't work for your system
  fi
fi

# --- Compression Functions ---
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf"

# --- SD Card ISO Writer Function ---
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
    echo -e "\nAvailable SD cards:"
    lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
  else
    sudo dd bs=4M status=progress oflag=sync if="$1" of="$2"
    sudo eject "$2" # Use quotes for safety, as per good practice
  fi
}

# --- Web App Launcher Functions ---
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

# --- XCompose Refresh Function ---
refresh-xcompose() {
  pkill fcitx5
  setsid fcitx5 &>/dev/null &
}

# --- Prompt Configuration ---
# Zsh has a more powerful prompt system. This recreates your Bash prompt.
# It sets the window title to the current working directory.
# And the prompt itself to [CurrentDir] 
# The unicode character `\uf0a9` (Powerline caret) should work if your font supports it.

# Technicolor dreams (Sets TERM for color, often done by system setup)
# This was 'force_color_prompt=yes' and 'color_prompt=yes' in bash,
# but Zsh handles colors automatically if LS_COLORS/TERM are set.

# Set window title pre-command (runs before each prompt)
precmd() { print -Pn "\e]1;%d\a"; }
# Set prompt string (PS1)
 PS1=$'[%1~]\uf0a9 ' # %1~ is Zsh's equivalent of Bash's \W (truncated current directory)
# PS1=$'%F{cyan}%n%f@%F{green}%m%f:%F{blue}%~%f ${vcs_info_msg_0_}\n[%1~]\uf0a9 '
# --- Environment Variables ---
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# Set complete PATH
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.local/share/omarchy/bin:./bin:$PATH" 
# Disable command hashing (Bash's `set +h` is Zsh's `unsetopt hashall`)
unsetopt hashall

# --- Aliases and Functions ---
# Omarchy Theme Set wrapper
# alias omarchy-theme-set='~/bin/omarchy-theme-set-wrapper' 

# File system
alias cl='clear && fastfetch'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

# cd alias with zoxide integration
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    # Ensure zoxide is correctly initialized for 'z' command to work (handled above)
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}
open() {
  xdg-open "$@" >/dev/null 2>&1
}

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias n='nvim'
alias g='git'
alias d='docker'
alias r='rails'

# Git
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'

# Find packages without leaving the terminal
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# --- Zsh Readline/Completion Settings ---
# These Bash `set` commands are translated to Zsh `setopt` and `zstyle` where applicable.

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Show all completion results at once
setopt AUTO_MENU             # Automatically use the menu completion when the tab key is pressed
setopt AUTO_LIST             # Automatically list choices on an ambiguous completion
setopt NO_ALWAYS_LAST_PROMPT # Don't page completions unless necessary

# Display length for prefix (Zsh handles this somewhat automatically)
zstyle ':completion:*' menu select=long # Shows full items in completion menu, if space

# Show extra file information (similar to Bash's visible-stats)
setopt LIST_TYPES # Show file types in completions (e.g., / for dirs, * for executables)
setopt MARK_DIRS  # Append a slash to directory names in completions

# Do not autocomplete hidden files unless the pattern explicitly begins with a dot
setopt NO_GLOB_DOTS # Don't include filenames beginning with '.' in glob expansion

# --- Zsh Keybindings ---
# These replace your Bash bind commands.

# Arrow keys for history search (similar to Bash's history-search-backward/forward)
bindkey '^[[A' history-search-backward # Up arrow
bindkey '^[[B' history-search-forward  # Down arrow
# Standard cursor movement (usually default, but explicit for clarity)
bindkey '^[[C' forward-char  # Right arrow
bindkey '^[[D' backward-char # Left arrow

# Be more intelligent when autocompleting by also looking at the text after the cursor
setopt AUTO_PARAM_SLASH # If the cursor is after a directory, auto-insert a slash on completion

# Coloring for tab completions. Zsh usually handles this via LS_COLORS if set.
# No direct `setopt LIST_COLORS` as in Bash. `LIST_TYPES` (set above) helps with markers.
# For full coloring, ensure LS_COLORS is set by your system's default environment.
