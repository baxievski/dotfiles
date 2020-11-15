if [[ -z "$PS1" ]]
then
    return
fi

export DOTS="${HOME}/.vim"

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'

bind Space:magic-space
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

if [[ ! -f ${DOTS}/bash.d/env.bash ]] || source ${DOTS}/bash.d/env.bash

for completion_script in ${DOTS}/bash.d/completion/*
do
    source "$completion_script"
done

case "$OSTYPE" in
  darwin*)  source ${DOTS}/bash.d/Darwin.bash ;; 
  linux*)   source ${DOTS}/bash.d/Linux.bash ;;
  *)        ;;
esac

if [[ ! -f ${DOTS}/gitstatus/gitstatus.plugin.sh ]] || source ${DOTS}/gitstatus/gitstatus.plugin.sh

if [[ ! -f ~/.fzf.bash ]] || source ~/.fzf.bash


if [[ -f ~/.pyenv/bin/pyenv ]]
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

[[ ! -f ~/.rvm/scripts/rvm ]] || source ~/.rvm/scripts/rvm; export PATH="$PATH:$HOME/.rvm/bin"

if command -v "dircolors" &> /dev/null
then
    eval $(dircolors -b)
fi

if command -v "nvim" &> /dev/null
then
    export VISUAL=nvim
    export EDITOR="$VISUAL"
    export MANPAGER='nvim +Man!'
    alias vim='nvim'
    alias vimdiff='nvim -d'
else
    export VISUAL=vim
    export EDITOR="$VISUAL"
fi


if command -v "go" &> /dev/null; then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi

