if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]
then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_D="${HOME}/dotfiles/zsh.d"
ZSH="${ZSH_D}/oh-my-zsh"
ZSH_CUSTOM="${ZSH_D}/oh-my-zsh-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"
GLOBALIAS_FILTER_VALUES=(
  ls
  exa
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
  linux*)   [[ ! -f ${ZSH_D}/Linux.zsh ]] || source ${ZSH_D}/Linux.zsh ;; 
  *)        ;;
esac

plugins=(
  aws
  fd
  fzf
  globalias
  golang
  helm
  pip
  ripgrep
  terraform
  kubectl
  my-golang
  my-docker
  # my-goenv
  my-rvm
  my-nvim
  my-pyenv
  my-krew
  # # my-ssh
  zsh-histdb
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-histdb-fzf
)

source $ZSH/oh-my-zsh.sh

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

function assume-role() {
  aws_sts_out=$(aws sts assume-role --role-arn $1 --role-session-name $2);\
  export AWS_ACCESS_KEY_ID=$(echo $aws_sts_out | jq -r '.Credentials''.AccessKeyId');\
  export AWS_SECRET_ACCESS_KEY=$(echo $aws_sts_out | jq -r '.Credentials''.SecretAccessKey');\
  export AWS_SESSION_TOKEN=$(echo $aws_sts_out | jq -r '.Credentials''.SessionToken');
}

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh.d/.p10k.zsh.
[[ ! -f ${ZSH_D}/.p10k.zsh ]] || source ${ZSH_D}/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
[[ ! -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]] || source "${HOME}/google-cloud-sdk/path.zsh.inc" 

# The next line enables shell command completion for gcloud.
[[ ! -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]] || source "${HOME}/google-cloud-sdk/completion.zsh.inc" 

# alias gam="/Users/bojan/bin/gam/gam"
