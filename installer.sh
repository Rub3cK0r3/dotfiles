for pkg in $(awk '{print $1}' ~/.config/packages-list.txt); do
    sudo apt install -y "$pkg" 2>/dev/null || echo "Saltado: $pkg"
done
