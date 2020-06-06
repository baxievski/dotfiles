if [[ -z "$PS1" ]]
then
    return
fi

if [[ -f ~/.vim/gitstatus/gitstatus.plugin.sh ]]
then
    source ~/.vim/gitstatus/gitstatus.plugin.sh
fi

if [[ -f /usr/local/etc/bash_completion ]]
then
    source /usr/local/etc/bash_completion
fi

if [[ -f /usr/share/bash-completion/bash_completion ]]
then
    source /usr/share/bash-completion/bash_completion
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
    export PATH="$PATH:$HOME/.rvm/bin"
fi

if [[ -f /usr/libexec/java_home ]]
then
    export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
fi

if type "dircolors" &> /dev/null
then
    eval $(dircolors -b)
fi

if type "nvim" &> /dev/null
then
    export VISUAL=nvim
    export EDITOR="$VISUAL"
    alias vim='nvim'
    alias vimdiff='nvim -d'
else
    export VISUAL=vim
    export EDITOR="$VISUAL"
fi

for completion_script in ~/.vim/bash_completion.d/*
do
    source "$completion_script"
done

if type "go" &> /dev/null; then
    export PATH=$PATH:$(go env GOPATH)/bin
    export GOPATH=$(go env GOPATH)
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTSIZE=200000
export HISTFILESIZE=800000000
export HISTIGNORE='cd:ls:[bf]g:exit'
export HISTCONTROL='ignorespace:ignoredups:erasedups:ignoreboth'
export HISTTIMEFORMAT="%Y-%m-%d %T "

shopt -s histappend
shopt -s cmdhist
shopt -s checkwinsize
shopt -s globstar

alias ls='ls --color=auto --group-directories-first -v --time-style=long-iso'
alias grep='grep --color=auto'
alias tree='tree -N --dirsfirst'

bind Space:magic-space
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

FG_BLACK="\[$(tput setaf 0)\]"
FG_RED="\[$(tput setaf 1)\]"
FG_GREEN="\[$(tput setaf 2)\]"
FG_YELLOW="\[$(tput setaf 3)\]"
FG_BLUE="\[$(tput setaf 4)\]"
FG_MAGENTA="\[$(tput setaf 5)\]"
FG_CYAN="\[$(tput setaf 6)\]"
FG_GREY="\[$(tput setaf 7)\]"
FG_I_BLACK="\[$(tput setaf 8)\]"
FG_I_RED="\[$(tput setaf 9)\]"
FG_I_GREEN="\[$(tput setaf 10)\]"
FG_I_YELLOW="\[$(tput setaf 11)\]"
FG_I_BLUE="\[$(tput setaf 12)\]"
FG_I_MAGENTA="\[$(tput setaf 13)\]"
FG_I_CYAN="\[$(tput setaf 14)\]"
FG_I_GREY="\[$(tput setaf 15)\]"
BG_BLACK="\[$(tput setab 0)\]"
BG_RED="\[$(tput setab 1)\]"
BG_GREEN="\[$(tput setab 2)\]"
BG_YELLOW="\[$(tput setab 3)\]"
BG_BLUE="\[$(tput setab 4)\]"
BG_MAGENTA="\[$(tput setab 5)\]"
BG_CYAN="\[$(tput setab 6)\]"
BG_GREY="\[$(tput setab 7)\]"
BG_I_BLACK="\[$(tput setab 8)\]"
BG_I_RED="\[$(tput setab 9)\]"
BG_I_GREEN="\[$(tput setab 10)\]"
BG_I_YELLOW="\[$(tput setab 11)\]"
BG_I_BLUE="\[$(tput setab 12)\]"
BG_I_MAGENTA="\[$(tput setab 13)\]"
BG_I_CYAN="\[$(tput setab 14)\]"
BG_I_GREY="\[$(tput setab 15)\]"
DIM="\[$(tput dim)\]"
REVERSE="\[$(tput rev)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"

PROMPT_DIRTRIM=2

function __ps1_venv_info() {
    if [[ -z "$VIRTUAL_ENV" ]]
    then
        return
    fi

    if [[ "$PS1_SHOW_VENV" == "False"  ]]
    then
        return
    fi

    local venv_symbol=''
    printf "$FG_YELLOW($(basename $VIRTUAL_ENV)$RESET)"
}

function __ps1_hostname() {
    if [[ "$PS1_SHOW_HOST" == "False" ]]; then
        return
    fi

    local HOSTN=$(uname --nodename)

    if [[ "$UID" == 0 ]]; then
        local HOST_FG_COL="$FG_RED"
    elif [[ "$HOSTN" == "riemann" ]]; then
        local HOST_FG_COL="$FG_CYAN"
    elif [[ "$HOSTN" == "cauchy" ]]; then
        local HOST_FG_COL="$FG_YELLOW"
    elif [[ "$HOSTN" == "dirac" ]]; then
        local HOST_FG_COL="$FG_BLUE"
    elif [[ "$HOSTN" == "bojan-tt-macbook" ]]; then
        local HOST_FG_COL="$FG_BLUE"
    else
        local HOST_FG_COL="$FG_MAGENTA"
    fi

    if [[ "$PS1_SHOW_HOST" == "False" ]]
    then
        PS1=""
    else
        PS1="$HOST_FG_COL\u@\h$RESET:"
    fi

    printf "$HOST_FG_COL\u@\h$RESET:"
}

function __ps1_git_info() {
    if [[ "$PS1_SHOW_GIT" == "False" ]]; then
        return
    fi

    if ! type "git" &> /dev/null
    then
        return
    fi

    local git_branch_symbol=''
    local git_branch_changed_symbol='+'
    local git_staged_symbol='●'
    local git_untracked_symbol='…'
    local git_stashed_symbol='⚑'
    local git_need_push_symbol='↑'
    local git_need_pull_symbol='↓'
    local marks

    if gitstatus_query 2> /dev/null && [[ "$VCS_STATUS_RESULT" == ok-sync ]]
    then
        marks=""

        if [[ -n "$VCS_STATUS_LOCAL_BRANCH" ]]
        then
            marks+="${VCS_STATUS_LOCAL_BRANCH//\\/\\\\}"  # escape backslash
        else
            marks+="@${VCS_STATUS_COMMIT//\\/\\\\}"       # escape backslash
        fi

        if [[ "$VCS_STATUS_HAS_UNSTAGED" == 1 ]]
        then
            marks+=" $git_branch_changed_symbol"
        fi

        if [[ "$VCS_STATUS_HAS_STAGED" == 1 ]]
        then
            marks+=" $git_staged_symbol"
        fi

        if [[ "$VCS_STATUS_HAS_UNTRACKED" == 1 ]]
        then
            marks+=" $git_untracked_symbol"
        fi

        if [[ "$VCS_STATUS_COMMITS_AHEAD" -gt 0 ]]
        then
            marks+=" $git_need_push_symbol${VCS_STATUS_COMMITS_AHEAD}"
        fi

        if [[ "$VCS_STATUS_COMMITS_BEHIND" -gt 0 ]]
        then
            marks+=" $git_need_pull_symbol${VCS_STATUS_COMMITS_BEHIND}"
        fi

        if [[ "$VCS_STATUS_STASHES" -gt 0 ]]
        then
            marks+=" $git_stashed_symbol${VCS_STATUS_STASHES}"
        fi

        printf "$FG_GREEN($git_branch_symbol$marks)$RESET"
        return
    fi

    local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"

    if [[ -z "$branch" ]]
    then
        return
    fi

    local stat="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
    local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
    local stagedN="$(git diff --cached --numstat | wc -l)"
    local changedN="$(git ls-files --modified | wc -l)"
    local untrackedN="$(git ls-files --others --exclude-standard | wc -l)"
    local stashedN="$(git stash list | wc -l)"

    if [[ "$changedN" != 0 ]]
    then
        marks+=" $git_branch_changed_symbol$changedN"
    fi
    if [[ "$stagedN" != 0 ]]
    then
        marks+=" $git_staged_symbol$stagedN"
    fi
    if [[ "$stashedN" != 0 ]]
    then
        marks+=" $git_stashed_symbol$stashedN"
    fi
    if [[ "$untrackedN" != 0 ]]
    then
        marks+=" $git_untracked_symbol$untrackedN"
    fi
    if [[ -n "$aheadN" ]]
    then
        marks+=" $git_need_push_symbol$aheadN"
    fi
    if [[ -n "$behindN" ]]
    then
        marks+=" $git_need_pull_symbol$behindN"
    fi

    printf "$FG_GREEN($git_branch_symbol$branch$marks)$RESET"
}

function __check_cd() {
    if [[ "$LAST_PWD" != "$PWD" ]]
    then
        __post_cd_hooks
    fi
    LAST_PWD=$PWD
}

function __post_cd_hooks() {
    __set_local_histfile
}

function __set_local_histfile() {
    local HISTDIR="$HOME/.vim/bash_history.d$PWD"
    if [[ ! -d "$HISTDIR" ]]
    then
        mkdir -p "$HISTDIR"
    fi
    export HISTFILE="$HISTDIR/${USER}_bash_history.txt" # set new history file
    history -c
    history -r
}

function ps1_toggle_git () {
    if [[ "$PS1_SHOW_GIT" != "False" ]]
    then
        PS1_SHOW_GIT="False"
    else
        PS1_SHOW_GIT="True"
    fi
}

function ps1_toggle_host () {
    if [[ "$PS1_SHOW_HOST" != "False" ]]
    then
        PS1_SHOW_HOST="False"
    else
        PS1_SHOW_HOST="True"
    fi
}

function ps1_toggle_venv () {
    if [[ "$PS1_SHOW_VENV" != "False" ]]
    then
        PS1_SHOW_VENV="False"
    else
        PS1_SHOW_VENV="True"
    fi
}

function __my_prompt() {
    local exit_code="$?"
    history -a
    __check_cd

    PS1=""
    PS1+="$(__ps1_hostname)"
    PS1+="\w"
    PS1+="$(__ps1_git_info)"
    PS1+="$(__ps1_venv_info)"

    if [[ $exit_code != 0 ]]
    then
        PS1+="$FG_I_RED"
    else
        PS1+="$FG_GREEN"
    fi
    PS1+="\$"
    PS1+="$RESET "
}

function fdir() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
}

if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]
then
    PS1_SHOW_HOST=True
else
    PS1_SHOW_HOST=False
fi

if type gitstatus_stop &> /dev/null && type gitstatus_start &> /dev/null
then
    gitstatus_stop && gitstatus_start
fi

PROMPT_COMMAND=__my_prompt
