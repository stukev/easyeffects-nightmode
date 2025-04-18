#!/bin/bash

# Installer for Quiet Night Mode preset for EasyEffects (CLI Toggle Version with working ON/OFF)

set -e

echo "📥 Installing Quiet Night Mode preset for EasyEffects..."

# Detect output preset directory
PRESET_DIR="$HOME/.config/easyeffects/output"

# Create output directory if missing
mkdir -p "$PRESET_DIR"

# Copy preset
cp quiet.json "$PRESET_DIR/"

echo "✅ Preset installed to $PRESET_DIR/quiet.json"

# Ask about alias
echo
echo "➤ Checking for your shell config (.zshrc or .bashrc)..."

if [ -f "$HOME/.zshrc" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC=""
fi

if [ -n "$SHELL_RC" ]; then
    read -p "❓ Do you want to add a 'quiet' alias to toggle Quiet Mode on/off (y/n)? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        {
            echo ""
            echo "# Quiet Mode toggle alias for EasyEffects"
            echo "alias quiet='
FLAG=\"\$HOME/.quietmode_active\"
if [ -f \"\$FLAG\" ]; then
    easyeffects -b 1 && echo \"🔇 Quiet Mode Disabled\"
    rm -f \"\$FLAG\"
else
    easyeffects -l quiet && easyeffects -b 2 && echo \"🔊 Quiet Mode Enabled\"
    touch \"\$FLAG\"
fi
'"
        } >> "$SHELL_RC"
        echo "✅ Alias 'quiet' added to $SHELL_RC."
        echo "ℹ️ Please reload your shell or run: source $SHELL_RC"
    else
        echo "⚡ Skipping alias setup."
    fi
else
    echo "⚠️ No .zshrc or .bashrc found. Skipping alias setup."
fi

echo
echo "🎉 Installation complete. Use 'quiet' to toggle Night Mode audio ON/OFF!"
