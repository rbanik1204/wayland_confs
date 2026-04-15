# 🖤 Hyprland Rice Setup
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/df88cc99-63cb-4552-89e1-043475183426" />

A clean and customizable **Hyprland-based desktop configuration** featuring Waybar, Kitty, Rofi, Wofi, and more — built for performance and aesthetics.

---

## ✨ Features

* ⚡ Minimal & fast **Hyprland** setup
* 🎨 Dynamic theming using **Matugen**
* 🖥️ Beautiful **Waybar** with:

  * Network speed indicator
  * Time module
  * Media integration
* 🐱 **Kitty terminal** with custom colors
* 🔍 **Rofi & Wofi** launchers themed consistently
* 🔊 Audio control via **PulseAudio / Pavucontrol**
* 🌈 Unified color scheme across all components

---

## 📁 Directory Structure

```
.
├── hypr/              # Hyprland config (env, keybinds, etc.)
├── waybar/            # Waybar config + styles
├── kitty/colors/      # Kitty color schemes
├── rofi/colors/       # Rofi themes
├── matugen/           # Dynamic color generator
├── pulse/             # Audio configs
├── Thunar/            # File manager config
├── dconf/             # GNOME-related settings
├── mimeapps.list      # Default app associations
├── pavucontrol.ini    # Audio control config
```

---

## 🚀 Installation

### 1. Clone the repo

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

---

### 2. Backup your configs (IMPORTANT ⚠️)

```bash
mv ~/.config/hypr ~/.config/hypr_backup
mv ~/.config/waybar ~/.config/waybar_backup
```

---

### 3. Copy configs

```bash
cp -r * ~/.config/
```

---

### 4. Install dependencies

Make sure you have:

* `hyprland`
* `waybar`
* `kitty`
* `rofi`
* `wofi`
* `matugen`
* `playerctl`
* `pavucontrol`
* `networkmanager`

For Arch:

```bash
sudo pacman -S hyprland waybar kitty rofi wofi playerctl pavucontrol networkmanager
yay -S matugen
```

---

## 🎯 Key Highlights

### 📊 Waybar Enhancements

* Network speed module added
* Clickable modules
* Media integration support

### 🎨 Theming

* Centralized color management via **Matugen**
* Consistent UI across all apps

---

## 🖼️ Preview

*Add screenshots here (VERY IMPORTANT for GitHub visibility)*

---

## ⚙️ Customization

* Edit `hypr/hyprland.conf` → keybindings & layout
* Modify `waybar/config` → modules
* Change colors in `matugen/`

---

## 🧠 Notes

* Designed for **Arch Linux + Hyprland**
* May require tweaking for other distros
* Some configs assume specific fonts installed

---

## 🤝 Contributing

Feel free to fork and improve!

---

## 📜 License

MIT License

---

## 👤 Author

**Ratul Banik**

* GitHub: https://github.com/rbanik1204
* LinkedIn: https://www.linkedin.com/in/ratul-banik1204/

---

## ⭐ Support

If you like this setup, consider giving it a star ⭐
