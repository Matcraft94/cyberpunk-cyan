#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMARCHY_CMD="$HOME/.local/share/omarchy/bin/omarchy-cmd-screensaver"
OMARCHY_CMD_BAK="$OMARCHY_CMD.bak"
OMARCHY_LAUNCH="$HOME/.local/share/omarchy/bin/omarchy-launch-screensaver"
OMARCHY_LAUNCH_BAK="$OMARCHY_LAUNCH.bak"

if [[ ! -f "$OMARCHY_CMD" ]]; then
  echo "Error: Omarchy scripts not found. Is this an Omarchy system?"
  exit 1
fi

# Backup original Omarchy scripts (only once)
if [[ ! -f "$OMARCHY_CMD_BAK" ]]; then
  cp "$OMARCHY_CMD" "$OMARCHY_CMD_BAK"
  echo "Backed up omarchy-cmd-screensaver"
fi
if [[ ! -f "$OMARCHY_LAUNCH_BAK" ]]; then
  cp "$OMARCHY_LAUNCH" "$OMARCHY_LAUNCH_BAK"
  echo "Backed up omarchy-launch-screensaver"
fi

# Install screensaver files
mkdir -p "$HOME/.config/omarchy/screensaver/glitch"
cp "$SCRIPT_DIR/glitch-screensaver.py" "$HOME/.config/omarchy/screensaver/"
cp "$SCRIPT_DIR/glitch/index.html" "$HOME/.config/omarchy/screensaver/glitch/"
cp "$SCRIPT_DIR/glitch/style.css" "$HOME/.config/omarchy/screensaver/glitch/"
ln -sf "$HOME/.config/omarchy/screensaver/glitch-screensaver.py" "$HOME/.config/omarchy/screensaver/org.omarchy.screensaver"

# Write omarchy-cmd-screensaver
cat > "$OMARCHY_CMD" << 'EOF'
#!/bin/bash

# Run the Omarchy cyberpunk glitch screensaver.

/usr/bin/python3 ~/.config/omarchy/screensaver/org.omarchy.screensaver &
pid=$!

exit_screensaver() {
  kill $pid 2>/dev/null
  exit 0
}

trap exit_screensaver SIGINT SIGTERM SIGHUP SIGQUIT

wait $pid 2>/dev/null
exit 0
EOF
chmod +x "$OMARCHY_CMD"

# Patch omarchy-launch-screensaver
cp "$OMARCHY_LAUNCH_BAK" "$OMARCHY_LAUNCH"

python3 - "$OMARCHY_LAUNCH" << 'PYEOF'
import sys
path = sys.argv[1]
with open(path, "r") as f:
    content = f.read()

if "glitch-screensaver.py" in content:
    sys.exit(0)

old_pgrep = """# Exit early if screensave is already running
pgrep -f org.omarchy.screensaver && exit 0"""

new_pgrep = """# Exit early if screensaver is already running
if [[ -f ~/.config/omarchy/screensaver/glitch-screensaver.py ]]; then
  pgrep -f "/usr/bin/python3 /home/lucy/.config/omarchy/screensaver/org.omarchy.screensaver" >/dev/null 2>&1 && exit 0
else
  pgrep -f org.omarchy.screensaver >/dev/null 2>&1 && exit 0
fi"""

if old_pgrep in content:
    content = content.replace(old_pgrep, new_pgrep)

old_walker = """# Silently quit Walker on overlay
walker -q"""

new_walker = """# If using the webkit-based glitch screensaver, launch directly without terminal
if [[ -f ~/.config/omarchy/screensaver/glitch-screensaver.py ]]; then
  for m in $(hyprctl monitors -j | jq -r '.[] | .name'); do
    hyprctl dispatch focusmonitor $m
    hyprctl dispatch exec -- /home/lucy/.local/share/omarchy/bin/omarchy-cmd-screensaver
  done
  exit 0
fi

# Silently quit Walker on overlay
walker -q"""

if old_walker in content:
    content = content.replace(old_walker, new_walker)

with open(path, "w") as f:
    f.write(content)
PYEOF

chmod +x "$OMARCHY_LAUNCH"

echo "Cyberpunk glitch screensaver installed successfully!"
echo "Run 'omarchy-launch-screensaver force' to test it."
