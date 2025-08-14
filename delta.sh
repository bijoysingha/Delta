#!/data/data/com.termux/files/usr/bin/bash
# Delta - Linux Distro Installer (GitHub live version with auto-update + guaranteed run)
# GPL v3.0

# Colors
blue="\033[1;34m"
red="\033[1;31m"
green="\033[1;32m"
reset="\033[0m"

# GitHub repo raw URL
BASE_URL="https://raw.githubusercontent.com/bijoysingha/Delta/main"
BUILDS_URL="$BASE_URL/Delta-builds"
SELF_URL="$BASE_URL/delta.sh"

# --- Auto-update section ---
TMP_FILE=$(mktemp)
if curl -fsSL "$SELF_URL" -o "$TMP_FILE"; then
    if ! cmp -s "$0" "$TMP_FILE"; then
        echo -e "${green}[+] Updating Delta script...${reset}"
        mv "$TMP_FILE" "$0"
        chmod +x "$0"
        echo -e "${green}[+] Update complete. Restarting...${reset}"
        exec "$0" "$@"
    fi
fi
rm -f "$TMP_FILE"
# --- End of auto-update ---

print_menu() {
    printf "${blue} ########################################\n"
    printf "${blue} ## NHba.  BAC94  MI     TVGS9  /BA9.  ##\n"
    printf "${blue} ## N. Ta. DAE..  NI       9   /P \\9  ##\n"
    printf "${blue} ## B. DA. EGI°°  LP       G  /NHAGIb. ##\n"
    printf "${blue} ## ANP.   ZNGF5  NHG4A    Z /F.  NY\\ ##\n"
    printf "${blue} ########################################\n"
    printf "${red}  1. Adélie Linux\n"
    printf "${red}  2. Alpine Linux\n"
    printf "${red}  3. Arch Linux\n"
    printf "${red}  4. Artix Linux\n"
    printf "${red}  5. Chimera Linux\n"
    printf "${red}  6. Debian\n"
    printf "${red}  7. Deepin\n"
    printf "${red}  8. Fedora\n"
    printf "${red}  9. Manjaro\n"
    printf "${red} 10. OpenSUSE\n"
    printf "${red} 11. Pardus\n"
    printf "${red} 12. Rocky Linux\n"
    printf "${red} 13. Ubuntu\n"
    printf "${red} 14. Void Linux\n"
    printf "${red} 15. Kali Linux Full
    printf "${red} 16. Windows 11\n${reset}"
}

print_menu
read -p "Enter your choice [1-15]: " choice

case "$choice" in
    1)  FILE="adelie.sh" ;;
    2)  FILE="alpine.sh" ;;
    3)  FILE="archlinux.sh" ;;
    4)  FILE="artix.sh" ;;
    5)  FILE="chimera.sh" ;;
    6)  FILE="debian.sh" ;;
    7)  FILE="deepin.sh" ;;
    8)  FILE="fedora.sh" ;;
    9)  FILE="manjaro.sh" ;;
    10) FILE="opensuse.sh" ;;
    11) FILE="pardus.sh" ;;
    12) FILE="rockylinux.sh" ;;
    13) FILE="ubuntu.sh" ;;
    14) FILE="void.sh" ;;
    15) FILE="kali.sh" ;;
    16) File="windows11.sh" ;;
    *)  echo "Invalid choice!" ; exit 1 ;;
esac

echo -e "${green}[+] Downloading $FILE from GitHub...${reset}"
TMP_SCRIPT=$(mktemp)
if curl -fsSL "$BUILDS_URL/$FILE" -o "$TMP_SCRIPT"; then
    chmod +x "$TMP_SCRIPT"
    bash "$TMP_SCRIPT"
    rm -f "$TMP_SCRIPT"
else
    echo -e "${red}[-] Failed to download $FILE. Check your internet or URL.${reset}"
fi
