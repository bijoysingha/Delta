#!/data/data/com.termux/files/usr/bin/bash
# Delta - Linux Distro Installer
# GPL v3.0

# Colors
blue="\033[1;34m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
reset="\033[0m"

# GitHub repo URLs
BASE_URL="https://raw.githubusercontent.com/bijoysingha/Delta/main"
BUILDS_URL="$BASE_URL/Delta-builds"
SELF_URL="$BASE_URL/delta.sh"

# --- Auto-update ---
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
# --- End auto-update ---

show_help() {
cat <<'EOF'
Delta 0.0.1-alpha: chroot, mount --bind, and binfmt_misc without privilege/setup.

Usage:
  delta [option] ... [command]

Regular options:
  install [system]
        Install the selected Linux distribution from Delta-builds.
        Example: delta install kali

  list
        List all available distributions in Delta-builds.

  update
        Update Delta to the latest version from GitHub.

  run [system]
        Enter the environment of the installed system.
        Example: delta run ubuntu

  remove [system]
        Uninstall a distribution and remove its files.

  help
        Display this help menu.

Extension options:
  --bind=*path*         Bind host path into the guest environment.
  --rootfs=*path*       Use custom rootfs location instead of default.
  --kill-on-exit        Terminate all processes when exiting guest system.
  --verbose=*value*     Set debug output level.
  --version             Show Delta version info.

Visit https://github.com/bijoysingha/Delta for more help and updates.
Licensed under GPL v3 or later.
EOF
}

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
    printf "${red} 15. Kali Linux Full\n"
    printf "${red} 16. Windows 11\n${reset}"
}

# Handle commands
case "$1" in
    help|-h|--help)
        show_help
        exit 0
        ;;
    list)
        echo -e "${yellow}Available systems (by filename):${reset}"
        # NOTE: raw.githubusercontent.com doesn't list directories.
        # Keep a local list or fetch via GitHub API if needed.
        echo "adelie.sh alpine.sh archlinux.sh artix.sh chimera.sh debian.sh deepin.sh fedora.sh manjaro.sh opensuse.sh pardus.sh rockylinux.sh ubuntu.sh void.sh kali.sh windows11.sh"
        exit 0
        ;;
    update)
        echo -e "${green}[+] Forcing update...${reset}"
        curl -fsSL "$SELF_URL" -o "$0" && chmod +x "$0" && echo -e "${green}Updated!${reset}"
        exit 0
        ;;
    install)
        if [ -z "$2" ]; then
            echo -e "${red}[!] Please specify a system. Example: delta install kali${reset}"
            exit 1
        fi
        FILE="$2.sh"
        echo -e "${green}[+] Downloading $FILE from GitHub...${reset}"
        TMP_SCRIPT=$(mktemp)
        if curl -fsSL "$BUILDS_URL/$FILE" -o "$TMP_SCRIPT"; then
            chmod +x "$TMP_SCRIPT"
            bash "$TMP_SCRIPT"
            rm -f "$TMP_SCRIPT"
        else
            echo -e "${red}[-] Failed to download $FILE.${reset}"
        fi
        exit 0
        ;;
    "")
        # No arguments: show menu
        print_menu
        read -p "Enter your choice [1-16]: " choice
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
            16) FILE="windows11.sh" ;;
            *) echo "Invalid choice!" ; exit 1 ;;
        esac
        echo -e "${green}[+] Downloading $FILE from GitHub...${reset}"
        TMP_SCRIPT=$(mktemp)
        if curl -fsSL "$BUILDS_URL/$FILE" -o "$TMP_SCRIPT"; then
            chmod +x "$TMP_SCRIPT"
            bash "$TMP_SCRIPT"
            rm -f "$TMP_SCRIPT"
        else
            echo -e "${red}[-] Failed to download $FILE.${reset}"
        fi
        ;;
    *)
        echo -e "${red}[!] Unknown command: $1${reset}"
        echo "Type 'delta help' for usage."
        exit 1
        ;;
esac
