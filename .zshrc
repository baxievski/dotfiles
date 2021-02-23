if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export DOTS="${HOME}/dotfiles"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SAVEHIST=900000
export HISTFILESIZE=9000000000
export HISTSIZE=500000
export HIST_STAMPS="yyyy-mm-dd"
export GLOBALIAS_FILTER_VALUES=(
  ls
  exa
  grep
  tree
)

case "$OSTYPE" in
  darwin*)  [[ ! -f $DOTS/zsh.d/Darwin.zsh ]] || source $DOTS/zsh.d/Darwin.zsh ;; 
  linux*)   [[ ! -f $DOTS/zsh.d/Linux.zsh ]] || source $DOTS/zsh.d/Linux.zsh ;; 
  *)        ;;
esac

[[ ! -f $DOTS/.env ]] || source $DOTS/.env

ZSH="${DOTS}/zsh.d/oh-my-zsh"
ZSH_CUSTOM="${DOTS}/zsh.d/oh-my-zsh-custom"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  aws
  docker
  docker-compose
  fd
  fzf
  # fzf-tab
  globalias
  golang
  helm
  minikube
  pip
  ripgrep
  terraform
  kubectl
  my-bat
  my-golang
  my-fzf
  my-nvim
  my-pyenv
  my-ssh
  zsh-autosuggestions
  zsh-histdb
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias exa='exa --group-directories-first --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'
alias t='terraform'

autoload -Uz add-zsh-hook

_zsh_autosuggest_strategy_histdb_top() {
    local query="select
    commands.argv
    from history
    left join commands on history.command_id = commands.rowid
    left join places on history.place_id = places.rowid
    where commands.argv LIKE '$(sql_escape $1)%'
    group by commands.argv
    order by places.dir != '$(sql_escape $PWD)', count(*) desc limit 1"
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=histdb_top

# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh.d/.p10k.zsh.
[[ ! -f $DOTS/zsh.d/.p10k.zsh ]] || source $DOTS/zsh.d/.p10k.zsh
