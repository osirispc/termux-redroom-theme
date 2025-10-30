#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# ☕ Twin Peaks Lodge Switcher — Agent Osiris
# ============================================================

THEMES_DIR="$HOME/.termux/themes"
TERMUX_DIR="$HOME/.termux"
BANNERS_DIR="$HOME/termux-redroom-theme/.redroom-banners"
BANNER_LINK="$HOME/.redroom-banner"

clear
echo "==============================================="
echo "     🔮 Twin Peaks Lodge Switcher"
echo "==============================================="
echo "1) 🩸 Enter the Red Room"
echo "2) 🦉 Enter the Black Lodge"
echo "3) Cancel"
echo "==============================================="
read -rp "Choose your realm (1-3): " LODGE_CHOICE
echo

case $LODGE_CHOICE in
  1)
    cp "$THEMES_DIR/redroom.properties" "$TERMUX_DIR/colors.properties"
    if [ -f "$BANNERS_DIR/lodge-banner.sh" ]; then
        cp "$BANNERS_DIR/lodge-banner.sh" "$BANNER_LINK"
    fi
    LODGE_NAME="Red Room"
    LODGE_ICON="🩸"
    ;;
  2)
    cp "$THEMES_DIR/blacklodge.properties" "$TERMUX_DIR/colors.properties"
    if [ -f "$BANNERS_DIR/owl-banner.sh" ]; then
        cp "$BANNERS_DIR/owl-banner.sh" "$BANNER_LINK"
    fi
    LODGE_NAME="Black Lodge"
    LODGE_ICON="🦉"
    ;;
  3)
    echo "No switch made, Agent Osiris."
    exit 0
    ;;
  *)
    echo "Invalid choice. The curtains remain closed."
    exit 1
    ;;
esac

termux-reload-settings
clear
bash "$BANNER_LINK"

echo
echo "$LODGE_ICON  $LODGE_NAME awaits you, Agent Osiris."
echo
