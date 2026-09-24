autoload -Uz compinit
compinit

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

HISTSIZE=10000
SAVEHIST=10000

bindkey -e

alias ls='eza --icons --group-directories-first'
alias la='eza -a --icons --group-directories-first'
alias cls='clear'

export EDITOR=nvim

eval "$(starship init zsh)"
source /usr/share/nvm/init-nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2026-06-09 06:49:14
export PATH="$PATH:/home/anekobtw/.local/bin"
export PATH="$HOME/.bun/bin:$PATH"

