if [[ $- == *i* ]]; then          # Check if the shell is interactive
  if [ -f "$HOME/.bashrc" ]; then # Check if ~/.bashrc exists
    . "$HOME/.bashrc"             # Source ~/.bashrc
  fi
fi

[[ -z $DISPLAY && $(tty) == /dev/tty1 ]] && exec Hyprland
