if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User configuration
case "$OSTYPE" in
  darwin*)  [[ ! -f $DOTS/zsh.d/Darwin.zsh ]] || source $DOTS/zsh.d/Darwin.zsh ;; 
  linux*)   [[ ! -f $DOTS/zsh.d/Linux.zsh ]] || source $DOTS/zsh.d/Linux.zsh ;; 
  *)        ;;
esac

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export DOTS="${HOME}/dotfiles"
export ZSH="${DOTS}/zsh.d/oh-my-zsh"
export ZSH_CUSTOM="${DOTS}/zsh.d/oh-my-zsh-custom"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aws
  golang
  ripgrep
  kubectl
  minikube
  docker
  docker-compose
  fzf
  pip
  zsh-histdb
  my-pyenv
  my-rvm
  my-nvim
  my-golang
)

source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export SAVEHIST=900000
export HISTFILESIZE=9000000000
export HISTSIZE=500000
export HIST_STAMPS="yyyy-mm-dd"

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'

autoload -Uz add-zsh-hook

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
