#!/data/data/com.termux/files/usr/bin/bash
# 🕯 Twin Peaks Red Room Banner Switcher
# Allows Agent Cooper to switch between startup banners

BANNER_DIR="$HOME/.redroom-banners"
BASHRC="$HOME/.bashrc"

# Ensure banner folder exists
mkdir -p "$BANNER_DIR"

declare -A BANNERS=(
  ["lodge"]="$BANNER_DIR/lodge-banner.sh"
  ["owl"]="jp2a --width=45 --background=dark --chars=' .:-=+*#%@█' '$BANNER_DIR/owl.jpg'"
  ["wmms"]="jp2a --width=45 --background=dark --chars=' .:-=+*#%@█' '$BANNER_DIR/wmms.png'"
)

# Function to set banner
set_banner() {
  local choice=$1
  echo "Setting banner to: $choice"
  if [[ "$choice" == "lodge" ]]; then
    echo "bash ${BANNERS[$choice]}" > "$HOME/.redroom-banner"
  else
    echo "${BANNERS[$choice]}" > "$HOME/.redroom-banner"
  fi

  # Update .bashrc to source banner
  grep -q ".redroom-banner" "$BASHRC" || echo 'if [ -f "$HOME/.redroom-banner" ]; then bash $HOME/.redroom-banner; fi' >> "$BASHRC"
  echo "✨ Banner switched. Restart Termux to see it."
}

# Menu
echo "Welcome back, Agent Cooper. Choose your vision:"
echo "1) Classic Lodge Banner"
echo "2) The Owl"
echo "3) WMMS Symbol"
read -p "Enter choice [1-3]: " choice

case $choice in
  1) set_banner "lodge" ;;
  2) set_banner "owl" ;;
  3) set_banner "wmms" ;;
  *) echo "The curtains remain closed. Invalid choice." ;;
esac
