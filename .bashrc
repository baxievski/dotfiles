if [[ -z "$PS1" ]]
then
    return
fi

export DOTS="${HOME}/dotfiles"

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'

bind Space:magic-space
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

for completion_script in ${DOTS}/bash.d/completion/*
do
    source "$completion_script"
done

case "$OSTYPE" in
  darwin*)  source ${DOTS}/bash.d/Darwin.bash ;; 
  linux*)   source ${DOTS}/bash.d/Linux.bash ;;
  *)        ;;
esac

if [[ -f ${DOTS}/bash.d/env.bash ]]
then
    source ${DOTS}/bash.d/env.bash
fi

if [[ -f ${DOTS}/bash.d/gitstatus/gitstatus.plugin.sh ]]
then
    source ${DOTS}/bash.d/gitstatus/gitstatus.plugin.sh
fi

if [[ -f ${HOME}/.fzf.bash ]]
then
    source ${HOME}/.fzf.bash
fi

if [[ -f ~/.pyenv/bin/pyenv ]]
then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [[ -f ~/.rvm/scripts/rvm ]]
then
    source ~/.rvm/scripts/rvm
fi

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
