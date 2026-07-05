#!/usr/bin/env bash
set -euo pipefail

APP_NAME="sysmon-gui"
REPO_RAW_URL="https://raw.githubusercontent.com/MonolithAdmin/sysmon-gui/main/sysmon-gui"

echo "Installing dependencies..."
sudo apt update
sudo apt install -y python3 python3-tk pciutils

echo "Installing sysmon-gui..."
mkdir -p "$HOME/.local/bin"
curl -fsSL "$REPO_RAW_URL" -o "$HOME/.local/bin/$APP_NAME"
chmod +x "$HOME/.local/bin/$APP_NAME"

echo "Creating desktop launcher..."
mkdir -p "$HOME/.local/share/applications"

cat > "$HOME/.local/share/applications/sysmon-gui.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=SysMon GUI
Comment=Monitor CPU, RAM, disk, and Nvidia GPU usage
Exec=$HOME/.local/bin/sysmon-gui
Terminal=false
Categories=System;Monitor;
EOF

chmod +x "$HOME/.local/share/applications/sysmon-gui.desktop"

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo
echo "Installed."
echo
echo "Run with:"
echo "  sysmon-gui"
echo
echo "If the command is not found, run:"
echo "  source ~/.bashrc"
echo "  sysmon-gui"
echo
echo "You can also search your application menu for:"
echo "  SysMon GUI"
