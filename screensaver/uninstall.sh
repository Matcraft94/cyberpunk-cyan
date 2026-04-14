#!/bin/bash
set -e

OMARCHY_CMD="$HOME/.local/share/omarchy/bin/omarchy-cmd-screensaver"
OMARCHY_CMD_BAK="$OMARCHY_CMD.bak"
OMARCHY_LAUNCH="$HOME/.local/share/omarchy/bin/omarchy-launch-screensaver"
OMARCHY_LAUNCH_BAK="$OMARCHY_LAUNCH.bak"

if [[ -f "$OMARCHY_CMD_BAK" ]]; then
  cp "$OMARCHY_CMD_BAK" "$OMARCHY_CMD"
  echo "Restored omarchy-cmd-screensaver"
else
  echo "Warning: backup for omarchy-cmd-screensaver not found"
fi

if [[ -f "$OMARCHY_LAUNCH_BAK" ]]; then
  cp "$OMARCHY_LAUNCH_BAK" "$OMARCHY_LAUNCH"
  echo "Restored omarchy-launch-screensaver"
else
  echo "Warning: backup for omarchy-launch-screensaver not found"
fi

if [[ -d "$HOME/.config/omarchy/screensaver" ]]; then
  rm -rf "$HOME/.config/omarchy/screensaver"
  echo "Removed screensaver files"
fi

echo "Cyberpunk glitch screensaver uninstalled successfully!"
