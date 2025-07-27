# This is your main Zsh configuration file, consolidated for minimal files.
# It integrates Oh My Zsh and all your migrated Bash settings.

# --- IMPORTANT: Manual Plugin Installation ---
# The following plugins are not bundled with Oh My Zsh and need to be cloned manually.
# Run these commands in your terminal BEFORE restarting Zsh with this config:

# For 'zsh-autosuggestions':
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# For 'zsh-syntax-highlighting':
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# --- End Manual Plugin Installation ---

# --- Oh My Zsh Setup ---
# This section initializes Oh My Zsh. DO NOT MODIFY these lines.
# The ZSH variable points to your Oh My Zsh installation directory.
export ZSH="$HOME/.oh-my-zsh"

# Set your Oh My Zsh theme.
# 'robbyrussell' is the default. You can change this later.
# For a more advanced and customizable prompt, consider installing powerlevel10k.
ZSH_THEME="robbyrussell"

# List of Oh My Zsh plugins to load.
# These plugins provide Zsh-specific enhancements and replace many manual configurations.
# - git: Provides many useful Git aliases and functions.
# - zsh-autosuggestions: Suggests commands as you type based on your history.
# - zsh-syntax-highlighting: Highlights commands as you type for better readability.
# - fzf: Integrates fzf with Zsh, providing key-bindings and completions.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
)

# Source Oh My Zsh. This line must be present and near the beginning.
source $ZSH/oh-my-zsh.sh
# --- End Oh My Zsh Setup ---

# --- Zsh Line Editor (ZLE) and Completion Settings ---
# These settings are Zsh's way of handling inputrc configurations and Bash's shopt commands.
# Moved here to ensure they are set AFTER Oh My Zsh's core initialization.

# History control (equivalent to Bash's shopt -s histappend and HISTCONTROL)
setopt append_history      # Append to history file, don't overwrite
setopt hist_ignore_dups    # Don't record duplicate commands in history
setopt hist_ignore_space   # Don't record lines starting with a space
setopt share_history       # Share history across all Zsh sessions
HISTSIZE=32768             # Number of lines or commands to store in history
HISTFILESIZE="${HISTSIZE}" # Maximum number of lines contained in the history file

# Completion settings (Zsh's way of handling inputrc 'set' options)
setopt auto_cd               # If a command is a directory, cd to it
setopt auto_list             # Automatically list choices on ambiguous completion
setopt auto_menu             # Automatically use menu completion
setopt complete_in_word      # Complete from cursor position
setopt no_case_glob          # Case-insensitive globbing (like 'set completion-ignore-case on')
setopt mark_symlinked_dirs   # Append / to symlinked directories (like 'set mark-symlinked-directories on')
setopt no_dot_glob           # Don't autocomplete hidden files unless pattern starts with dot (like 'set match-hidden-files off')
setopt always_to_end_of_line # Move cursor to end of line on completion (similar to 'set skip-completed-text on' in Bash Readline)

# Key bindings (equivalent to inputrc arrow key bindings)
# These are often handled by OMZ plugins like zsh-autosuggestions or history-substring-search.
# If you want to ensure them, you can add them:
bindkey '^[[A' history-search-backward # Up arrow
bindkey '^[[B' history-search-forward  # Down arrow
bindkey '^[[C' forward-char            # Right arrow
bindkey '^[[D' backward-char           # Left arrow

# Note: Bash-specific inputrc options like `set skip-completed-text on` and
# `set colored-stats on` are handled by Zsh's `setopt` equivalents and OMZ plugins.
# The `set +h` from your original 'shell' file is a Bash-ism and is not needed in Zsh.

# --- Custom Environment Variables ---
# These are environment variables copied directly from your Bash setup.
export CHROME_OZONE_PLATFORM_HINT="auto"
export EDITOR="nvim"
export SUDO_EDITOR="$EDITOR"

# --- Path Configuration ---
# This combines path modifications from your original Bash 'shell' and other files.
export PATH="./bin:$HOME/.local/bin:$HOME/.local/share/omarchy/bin:$PATH"

# --- Mise (rtx) Integration ---
# Mise automatically detects Zsh and provides the correct activation script.
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# --- Zoxide Integration ---
# Zoxide also automatically detects Zsh and provides the correct initialization script.
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Ensure prompt is displayed correctly after zoxide cd.
# This is a common pattern for zoxide in Zsh to re-evaluate the prompt
# after a successful jump.
function zd_post_hook() {
  if type -w chpwd_functions >/dev/null; then
    chpwd_functions=("$chpwd_functions[@]" "_zd_chpwd_hook")
  fi
}
zd_post_hook

# --- Aliases ---
# These aliases are copied directly from your Bash 'aliases' file.
# File system
alias cl='clear'
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"
alias cd="zd" # This alias calls the zd function defined below

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

# --- Functions ---
# These functions are copied directly from your Bash 'functions' file.

# Compression
compress() { tar -czf "${1%/}.tar.gz" "${1%/}"; }
alias decompress="tar -xzf" # Note: This is an alias, but placed here for related utility

# Write iso file to sd card
iso2sd() {
  if [ $# -ne 2 ]; then
    echo "Usage: iso2sd <input_file> <output_device>"
    echo "Example: iso2sd ~/Downloads/ubuntu-25.04-desktop-amd64.iso /dev/sda"
    echo -e "\nAvailable SD cards:"
    lsblk -d -o NAME | grep -E '^sd[a-z]' | awk '{print "/dev/"$1}'
  else
    sudo dd bs=4M status=progress oflag=sync if="$1" of="$2"
    sudo eject "$2" # Ensure output device is quoted
  fi
}

# Create a desktop launcher for a web app
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

# Ensure changes to ~/.XCompose are immediately available
refresh-xcompose() {
  pkill fcitx5
  setsid fcitx5 &>/dev/null &
}

# Custom zd function (from your original aliases file)
# This function relies on zoxide, which is initialized above.
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    # The printf \U000F17A9 might be specific to your terminal/font setup.
    # If it causes issues, remove it.
    z "$@" && printf " \U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

# --- Prompt Configuration ---
# This section defines your Zsh prompt, migrated from your Bash 'prompt' file.
# Zsh's prompt system is different from Bash's.
# Bash-specific variables like force_color_prompt and color_prompt are removed.

# Basic Zsh prompt:
# %~: current working directory (tildified)
# \uf0a9: A Nerd Font glyph (check if your terminal font supports it)
PROMPT='[%~]\uf0a9 '

# Function to set the terminal window/pane title (similar to your Bash PS1 setup)
# This uses Zsh's precmd function, which runs before each prompt.
precmd() {
  # Set the terminal title to the current working directory
  print -P "\e]0;%~\a"
}
