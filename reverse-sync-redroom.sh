#!/usr/bin/env bash
# =========================================
#  Red Room Reverse Sync Utility
#  Pulls latest Termux config from GitHub
# =========================================

set -e
echo "🕯️  Pulling latest Red Room configuration from GitHub..."

if [ -d "$HOME/termux-redroom-theme/.git" ]; then
  cd ~/termux-redroom-theme
  git pull origin main
else
  cd ~
  git clone https://github.com/osirispc/termux-redroom-theme.git
  cd termux-redroom-theme
fi

mkdir -p ~/.termux/colors
cp ./colors/redroom.properties ~/.termux/colors/ 2>/dev/null || echo "⚠️  No colors directory found."
cp ./termux.properties ~/.termux/ 2>/dev/null || echo "⚠️  No properties file found."
if [ -f "./bashrc-redroom" ]; then
  cat ./bashrc-redroom >> ~/.bashrc
fi

termux-reload-settings 2>/dev/null || true
echo "✨  Red Room configuration applied. Restart Termux to enter the Lodge."
