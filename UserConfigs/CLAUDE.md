# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This directory contains user-customizable Hyprland configuration files from JaKooLit's Hyprland-Dots (https://github.com/JaKooLit). These configs are designed to persist through system upgrades via `upgrade.sh` and are sourced from the main `~/.config/hypr/hyprland.conf`.

## Important Architecture Notes

### Configuration Hierarchy

All files in this directory are sourced by `~/.config/hypr/hyprland.conf`. The configuration follows this structure:

- **01-UserDefaults.conf**: Base configuration defining default applications and editor
  - Sets `$term` (terminal), `$files` (file manager), `$edit` (editor)
  - Must be sourced before other configs that reference these variables

- **UserKeybinds.conf**: Custom keybindings
  - Sources `01-UserDefaults.conf` first
  - Defines `$scriptsDir`, `$UserScripts`, and `$UserConfigs` variables
  - References scripts in `~/.config/hypr/scripts/` and `~/.config/hypr/UserScripts/`

- **Laptops.conf**: Laptop-specific configurations
  - Hardware-specific keybinds (brightness, touchpad, etc.)
  - Touchpad device name is configured via `$Touchpad_Device` variable
  - Screenshot keybinds using F6 keys (for laptops without PrintScreen)

### Tag-Based Window Rules System

WindowRules.conf uses a sophisticated tagging system to organize and apply rules consistently:

1. **Tags are defined first** using `windowrulev2 = tag +<tagname>, class:pattern`
   - Examples: `tag +browser`, `tag +terminal`, `tag +im`, `tag +games`

2. **Rules are then applied to tags** using wildcards like `tag:browser*`
   - This allows setting opacity, workspace, float behavior, etc. for entire categories

3. **Tag categories**:
   - `browser`: Web browsers (Firefox, Chrome, Brave, etc.)
   - `terminal`: Terminal emulators
   - `email`: Email clients
   - `projects`: IDEs and code editors
   - `im`: Instant messaging apps
   - `games`: Game applications
   - `gamestore`: Game launchers (Steam, Lutris, Heroic)
   - `file-manager`: File managers
   - `settings`: System settings dialogs
   - `viewer`: Document/image viewers
   - `multimedia`: Media players

### Environment Variables

ENVariables.conf sets critical environment variables for:
- Wayland compatibility (toolkit backends)
- NVIDIA GPU support
- XDG specifications
- Qt/GTK theming
- HiDPI scaling
- Cursor theming (Hyprcursor)

### Variable Sourcing Pattern

Scripts and keybinds rely on these paths:
```conf
$scriptsDir = $HOME/.config/hypr/scripts          # System scripts
$UserScripts = $HOME/.config/hypr/UserScripts     # User-defined scripts
$UserConfigs = $HOME/.config/hypr/UserConfigs     # This directory
```

## Rules for Modification

1. **DO NOT rename files** - They are referenced by path from the main hyprland.conf
2. **DO NOT conflict with default keybinds** in `~/.config/hypr/configs/Keybinds.conf`
3. **Check WorkSpaceRules file** - It's a reference guide only; actual workspace rules are in `~/.config/hypr/workspaces.conf`
4. This directory and UserScripts persist through `upgrade.sh` runs

## Configuration Reference

### Changing Default Applications

Edit `01-UserDefaults.conf`:
```conf
env = EDITOR,<your-editor>
$term = <your-terminal>
$files = <your-file-manager>
$Search_Engine = "<search-url-with-{}>"
```

### Adding Custom Keybinds

Add to `UserKeybinds.conf` after line 15 (after sourcing 01-UserDefaults.conf):
```conf
bind = $mainMod SHIFT, <KEY>, exec, <command>
```
The `$mainMod` is set to SUPER.

### Laptop-Specific Hardware Control

Edit `Laptops.conf` to customize:
- `$Touchpad_Device`: Your touchpad device identifier (get via `hyprctl devices`)
- Function key bindings (brightness, keyboard backlight, etc.)
- Lid switch behavior (commented by default)

### Window Rules Workflow

When adding rules for new applications:

1. Identify or create an appropriate tag in WindowRules.conf
2. Add application to tag: `windowrulev2 = tag +<category>, class:^(app-name)$`
3. Rules applied to that tag automatically apply to the new app
4. Override specific behavior if needed with direct rules below tag definitions

### Understanding Hyprland Version Dependencies

- The codebase targets Hyprland v0.41.2+ (Debian/Ubuntu)
- Comments show version-specific syntax (e.g., lines 48-50 in UserKeybinds.conf for older v0.39)
- Check comments for deprecated options when upgrading Hyprland

### Startup Applications

Edit `Startup_Apps.conf` to control what launches with Hyprland:
```conf
exec-once = <command>  # Runs once at Hyprland startup
```

Key startup components:
- `swww-daemon`: Wallpaper manager
- `waybar`: Status bar
- `swaync`: Notification daemon
- `ags`: Desktop shell (optional)
- `hypridle`: Idle daemon for locking

## Testing Configuration Changes

After modifying configs:
```bash
# Reload Hyprland configuration
hyprctl reload

# Or use the built-in refresh script
~/.config/hypr/scripts/Refresh.sh

# Keybind for refresh
# SUPER + ALT + R
```

## Debugging

```bash
# List all Hyprland keybinds
hyprctl binds

# Get current device names (for Laptops.conf)
hyprctl devices

# Get active window class (for WindowRules.conf)
hyprctl activewindow

# Check specific option value
hyprctl getoption <option-name>

# Set option dynamically (testing)
hyprctl keyword <section:option> <value>
```

## Related Documentation

- Hyprland Wiki: https://wiki.hyprland.org/
- Window Rules: https://wiki.hyprland.org/Configuring/Window-Rules/
- Workspace Rules: https://wiki.hyprland.org/Configuring/Workspace-Rules/
- Variables: https://wiki.hyprland.org/Configuring/Variables/
- JaKooLit's Dots Wiki: Check the repository for changelogs and updates
