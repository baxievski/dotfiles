ZSH_D="${HOME}/dotfiles/zsh.d"
ZSH="${ZSH_D}/oh-my-zsh"
ZSH_CUSTOM="${ZSH_D}/oh-my-zsh-custom"

GLOBALIAS_FILTER_VALUES=(
  aws
  ls
  eza
  grep
  tree
  cat
  {
  *
  $
)

export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export SAVEHIST=900000
export HISTFILESIZE=9000000000
export HISTSIZE=500000
export HIST_STAMPS="yyyy-mm-dd"
export HISTDB_FZF_DEFAULT_MODE=4
export YSU_MESSAGE_POSITION="after"
export YSU_MESSAGE_FORMAT="Found existing %alias_type for "%command". You should use: "%alias""

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
  my-rvm
  my-mise
  my-nvim
  my-krew
  my-bat
  zsh-histdb
  zsh-syntax-highlighting
  zsh-histdb-fzf
)

WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey '^U' backward-kill-line
bindkey '^R' histdb-fzf-widget

export STARSHIP_CONFIG="${HOME}/dotfiles/starship.toml"
eval "$(starship init zsh)"

source $ZSH/oh-my-zsh.sh

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias eza='eza --color=auto --group-directories-first --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'
alias t='terraform'
alias fd='fd --hidden'
alias kx='kubectx'
alias yamllint='yamllint -d "{extends: relaxed, rules: {line-length: {max: 120}}}"'