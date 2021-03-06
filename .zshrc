if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

DOTS="${HOME}/dotfiles"
ZSH="${DOTS}/zsh.d/oh-my-zsh"
ZSH_CUSTOM="${DOTS}/zsh.d/oh-my-zsh-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
GLOBALIAS_FILTER_VALUES=(
  ls
  exa
  grep
  tree
)

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.krew/bin:${PATH}"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SAVEHIST=900000
export HISTFILESIZE=9000000000
export HISTSIZE=500000
export HIST_STAMPS="yyyy-mm-dd"

case "$OSTYPE" in
  darwin*)  [[ ! -f $DOTS/zsh.d/Darwin.zsh ]] || source $DOTS/zsh.d/Darwin.zsh ;; 
  linux*)   [[ ! -f $DOTS/zsh.d/Linux.zsh ]] || source $DOTS/zsh.d/Linux.zsh ;; 
  *)        ;;
esac


plugins=(
  aws
  docker
  docker-compose
  fd
  fzf
  globalias
  golang
  helm
  minikube
  pip
  ripgrep
  terraform
  kubectl
  # my-bat
  my-golang
  my-fzf
  my-nvim
  my-pyenv
  my-ssh
  zsh-histdb
)

source $ZSH/oh-my-zsh.sh

WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey \^U backward-kill-line

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias exa='exa --group-directories-first --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'
alias t='terraform'

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh.d/.p10k.zsh.
[[ ! -f $DOTS/zsh.d/.p10k.zsh ]] || source $DOTS/zsh.d/.p10k.zsh
