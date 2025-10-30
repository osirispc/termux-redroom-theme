#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# Twin Peaks Red Room Banner Switcher
# Created for Agent Cooper by the Lodge.
# ============================================================

BANNER_DIR="$HOME/.redroom-banners"
REDROOM_FILE="$HOME/.redroom-banner"

# Available banners
declare -A BANNERS=(
  ["redroom"]="$BANNER_DIR/redroom-banner.sh"
  ["owl"]="$BANNER_DIR/owl-banner.sh"
  ["wmms"]="$BANNER_DIR/wmms-banner.sh"
)

# Ensure directory exists
mkdir -p "$BANNER_DIR"

# Menu
clear
echo -e "\033[38;5;160m"
echo "==============================================="
echo "     🔮 The Red Room Banner Selector"
echo "==============================================="
echo -e "\033[0m"
echo "Choose your banner, Agent Cooper:"
echo "1) Red Room"
echo "2) Owl"
echo "3) WMMS"
echo "4) Exit"
echo
read -rp "Selection (1-4): " CHOICE

case $CHOICE in
  1)
    SELECTED="redroom"
    ;;
  2)
    SELECTED="owl"
    ;;
  3)
    SELECTED="wmms"
    ;;
  *)
    echo "The Lodge is silent."
    exit 0
    ;;
esac

# Verify the selected file exists
if [ -f "${BANNERS[$SELECTED]}" ]; then
  echo "#!/data/data/com.termux/files/usr/bin/bash
bash \"${BANNERS[$SELECTED]}\"" > "$REDROOM_FILE"
  chmod +x "$REDROOM_FILE"
  echo -e "\n\033[38;5;160m[$SELECTED] banner activated.\033[0m ☕"
  sleep 1
  clear
  bash "$REDROOM_FILE"
else
  echo "⚠️ Banner script not found: ${BANNERS[$SELECTED]}"
fi
