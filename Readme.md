# Customizations Overview

This is an **opinionated Hyprland setup** based on [JaKooLit's Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots), with personal tweaks and optimizations for my workflow.

## What's Different from Base JaKooLit Config

### 🚀 Performance Optimizations

**Pre-loaded Background Applications** (`Startup_Apps.conf`)
- **Google Chrome**: Silently pre-loaded on workspace 10 for instant launches
- **Zed Editor**: Background instance on workspace 10 for instant editor access

### 🎮 Enhanced Workspace Viewer

**HyprExpo Plugin** (`hyprland.conf:58-74`)
- Installed and configured workspace overview plugin
- **Keybind**: `SUPER + Tab` - Visual workspace overview
- **Touchpad Gesture**: 3-finger swipe down (300px distance)
- Configuration: 3 columns, 5px gaps, dark background
- Installation script: `UserScripts/install_hyprexpo.sh`

### ⌨️ Custom Keybindings (`UserKeybinds.conf`)

**Quick App Launches:**
- `SUPER + Z` - Zed editor (fast code editing)
- `SUPER + C` - Cursor editor (AI pair programming)
- `SUPER + A` - AGS overview mode (desktop overview)
- `SUPER + Tab` - HyprExpo workspace overview

**Wallpaper Control:**
- `CTRL + ALT + W` - Random wallpaper switcher (repeatable)
- `SUPER + CTRL + Left` - Previous wallpaper (sequential navigation)
- `SUPER + CTRL + Right` - Next wallpaper (sequential navigation)

**Window Management:**
- `SUPER + O` - Toggle window opacity (cycles: 100% → 90% → 80% → 70% → 100%)
- `SUPER + R` - Restart active window (useful for frozen apps)
- `SUPER + F` - Fake fullscreen (keeps waybar visible)
- `SUPER + SHIFT + F` - True fullscreen

**Productivity:**
- `SUPER + ALT + C` - Calculator (qalculate)
- `CTRL + SHIFT + Escape` - System monitor (btop)

**Notification Controls:**
- `SUPER + CTRL + N` - Clear all notifications

### 🎨 Window Rules Enhancements (`WindowRules.conf`)

**Additional App Support:**
- Zed editor tagged as `projects` (opacity 0.9/0.8)
- Cursor editor support (for AI coding)
- WhatsApp, Discord, Telegram tagged as `IM` apps
- Ferdium (multi-messenger) support

**Custom Opacity Settings:**
- Browsers: 0.9/0.7 (active/inactive)
- Code editors: 0.9/0.8
- Chat apps: 0.94/0.86
- Terminals: 0.8/0.7
- **Manual Toggle**: `SUPER + O` cycles through 100% → x%

### 📦 Additional Tools & Scripts

**Productivity Scripts** (`UserScripts/`)
- `backup_configs.sh` - Backup all related configurations
- `ToggleOpacity.sh` - Cycles window transparency (100% → x%)
- `RestartWindow.sh` - Restart frozen windows
- `SessionManager.sh` - Save/restore window sessions
- `WallpaperRandom.sh` - Random wallpaper switcher (instant with preloading)
- `WallpaperNavigate.sh` - Sequential wallpaper navigation (prev/next)
- `BenchmarkWallpaper.sh` - Test wallpaper performance

**Installation Helpers:**
- `setup.sh` - First-time setup script for fresh installs
- `install_hyprexpo.sh` - HyprExpo plugin installer

### 🎯 Default Applications (`01-UserDefaults.conf`)

- **Terminal**: `foot`
- **File Manager**: `thunar`
- **Editor**: `kate`
- **Search Engine**: Google

### Visual Tweaks

**Cursor Theme:**
- Bibata-Modern-Ice (Hyprcursor version)
- Size: 24px

**Theming System:**
- Dynamic colors via `wallust` (pywal alternative)
- Auto-refresh on wallpaper change
- Waybar, rofi, swaync all themed from wallpaper

## What's Kept from JaKooLit

- Core theming system (wallust + swww)
- Waybar configuration
- Rofi menus and themes
- All base scripts in `scripts/`
- Window rules tag system
- Animation presets
- Keybind hints system

## Version Info

- **Base Config**: JaKooLit's Hyprland-Dots
- **Hyprland Version**: v0.41.2
- **Distribution**: Ubuntu (adapted for Debian-based systems)

---

For the original JaKooLit config, see: https://github.com/JaKooLit/Hyprland-Dots
