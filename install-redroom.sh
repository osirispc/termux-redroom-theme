#!/usr/bin/env bash
# =========================================
#  Red Room Theme Installer for Termux
# =========================================

set -e

mkdir -p ~/.termux/colors

cat > ~/.termux/colors/redroom.properties <<'EOF'
background=#240000
foreground=#fce8e8
cursor=#ff3333
color0=#1a0000
color1=#b31212
color2=#cc4444
color3=#ff6666
color4=#ff9999
color5=#ffcccc
color6=#ffaaaa
color7=#ffffff
EOF

echo "font_scale=1.3" > ~/.termux/termux.properties
termux-reload-settings 2>/dev/null || true

echo "🕯️  Red Room theme installed. Restart Termux to enter the Lodge."
