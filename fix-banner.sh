#!/data/data/com.termux/files/usr/bin/bash
# Twin Peaks Termux Cleanup Ritual
# Removes duplicate banner entries and restores balance to ~/.bashrc

BASHRC="$HOME/.bashrc"

# Backup first (in case spirits get restless)
cp "$BASHRC" "$BASHRC.bak_$(date +%Y%m%d%H%M%S)"

# Remove old banner invocations
sed -i '/redroom-banner/d' "$BASHRC"
sed -i '/cat .*redroom-banner/d' "$BASHRC"

# Add the single true banner
cat <<'EOF' >> "$BASHRC"

# Twin Peaks Red Room Banner
if [ -f "$HOME/.redroom-banner.txt" ]; then
  cat "$HOME/.redroom-banner.txt"
fi
EOF

echo "✨ The Lodge has been purified. Only one banner remains."
echo "🪞 Run 'source ~/.bashrc' or restart Termux to see it."
