#!/bin/sh

# ANSI color codes using POSIX-compatible $'' syntax
RED=$'\033[1;31m'
GREEN=$'\033[1;32m'
CYAN=$'\033[1;36m'
YELLOW=$'\033[1;33m'
RESET=$'\033[0m'

echo "${CYAN}==== GPU Information (pciconf) ====${RESET}"
pciconf -lv | grep -B3 display | sed "s/^/${GREEN}/; s/$/${RESET}/"

echo ""
echo "${CYAN}==== Kernel Modules Loaded (kldstat) ====${RESET}"
kldstat | grep -Ei 'drm|kms|nvidia' | sed "s/^/${GREEN}/; s/$/${RESET}/"

echo ""
echo "${CYAN}==== X11 Driver Info (/var/log/Xorg.0.log) ====${RESET}"
if [ -f /var/log/Xorg.0.log ]; then
  grep -E "(LoadModule|Loading /usr/local/lib/xorg/modules/drivers/|drm|chipset)" /var/log/Xorg.0.log | sed "s/^/${GREEN}/; s/$/${RESET}/"
else
  echo "${YELLOW}Xorg log not found. Is X11 running?${RESET}"
fi

echo ""
echo "${CYAN}==== OpenGL Renderer (glxinfo) ====${RESET}"
if command -v glxinfo >/dev/null 2>&1; then
  glxinfo | grep "OpenGL renderer" | sed "s/^/${GREEN}/; s/$/${RESET}/"
else
  echo "${YELLOW}glxinfo not installed. Run: sudo pkg install mesa-demos${RESET}"
fi
