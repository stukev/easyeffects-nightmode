# 🎵 Quiet Night Mode Preset for EasyEffects

A simple **EasyEffects** preset and an optional **alias** to toggle your audio processing for safe and system wide night time music and video enjoyment.

- Designed for movies and shows at night without waking up the whole house.
- Flattens loudness, compresses peaks but preserves clear sound.
- Lightweight install with a single script and an optional cli command to toggle on/off.

---

## 📦 Installation

You need **EasyEffects** installed and working first!

If you don't have it:

```bash
sudo apt install easyeffects        # Debian/Ubuntu
sudo pacman -S easyeffects          # Arch
sudo dnf install easyeffects        # Fedora
```

Then clone this project:

```bash
git clone https://github.com/stukev/easyeffects-nightmode.git
cd easyeffects-nightmode
bash install.sh
```

The script will:

- Copy the `quiet.json` preset into your EasyEffects output presets folder.
- Optionally create a `quiet` alias in your `.zshrc` or `.bashrc` to easily toggle Night Mode on/off.

---

## 🛠 Usage

After installing:

- Use the `quiet` command:

```bash
quiet
```
You will see one of these messages:

- `🔊 Quiet Mode Enabled` (Night Mode is ON)
- `🔇 Quiet Mode Disabled` (Night Mode is OFF)
