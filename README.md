# 💻 Sway Dotfiles

A curated, **full-featured Sway environment** with custom keybindings, status bar scripts, Neovim development setup, and beautiful themes.

---

## 📂 Repository Structure

```
dotfiles/
├── sway/           # Sway config with custom keybindings & workspace layouts
├── waybar/         # Status bar configs, styles, and utility scripts
├── wofi/           # App launcher themes and styling
├── kitty/          # Terminal emulator configuration
├── nvim/           # Neovim setup with plugins & LSP
├── ranger/         # Terminal file manager configuration
├── picom.conf      # Compositor configuration (transparency, shadows)
├── htop/           # Custom htop configuration
└── wallpapers/     # Desktop wallpapers
```

---

## ✨ Features

* **Sway**: Custom workspaces, floating rules, and optimized keybindings
* **Waybar**: Modular status bar with scripts for audio, brightness, weather, updates, and power draw
* **Wofi**: Multiple launch themes (Tokyo, Cat)
* **Neovim**: Lazy-loaded plugins, LSP setup for many languages, UI customizations
* **Kitty**: Configured for optimal font rendering and color schemes
* **Picom**: Smooth transparency, shadows, and animations
* **Ranger**: Enhanced terminal file management

---

## ⚙️ Requirements

| Component    | Purpose                | Optional? |
| ------------ | ---------------------- | --------- |
| Sway         | Wayland compositor     | No        |
| Waybar       | Status bar             | Yes       |
| Wofi         | App launcher           | Yes       |
| Kitty        | Terminal emulator      | No        |
| Neovim       | Editor                 | No        |
| Ranger       | Terminal file manager  | No        |
| Picom        | Compositor for effects | Yes       |
| Grim & Slurp | Screenshots            | Yes       |
| wl-clipboard | Clipboard utilities    | Yes       |

---

## 🚀 Installation

1. **Backup existing configs**:

```bash
mv ~/.config/sway ~/.config/sway.backup
mv ~/.config/waybar ~/.config/waybar.backup
mv ~/.config/wofi ~/.config/wofi.backup
mv ~/.config/kitty ~/.config/kitty.backup
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.config/ranger ~/.config/ranger.backup
```

2. **Clone repository**:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
```

3. **Symlink configs**:

```bash
ln -s ~/.dotfiles/sway ~/.config/sway
ln -s ~/.dotfiles/waybar ~/.config/waybar
ln -s ~/.dotfiles/wofi ~/.config/wofi
ln -s ~/.dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/ranger ~/.config/ranger
ln -s ~/.dotfiles/picom.conf ~/.config/picom.conf
```

4. **Install optional dependencies**:

```bash
sudo apt install kitty ranger neovim waybar wofi picom wl-clipboard grim slurp
```

5. **Reload Sway**:

```bash
swaymsg reload
```

---

## 🛠 Customization

* **Sway Keybindings & Workspaces**: Edit `~/.config/sway/config`
* **Waybar Scripts**: Located in `waybar/src/scripts/`

| Script             | Function                  |
| ------------------ | ------------------------- |
| `amixer-toggle.sh` | Toggle audio mute         |
| `brightness.sh`    | Adjust screen brightness  |
| `colorpicker.sh`   | Pick and copy colors      |
| `myupdate.sh`      | Check system updates      |
| `powerdraw.sh`     | Monitor power consumption |
| `weather.sh`       | Show weather info         |

* **Wofi Themes**:

  * `theme-tokyo/`
  * `theme-cat/`

* **Neovim LSPs**: Supports Bash, C/C++, CSS, Docker, Go, HTML, Java, JSON, Lua, Python, Rust, SQL, YAML, PHP

---

## 🎨 Appearance

* Wallpapers: Located in `wallpapers/`
* Waybar Styles: `waybar/style.css` and `waybar/src/style2.css`
* Wofi Styles: `wofi/style.css` and theme folders

---

## 📝 Contributing

Contributions are welcome! Fork the repository, tweak keybindings, scripts, or themes, and submit a pull request.

---

## 📄 License

MIT License – see [LICENSE](LICENSE)

