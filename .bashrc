# ====== Twin Peaks Red Room Theme for Termux ======
# Author: Agent Cooper
# Location: The Black Lodge

# Load custom banner if it exists
if [ -f "$HOME/.redroom-banner" ]; then
    bash "$HOME/.redroom-banner"
fi

# ====== COLORS ======
RED='\[\e[0;31m\]'
YELLOW='\[\e[0;33m\]'
CYAN='\[\e[0;36m\]'
MAGENTA='\[\e[0;35m\]'
RESET='\[\e[0m\]'

# ====== PROMPT ======
# Example: [17:49:21] AgentCooper@localhost:~/termux-redroom-theme ☕
export PS1="${RED}[\t] ${YELLOW}AgentCooper@localhost${CYAN}:\w ${MAGENTA}☕ ${RESET}"

# ====== ALIASES ======
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias update='pkg update && pkg upgrade -y'
alias coffee='echo "Damn fine coffee, Agent."'

# ====== ENVIRONMENT ======
export TERMUX_VERSION="RedRoom Edition"
export EDITOR=nano
export BANNER_PATH="$HOME/.redroom-banner"
export PATH=$PATH:$HOME/bin

# ====== FUNCTIONS ======
redroom_banner() {
    if [ -f "$HOME/.redroom-banner" ]; then
        bash "$HOME/.redroom-banner"
    else
        echo -e "${RED}Welcome to the Red Room.${RESET}"
    fi
}

# ====== STARTUP MESSAGE ======
echo -e "${MAGENTA}Welcome back, Agent Cooper. The owls are not what they seem.${RESET}"
echo ""

# ====== Optional: show banner at login ======
redroom_banner
