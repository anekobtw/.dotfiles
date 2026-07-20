autoload -Uz compinit
compinit

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY

HISTSIZE=10000
SAVEHIST=10000

bindkey -e

alias ls='eza --icons --group-directories-first'
alias ll='eza -lah --icons --group-directories-first'
alias la='ls -A'
alias cls='clear'

export EDITOR=nvim

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/catppuccin_macchiato.omp.json)"
source /usr/share/nvm/init-nvm.sh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH="$PATH:/home/anekobtw/.local/bin"
export PATH="$HOME/.bun/bin:$PATH"

