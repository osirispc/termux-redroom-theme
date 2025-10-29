#!/usr/bin/env bash
# =========================================
#  Red Room Sync Utility
#  Pushes Termux config changes to GitHub
#  Author: Agent Osiris ☕
# =========================================

set -e

echo "🕯️ Syncing Termux Red Room configuration..."

# Path to Termux home directory (edit this if different)
TERMUX_HOME="$HOME/.termux"

# 1️⃣ Pull latest version from GitHub (safe sync)
git pull --rebase origin main || echo "⚠️ No remote changes or pull failed."

# 2️⃣ Copy updated local Termux files into repo
cp -r "$TERMUX_HOME/colors" ./ || echo "⚠️ No colors directory found."
cp "$TERMUX_HOME/termux.properties" ./ || echo "⚠️ No termux.properties found."
cp ~/.bashrc ./bashrc-redroom || echo "⚠️ No bashrc found, skipping."

# 3️⃣ Stage, commit, and push
git add .
git commit -m "Update Red Room Termux configuration: $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit."
git push origin main

echo "✨ Red Room sync complete. The Lodge is updated."
