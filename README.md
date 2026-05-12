# setup

## tools i use

- os/session: arch linux + wayland + hyprland
- terminal: ghostty
- shell: zsh
- prompt: oh my posh (`catppuccin_macchiato` theme)
- editor: neovim
- bar: waybar
- lock screen: hyprlock
- wallpaper: hyprpaper
- network tray: nm-applet
- file manager: dolphin
- browser: firefox

## nvim

before copying the config, install lazy.nvim first

```
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

# nvidia problems

i’ve been getting a black screen after closing the lid, likely due to nvidia not handling suspend properly with wayland. i couldn't fix the issue, so i’ve disabled lid-triggered suspend completely.

```
sudo nano /etc/systemd/logind.conf
```

add this:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

restart

```
sudo systemctl restart systemd-logind
```

# vscode

i'm no longer using vscode but i saved my extensions in `vscode` folder, so you might check it.
