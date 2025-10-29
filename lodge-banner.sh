#!/data/data/com.termux/files/usr/bin/bash
# Twin Peaks Red Room Banner – Agent Cooper Edition

# Color palette
RED='\033[38;5;160m'
DARKRED='\033[38;5;52m'
WHITE='\033[38;5;15m'
RESET='\033[0m'

# Random Twin Peaks quote
QUOTES=(
  "Through the darkness of future past, the magician longs to see."
  "We live inside a dream."
  "When you see me again, it won’t be me."
  "The owls are not what they seem."
  "Where we're from, the birds sing a pretty song…"
)
RANDOM_QUOTE=${QUOTES[$RANDOM % ${#QUOTES[@]}]}

clear
echo -e "
${RED}██████████████████████████████████████████${RESET}
${RED}██████████████████████████████████████████${RESET}
${DARKRED}██████${RED}░░░░░░░░░░░░░░░░░░░░░░░░${DARKRED}██████${RESET}
${DARKRED}██████${RED}░░░░░░░░░░░░░░░░░░░░░░░░${DARKRED}██████${RESET}
${DARKRED}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${RESET}
${WHITE}VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV${RESET}
${DARKRED}^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^${RESET}

${RED}${RANDOM_QUOTE}${RESET}
${WHITE}Welcome back to the Red Room, Agent Cooper.${RESET} ☕
"
