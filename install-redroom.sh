#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
# 🦉 Twin Peaks Lodge Theme Installer — Agent Osiris
# ============================================================

THEMES_DIR="$HOME/.termux/themes"
TERMUX_DIR="$HOME/.termux"
BANNERS_DIR="$HOME/termux-redroom-theme/.redroom-banners"
BANNER_LINK="$HOME/.redroom-banner"

echo "☕ Welcome, Agent Osiris. The Lodges await..."

# 1️⃣  Ensure directories exist
mkdir -p "$THEMES_DIR" "$BANNERS_DIR"

# 2️⃣  Ask user which Lodge to enter
clear
echo "==============================================="
echo "     🔮 Twin Peaks Lodge Selector"
echo "==============================================="
echo "1) 🩸 Red Room (Crimson background)"
echo "2) 🦉 Black Lodge (Dark, minimal)"
echo "==============================================="
read -rp "Choose your realm (1-2): " LODGE_CHOICE
echo

# 3️⃣  Create themes if missing
if [ ! -f "$THEMES_DIR/redroom.properties" ]; then
cat > "$THEMES_DIR/redroom.properties" <<'EOF'
background=#250000
foreground=#FFDADA
cursor=#FF5555
color0=#1A0000
color1=#8B0000
color2=#A52A2A
color3=#FF6347
color4=#B22222
color5=#CD5C5C
color6=#FF7F7F
color7=#FFDADA
color8=#4B0000
color9=#FF0000
color10=#FA8072
color11=#FFB6C1
color12=#FF4500
color13=#FF6A6A
color14=#FFA07A
color15=#FFFFFF
EOF
fi

if [ ! -f "$THEMES_DIR/blacklodge.properties" ]; then
cat > "$THEMES_DIR/blacklodge.properties" <<'EOF'
background=#000000
foreground=#D0D0D0
cursor=#FF0000
color0=#000000
color1=#B22222
color2=#A52A2A
color3=#8B0000
color4=#4B0000
color5=#7C0A02
color6=#8B0000
color7=#FFFFFF
color8=#2B0000
color9=#FF0000
color10=#FA8072
color11=#FFB6C1
color12=#FF4500
color13=#CD5C5C
color14=#FFA07A
color15=#FFFFFF
EOF
fi

# 4️⃣  Apply theme + banner based on selection
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
  *)
    echo "Invalid choice. Exiting."
    exit 1
    ;;
esac

# 5️⃣  Prompt customization
if ! grep -q "Agent Osiris" ~/.bashrc; then
cat >> ~/.bashrc <<'EOF'

# 🕯️ Twin Peaks Lodge Prompt
RED='\033[38;5;160m'
YELLOW='\033[38;5;11m'
CYAN='\033[38;5;14m'
MAGENTA='\033[38;5;13m'
RESET='\033[0m'
export PS1="${RED}[\t] ${YELLOW}Agent Osiris@localhost${CYAN}:\w ${MAGENTA}☕ ${RESET}"
EOF
fi

# 6️⃣  Apply font scaling if needed
if ! grep -q "font_scale" "$TERMUX_DIR/termux.properties" 2>/dev/null; then
  echo "font_scale=1.6" >> "$TERMUX_DIR/termux.properties"
fi

# 7️⃣  Activate
termux-reload-settings
clear
bash "$BANNER_LINK"

# 8️⃣  Global lodge alias setup
if ! grep -q "alias lodge=" ~/.bashrc; then
  echo "alias lodge='bash ~/termux-redroom-theme/switch-lodge.sh'" >> ~/.bashrc
  echo "☕ Lodge alias installed. You may now type 'lodge' anytime to switch realms."
fi


echo
echo "$LODGE_ICON  $LODGE_NAME initialized for Agent Osiris."
echo
