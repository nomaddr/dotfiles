#!/bin/bash
# Base16 Black Metal (Gorgoroth) - Background Setter
# Scheme by metalelf0 (https://github.com/metalelf0)

# Define the directory where wallpapers for this theme will be stored
BACKGROUNDS_DIR="$HOME/.config/omarchy/themes/black-metal/backgrounds"

# Create the directory if it doesn't exist
mkdir -p "$BACKGROUNDS_DIR"

# Define the path to the specific wallpaper for this theme
# IMPORTANT: You need to place your desired wallpaper image here!
# Example: cp /path/to/your/black-metal-wallpaper.jpg "$BACKGROUNDS_DIR/wallpaper.jpg"
WALLPAPER_PATH="$BACKGROUNDS_DIR/1-black-metal.jpg"

# Check if the wallpaper file exists before trying to set it
if [ ! -f "$WALLPAPER_PATH" ]; then
  echo "Error: Wallpaper file not found at $WALLPAPER_PATH"
  echo "Please place your desired wallpaper image (e.g., wallpaper.jpg) in that directory."
  # Optionally, you could set a fallback solid color background here
  # hyprctl hyprpaper wallpaper "DP-1,solid_rgb(000000)"
  exit 1
fi

# Use swww for Wayland (common in Hyprland)
# Adjust --transition-type, --transition-step, --transition-fps as desired
swww img "$WALLPAPER_PATH" --transition-type outer --transition-step 90 --transition-fps 60

# If you use Hyprland's built-in hyprpaper (ensure hyprpaper is running and configured)
# hyprctl hyprpaper wallpaper "DP-1,$WALLPAPER_PATH" # Adjust DP-1 to your monitor name

# If you use feh (common for Xorg, uncomment if applicable)
# feh --bg-fill "$WALLPAPER_PATH"
