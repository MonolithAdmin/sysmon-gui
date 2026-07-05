#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/sysmon-gui"
rm -f "$HOME/.local/share/applications/sysmon-gui.desktop"

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo "sysmon-gui removed."

chmod +x uninstall.sh
