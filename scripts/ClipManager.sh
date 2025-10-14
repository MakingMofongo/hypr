#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Clipboard Manager. This script uses cliphist, rofi, and wl-copy.

# Variables
rofi_theme="$HOME/.config/rofi/config-clipboard.rasi"
msg='👀 **note**  CTRL DEL = cliphist del (entry)   or   ALT DEL - cliphist wipe (all)'
# Actions:
# CTRL Del to delete an entry
# ALT Del to wipe clipboard contents

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# Create a temporary directory for image previews
tmp_dir="/tmp/cliphist-previews-$$"
mkdir -p "$tmp_dir"

# Function to clean up temp directory
cleanup() {
    rm -rf "$tmp_dir"
}
trap cleanup EXIT

# Process cliphist list to show image previews
process_list() {
    cliphist list | while IFS= read -r line; do
        # Check if this entry contains binary data (image)
        if echo "$line" | grep -q '\[\[ binary data'; then
            # Extract the ID (first field), size, format, and dimensions
            id=$(echo "$line" | awk '{print $1}')
            size=$(echo "$line" | grep -oP '\[\[ binary data \K[0-9]+ [KMG]iB')
            format=$(echo "$line" | grep -oP '(png|jpg|jpeg|gif|webp)')
            dimensions=$(echo "$line" | grep -oP '[0-9]+x[0-9]+')

            # Show image icon with details
            echo "🖼️  Image #${id} (${format} ${dimensions} - ${size})"
        else
            echo "$line"
        fi
    done
}

while true; do
    result=$(
        rofi -i -dmenu \
            -kb-custom-1 "Control-Delete" \
            -kb-custom-2 "Alt-Delete" \
            -config $rofi_theme < <(process_list) \
			-mesg "$msg"
    )

    case "$?" in
        1)
            exit
            ;;
        0)
            case "$result" in
                "")
                    continue
                    ;;
                *)
                    # Handle image entries
                    if echo "$result" | grep -q '🖼️  Image #'; then
                        # Extract ID and format from the result
                        id=$(echo "$result" | sed 's/.*Image #\([0-9]*\) .*/\1/')
                        format=$(echo "$result" | grep -oP '\((png|jpg|jpeg|gif|webp)')
                        format=${format#\(}  # Remove leading parenthesis

                        # Map format to MIME type
                        case "$format" in
                            png) mime="image/png" ;;
                            jpg|jpeg) mime="image/jpeg" ;;
                            gif) mime="image/gif" ;;
                            webp) mime="image/webp" ;;
                            *) mime="image/png" ;;  # Default fallback
                        esac

                        # Find the matching line in cliphist by ID and decode it
                        # Copy to both Wayland (wl-copy) and X11 (xclip) clipboards for compatibility
                        temp_img="/tmp/cliphist_restore_$$.${format}"
                        cliphist list | awk -v id="$id" '$1 == id' | cliphist decode > "$temp_img"
                        wl-copy --type "$mime" < "$temp_img"
                        xclip -selection clipboard -t "$mime" -i "$temp_img"
                        rm -f "$temp_img"

                        # Auto-paste after copying (instant)
                        wtype -M ctrl -P v -m ctrl -p v &
                    else
                        # Regular text entry - extract ID from the beginning
                        id=$(echo "$result" | awk '{print $1}')
                        cliphist list | awk -v id="$id" '$1 == id' | cliphist decode | wl-copy

                        # Auto-paste after copying (instant)
                        wtype -M ctrl -P v -m ctrl -p v &
                    fi
                    exit
                    ;;
            esac
            ;;
        10)
            # Handle deletion for both text and image entries
            if echo "$result" | grep -q '🖼️  Image #'; then
                id=$(echo "$result" | sed 's/.*Image #\([0-9]*\) .*/\1/')
                cliphist list | awk -v id="$id" '$1 == id' | cliphist delete
            else
                id=$(echo "$result" | awk '{print $1}')
                cliphist list | awk -v id="$id" '$1 == id' | cliphist delete
            fi
            ;;
        11)
            cliphist wipe
            ;;
    esac
done

