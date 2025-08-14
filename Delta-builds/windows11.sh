#!/data/data/com.termux/files/usr/bin/bash -e

# Requirements 
pkg install axel proot p7zip pulseaudio -y

# Download the tarballs
axel "https://github.com/Android-PowerUser/Windroid_11/releases/download/2023.07.29/Win11.7z.001"
axel "https://github.com/Android-PowerUser/Windroid_11/releases/download/2023.07.29/Win11.7z.002"
axel "https://github.com/Android-PowerUser/Windroid_11/releases/download/2023.07.29/Win11.7z.003"

sleep 3s

# Merge the segmented tarballs
7z x Win11.7z.001 -o"$HOME"

sleep 3s

# Add file permission 
chmod +x "$HOME/Win11"
cp "$HOME/Win11" "$PREFIX/bin/win11"
chmod +x "$PREFIX/bin/win11"

# Execute 
cat >> "$PREFIX/etc/bash.bashrc" << 'EOF'
termux-wake-lock
clear
win11
EOF

# Uninstaller
cat > "$PREFIX/bin/uninstall-win11" << 'EOF'
#!/bin/bash

rm -f "$HOME/Win11.7z"*
sed -i '/clear/d' "$PREFIX/etc/bash.bashrc"
sed -i '/termux-wake-lock/d' "$PREFIX/etc/bash.bashrc"
sed -i '/win11/d' "$PREFIX/etc/bash.bashrc"
rm -f "$PREFIX/bin/Win11"
rm -f "$PREFIX/bin/uninstall-win11"
EOF
termux-fix-shebang "$PREFIX/bin/uninstall-win11"
chmod 755 "$PREFIX/bin/uninstall-win11"
