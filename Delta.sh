#!/data/data/com.termux/files/usr/bin/bash
# Delta - Linux Distro Installer
# GPL v3.0

DELTA_DIR="$HOME/Delta-build"

print_menu() {
printf"${blue} ########################################\n"
printf"${blue} ## NHba.  BAC94  MI     TVGS9  /BA9.  ##\n"
printf"${blue} ## N. Ta. DAE..  NI       9   /P \\9  ##\n"
printf"${blue} ## B. DA. EGI°°  LP       G  /NHAGIb. ##\n"
printf"${blue} ## ANP.   ZNGF5  NHG4A    Z /F.  NY\\ ##\n"
printf"${blue} ########################################\n"
printf"${red} " 1. Adélie Linux"
printf"${red} " 2. Alpine Linux"
printf"${red} " 3. Arch Linux"
printf"${red} " 4. Artix Linux"
printf"${red} " 5. Chimera Linux"
printf"${red} " 6. Debian"
printf"${red} " 7. Deepin"
printf"${red} " 8. Fedora"
printf"${red} " 9. Manjaro"
printf"${red} "10. OpenSUSE"
printf"${red} "11. Pardus"
printf"${red} "12. Rocky Linux"
printf"${red} "13. Ubuntu"
printf"${red} "14. Void Linux"
printf"${red} "15. Kali Linux Full"
}
print_menu
read -p "Enter your choice [1-15]: " choice
