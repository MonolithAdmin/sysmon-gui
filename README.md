# SysMon GUI

A small Ubuntu desktop system monitor for AI/dev rigs.

It shows:

- CPU usage
- RAM usage
- Disk usage
- Nvidia GPU usage
- VRAM usage
- GPU temperature
- GPU power draw
- Fan speed
- Graphics and memory clocks

Built for Ubuntu systems running Nvidia GPUs.

## Install

Run:

    curl -fsSL https://raw.githubusercontent.com/MonolithAdmin/sysmon-gui/main/install.sh | bash

## Run

Run:

    sysmon-gui

Or search your application menu for:

    SysMon GUI

## Uninstall

Run:

    curl -fsSL https://raw.githubusercontent.com/MonolithAdmin/sysmon-gui/main/uninstall.sh | bash

## Requirements

- Ubuntu 22.04 or newer
- Python 3
- Tkinter
- Nvidia driver with nvidia-smi

The install script handles the Ubuntu package dependencies automatically.

## Notes

If no Nvidia GPU is detected, the app should still show CPU, RAM, and disk usage, but GPU data may show as unavailable.
