#!/bin/bash
Function
print_banner()
printf"${blue} ##########################################\n"
printf"${blue} ## NHba.    BAC94    MI           TVGS9    /BA9.       ##\n"
printf"${blue} ## N.  TA.    DAE...     NI                9        /P   \9.      ##\n"
printf"${blue} ## B.   DA.   EGI°°°    LP                G       NHAG      ##\n"
printf"${blue} ## ANP..      ZNGF5   NHG4A       Z      /F.   NY\     ##\n"
printf"${blue} ##########################################\n"
printf"${red}                                         DELTA                                      \n"
printf"${red}                                     by  -- ●- -● --- ●---                         \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} I. Adélie Linux   \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 2. Alpine Linux  \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 3. Arch Linux     \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 4. Artix Linux     \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 5. Chimera Linux \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 6. Debain             \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 7. deepin              \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 8. Fedora              \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 9. Manjaro           \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 10. OpenSUSE     \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 11. Pardus            \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 12. Rocky Linux  \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 13. Ubuntu (24.04) \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 14. Void Linux     \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 15. Kali linux full \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 16. Kali linux minimal \n"
printf"${RED}[${WHITE}03${RED}]${ORANGE} 17. Kali linux nano \n"
print_banner

read -p "Enter your choice [1-17]: " choice

if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le 17 ]; then
    echo "Running script${choice}.sh from GitHub..."
    bash <(curl -fsSL "https://raw.githubusercontent.com/bijoysingha/Delta/main/delta-build/script${choice}.sh")
else
    echo "Invalid choice. Please select between 1 and 17."
fi
ontent.com/bijoysingha/Simple-codes/main/script${choice}.sh"
    
    curl -fsSL "$url" -o temp_script.sh
    
    if [ -s temp_script.sh ]; then
        chmod +x temp_script.sh
        ./temp_script.sh
    else
        echo "Error: Script not found in repository for choice $choice"
    fi
else
    echo "Invalid choice. Please select a number between 1 and 17."
fi
