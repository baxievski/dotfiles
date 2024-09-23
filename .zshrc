ZSH_D="${HOME}/dotfiles/zsh.d"
ZSH="${ZSH_D}/oh-my-zsh"
ZSH_CUSTOM="${ZSH_D}/oh-my-zsh-custom"

GLOBALIAS_FILTER_VALUES=(
  ls
  grep
  tree
)

export PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SAVEHIST=900000
export HISTFILESIZE=9000000000
export HISTSIZE=500000
export HIST_STAMPS="yyyy-mm-dd"
export HISTDB_FZF_DEFAULT_MODE=4

case "$OSTYPE" in
  darwin*)  [[ ! -f ${ZSH_D}/Darwin.zsh ]] || source ${ZSH_D}/Darwin.zsh ;; 
  linux-android)   [[ ! -f ${ZSH_D}/LinuxAndroid.zsh ]] || source ${ZSH_D}/LinuxAndroid.zsh ;; 
  linux*)   [[ ! -f ${ZSH_D}/Linux.zsh ]] || source ${ZSH_D}/Linux.zsh ;; 
  *)        ;;
esac

plugins=(
  aws
  fd
  globalias
  golang
  helm
  pip
  ripgrep
  terraform
  kubectl
  my-aws-assume-role
  my-fzf
  my-gcloud
  my-golang
  my-docker
  # my-goenv
  my-rvm
  my-nvim
  my-pyenv
  my-krew
  # my-ssh
  zsh-histdb
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-histdb-fzf
)

WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey '^U' backward-kill-line
bindkey '^R' histdb-fzf-widget

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'
alias h='helm'
alias t='terraform'
alias fd='fd --hidden'
alias kx='kubectx'
alias yamllint='yamllint -d "{extends: relaxed, rules: {line-length: {max: 120}}}"'

export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh
