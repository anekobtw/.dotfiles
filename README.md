# setup

## os

i use arch btw

## terminal

i'm using `ghostty` with `zsh` shell (config can be found in `.zshrc`). additionally, i use oh my posh (`.config/oh-my-posh`)

## editor

my editor is nvim, but before copying the config (located in `.config/nvim`), install lazy.nvim first

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
