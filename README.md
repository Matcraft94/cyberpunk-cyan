# Cyberpunk Cyan Theme for Omarchy

A cyberpunk-inspired dark theme with vibrant cyan neon accents for [Omarchy Linux](https://omarchy.org).

![Preview](preview.png)

## Colors

| Color | Hex | Usage |
|-------|-----|-------|
| **Background** | `#0a0a0f` | Main background |
| **Foreground** | `#e0f7ff` | Primary text |
| **Accent (Cyan)** | `#00FFFF` | Borders, highlights, active elements |
| **Cyan Dim** | `#00CCCC` | Secondary accents |
| **Pink** | `#ff2a6d` | Errors, urgent notifications |
| **Green** | `#39ff14` | Success, low urgency |
| **Purple** | `#ff00ff` | Special highlights |
| **Yellow** | `#ffd700` | Warnings, attention |

## Installation

```bash
# Clone the repository
git clone https://github.com/matcraft94/cyberpunk-cyan.git

# Copy to Omarchy themes directory
cp -r cyberpunk-cyan ~/.config/omarchy/themes/

# Apply the theme
omarchy-theme-set cyberpunk-cyan
```

## Recommended Ghostty Settings

For the best cyberpunk experience, add to your `~/.config/ghostty/config`:

```conf
# Font
font-family = "JetBrainsMono Nerd Font"
font-style = Regular
font-size = 9

# Window
window-theme = ghostty
window-padding-x = 14
window-padding-y = 14

# Cursor
cursor-style = "block"
cursor-style-blink = false

# Transparency effect (blur provided by Hyprland compositor)
background-opacity = 0.85

# Performance fix for Hyprland
async-backend = epoll

# Slowdown mouse scrolling
mouse-scroll-multiplier = 0.95
```

**Customization:**
- Opacity: `0.80-0.90` (lower = more transparent)
- Font size: `8-11` (depending on screen size)
- Padding: `10-16` (window spacing)

## Features

- **Transparency & blur effects** - Recommended Ghostty opacity: 0.85 for cyberpunk glass effect
- **Glassmorphism effects** in Walker app launcher with cyan glow
- **Neon glow** on Waybar elements
- **3-level urgency notifications** in Mako (green/cyan/pink)
- **Terminal themes** for Alacritty, Kitty, and Ghostty
- **Obsidian theme** included for note-taking
- **10 cyberpunk wallpapers** in various resolutions (1080p to 5K)
- **Hyprlock** screen lock theme
- **SwayOSD** on-screen display styling

## Wallpapers

The theme includes 10 carefully selected cyberpunk-themed wallpapers:

**Default:** `1369816.png` - Cyberpunk street scene (4K)

| Wallpaper | Resolution | Description |
|-----------|------------|-------------|
| `matrix-digital-rain` | 6500x3520 | Digital rain effect with cyan tones |
| `cyberpunk-2077-5th` | 3840x2160 | Cyberpunk 2077 5th wallpaper |
| `cyberpunk-v-gameplay` | 3840x2160 | Cyberpunk 2077 gameplay scene |
| `hatsune-miku` | 3840x2160 | Hatsune Miku in cyberpunk style |
| `hatsune-miku-radiant` | 5120x3066 | Hatsune Miku radiant 5K version |
| `1369816.png` ⭐ | 4K | **Default** - Cyberpunk street scene |
| `149972.jpg` | HD | Cyberpunk landscape |
| `426401.jpg` | 1080p | Minimal cyberpunk design |
| `693509.png` | 2560x1572 | Neon-lit city street |
| `821174.jpg` | 1920x1080 | Abstract cyberpunk artwork |

**Note:** Wallpapers are a compilation found from free sources online.

## File Structure

```
cyberpunk-cyan/
├── backgrounds/          # 11 wallpapers
├── colors.toml          # Base color palette
├── waybar.css           # Waybar color variables
├── btop.theme           # System monitor theme
├── neovim.lua           # Neovim color configuration
├── vscode.json          # VS Code color customizations
├── icons.theme          # Icon theme reference
├── mako.ini             # Notification daemon theme
├── walker.css           # App launcher styling
├── hyprlock.conf        # Screen lock colors
├── hyprland.conf        # Window manager borders
├── alacritty.toml       # Alacritty terminal colors
├── kitty.conf           # Kitty terminal colors
├── ghostty.conf         # Ghostty terminal colors
├── swayosd.css          # OSD styling
├── obsidian.css         # Obsidian app theme
├── chromium.theme       # Chromium browser theme
├── keyboard.rgb         # Keyboard RGB colors
├── hyprland-preview-share-picker.css  # Screen share picker
└── preview.png          # Theme preview screenshot
```

## Requirements

- [Omarchy Linux](https://omarchy.org) or Hyprland-based system
- Omarchy theme system

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Lucy E. Arias** ([@matcraft94](https://github.com/matcraft94))

Created with love for the Omarchy community.

## Acknowledgments

- [Omarchy](https://omarchy.org) - Beautiful, modern & opinionated Linux by DHH
- [Hyprland](https://hyprland.org) - Dynamic tiling Wayland compositor
- Wallpaper artists from various free sources
