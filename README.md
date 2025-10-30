# ☕ Twin Peaks Termux Theme — The Red Room & The Black Lodge  
**By Agent Osiris**

---

## 🔮 Overview
A fully themed Termux experience inspired by *Twin Peaks*.  
Switch between two distinct realms:

- 🩸 **Red Room** — crimson background, surreal glow, Agent Osiris banner.  
- 🦉 **Black Lodge** — deep black terminal with the Owl Cave sigil.  

Each environment changes:
- Theme colors  
- Banner art (Red Room or Owl)  
- Prompt personalized as `Agent Osiris@localhost ☕`  

---

## 🧭 Installation
Clone this repository into your Termux environment:
```bash
git clone https://github.com/osirispc/termux-redroom-theme.git
cd termux-redroom-theme
bash install-redroom.sh


---

## ☕ Lodge Commands Reference

Once installed, you have these key commands:

### 🔮 `lodge`
Switch between the **Red Room** and the **Black Lodge** instantly.

Perfect instinct, Agent Osiris ☕ — the README is the face of the Lodge, and it deserves every symbol, whisper, and line of code that defines your world.

Let’s make sure everything — the switcher, installer, and banners — lives clearly and beautifully in your README for anyone who steps into your GitHub repo.


---

🪶 Step 1 — Open your README in Termux

nano ~/termux-redroom-theme/README.md


---

🩸 Step 2 — Scroll to the bottom and paste this block

Add this after the last line of your README:

---

## ☕ Lodge Commands Reference

Once installed, you have these key commands:

### 🔮 `lodge`
Switch between the **Red Room** and the **Black Lodge** instantly.

lodge

Displays:

=============================================== 🔮 Twin Peaks Lodge Switcher

1. 🩸 Enter the Red Room


2. 🦉 Enter the Black Lodge


3. Cancel ===============================================



---

### 🕯 `bash install-redroom.sh`
Run this anytime to reinstall or repair your setup.  
It lets you choose which Lodge to make your default, updates your prompt,
and installs the **`lodge`** command automatically.

---

### 🦉 Directory Layout (for developers)

termux-redroom-theme/ ├── install-redroom.sh          # Full environment installer ├── switch-lodge.sh             # Red Room ↔ Black Lodge switcher ├── .redroom-banners/           # Contains banner scripts and image files │   ├── lodge-banner.sh         # Red Room quote + ASCII │   ├── owl-banner.sh           # Owl Cave sigil (jp2a) │   ├── owl.jpg                 # Source image for jp2a │   └── wmms.png                # Optional third banner ├── .termux/themes/             # Theme color configs │   ├── redroom.properties │   └── blacklodge.properties ├── README.md                   # You are here

---

### 💡 Notes
- Default prompt:

[HH:MM:SS] Agent Osiris@localhost:~/ ☕

- Font scale: `1.6` (adjusted for readability)
- Background: dynamically changes between **crimson** and **black**
- Tested under **Termux 0.118+**  
- Dependencies: `jp2a`, `git`, `bash`

---

## 🧙 Bonus: Customize Further
Want to add your own Lodge?
1. Copy any banner (like `owl-banner.sh`)  
2. Edit its ASCII art or `jp2a` image path  
3. Add it to `switch-lodge.sh` like this:
 ```bash
 ["newlodge"]="$BANNERS_DIR/new-banner.sh"

Your new world will appear as an option when you run lodge.


---

🔥 Credits

Created by Agent Osiris Ortiz

> “Through the darkness of future past, the magician longs to see…”
“The owls are not what they seem.” ☕

