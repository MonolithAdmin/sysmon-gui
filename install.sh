#!/usr/bin/env bash
set -euo pipefail

APP_NAME="sysmon-gui"
RAW_URL="https://raw.githubusercontent.com/MonolithAdmin/sysmon-gui/main/sysmon-gui"
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"

echo "Installing dependencies..."
sudo apt update
sudo apt install -y python3 python3-tk curl desktop-file-utils pciutils

echo "Installing SysMon GUI..."
mkdir -p "$INSTALL_DIR"
curl -fsSL "$RAW_URL" -o "$INSTALL_DIR/$APP_NAME"
chmod +x "$INSTALL_DIR/$APP_NAME"

echo "Creating desktop launcher..."
mkdir -p "$DESKTOP_DIR"

cat > "$DESKTOP_DIR/sysmon-gui.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=SysMon GUI
Comment=Monitor CPU, RAM, disk, and Nvidia GPU usage
Exec=$INSTALL_DIR/sysmon-gui
Terminal=false
Categories=System;Monitor;
DESKTOP

chmod +x "$DESKTOP_DIR/sysmon-gui.desktop"

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true

echo
echo "Installed."
echo "Run with:"
echo "  sysmon-gui"
echo
echo "If that does not work yet, run:"
echo "  source ~/.bashrc"
echo "  sysmon-gui"
