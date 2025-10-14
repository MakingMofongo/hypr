# Customizations Overview

This is an **MY Hyprland setup** based on [JaKooLit's Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots), with personal tweaks and optimizations for my workflow.

## What's Different from Base JaKooLit Config

###  Performance Optimizations

**Pre-loaded Background Applications** (`Startup_Apps.conf`)
- **Google Chrome**: Silently pre-loaded on workspace 10 for instant launches
- **Zed Editor**: Background instance on workspace 10 for instant editor access

###  Enhanced Workspace Viewer

**HyprExpo Plugin** (`hyprland.conf:58-74`)
- Installed and configured workspace overview plugin
- **Keybind**: `SUPER + Tab` - Visual workspace overview
- **Touchpad Gesture**: 3-finger swipe down (300px distance)
- Configuration: 3 columns, 5px gaps, dark background
- Installation script: `UserScripts/install_hyprexpo.sh`

###  Custom Keybindings (`UserKeybinds.conf`)

**Quick App Launches:**
- `SUPER + Z` - Zed editor (fast code editing)
- `SUPER + C` - Cursor editor (AI pair programming)
- `SUPER + Tab` - HyprExpo workspace overview

**Wallpaper Control:**
- `CTRL + ALT + W` - Random wallpaper switcher (repeatable)
- `SUPER + CTRL + Left` - Previous wallpaper (sequential navigation)
- `SUPER + CTRL + Right` - Next wallpaper (sequential navigation)

**Window Management:**
- `SUPER + O` - Toggle window opacity (cycles: 100% → x%)
- `SUPER + R` - Restart active window (useful for frozen apps)

**Productivity:**
- `CTRL + SHIFT + Escape` - System monitor (btop)

**Notification Controls:**
- `SUPER + CTRL + N` - Clear all notifications

### Window Rules Enhancements (`WindowRules.conf`)

**Custom Opacity Settings:**
- **Manual Toggle**: `SUPER + O` cycles through 100% → x%

### 📦 Additional Tools & Scripts

**Productivity Scripts** (`UserScripts/`)
- `ToggleOpacity.sh` - Cycles window transparency
- `RestartWindow.sh` - Restart frozen windows
- `SessionManager.sh` - Save/restore window sessions
- `WallpaperRandom.sh` - Random wallpaper switcher (instant with preloading)
- `WallpaperNavigate.sh` - Sequential wallpaper navigation (prev/next)
- `BenchmarkWallpaper.sh` - Test wallpaper performance



### Default Applications (`01-UserDefaults.conf`)

- **Terminal**: `foot`
- **Editor**: `kate`

### Visual Tweaks

**Cursor Theme:**
- Bibata-Modern-Ice (Hyprcursor version)
- Size: 24px

**Theming System:**
- Dynamic colors via `wallust` 
- QUICK refresh of Waybar colours with wallpaper change, instead of waybar full close and reload.

---

For the original JaKooLit config, see: https://github.com/JaKooLit/Hyprland-Dots
