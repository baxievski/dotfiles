if [[ "$PS1" ]]; then
    export TERM=xterm-256color
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="$HOME/.cargo/bin:$PATH"
    export PATH="$HOME/Projects/go/bin:$PATH"
    export PATH="$HOME/bin:$PATH"
    export PATH="$HOME/.local/bin:$PATH"
    export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    if [[ -f ~/.vim/gitstatus/gitstatus.plugin.sh ]]; then
        source ~/.vim/gitstatus/gitstatus.plugin.sh
    fi

    if [[ -f /usr/local/etc/bash_completion ]]; then
        source /usr/local/etc/bash_completion
    fi

    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        source /usr/share/bash-completion/bash_completion
    fi

    if [[ -f ~/.fzf.bash ]]; then
        source ~/.fzf.bash
    fi

    if [[ -f ~/.pyenv/bin/pyenv ]]; then
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)"
    fi

    if [[ -f ~/.rvm/scripts/rvm ]]; then
        source ~/.rvm/scripts/rvm
        export PATH="$PATH:$HOME/.rvm/bin"
    fi

    if [[ -f /usr/libexec/java_home ]]; then
        export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
    fi

    if [[ -x "$(which dircolors 2> /dev/null)" ]]; then
        eval $(dircolors -b)
    fi

    if [[ -x "$(which pipenv 2> /dev/null)" ]]; then
        export PIPENV_VENV_IN_PROJECT=1
        # eval "$(pipenv --completion)"
    fi

    if [[ -x "$(which vimx 2> /dev/null)" ]]; then
        alias vim='vimx'
    fi

    if [[ -x "$(which nvim 2> /dev/null)" ]]; then
        export VISUAL=nvim
        export EDITOR="$VISUAL"
        alias vim='nvim'
    else
        export VISUAL=vim
        export EDITOR="$VISUAL"
    fi

    if [[ -x "$(which nvr 2> /dev/null)" ]]; then
        export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
    fi

    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias tree='tree -N --dirsfirst'

    shopt -s histappend
    shopt -s cmdhist
    shopt -s checkwinsize

    export HISTSIZE=90000
    export HISTFILESIZE=40000000
    export HISTIGNORE='cd:ls:[bf]g:exit'
    export HISTCONTROL='ignorespace:ignoredups:erasedups:ignoreboth'
    export HISTTIMEFORMAT="%Y-%m-%d %T "

    export LESS_TERMCAP_mb=$'\E[01;31m'
    export LESS_TERMCAP_md=$'\E[01;38;5;74m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[32;5;246m'
    export LESS_TERMCAP_ue=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[04;38;5;146m'

    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8

    bind Space:magic-space
    bind '"\e[A"':history-search-backward
    bind '"\e[B"':history-search-forward

    GIT_BRANCH_SYMBOL=''
    GIT_BRANCH_CHANGED_SYMBOL='+'
    GIT_STAGED_SYMBOL='●'
    GIT_UNTRACKED_SYMBOL='…'
    GIT_STASHED_SYMBOL='⚑'
    GIT_NEED_PUSH_SYMBOL='↑'
    GIT_NEED_PULL_SYMBOL='↓'
    VENV_SYMBOL=''
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

    function __venv_info() {
        if [[ -z "$VIRTUAL_ENV" ]]; then
            return
        fi

        printf "($(basename $VIRTUAL_ENV))"
    }

    function __git_fallback_info() {
        if type "git" > /dev/null; then
            local branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"

            if [[ -z "$branch" ]]; then
                return
            fi

            local marks
            local stat="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
            local aheadN="$(echo $stat | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
            local behindN="$(echo $stat | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
            local stagedN="$(git diff --cached --numstat | wc -l)"
            local changedN="$(git ls-files --modified | wc -l)"
            local untrackedN="$(git ls-files --others --exclude-standard | wc -l)"
            local stashedN="$(git stash list | wc -l)"

            if [[ "$changedN" != 0 ]]; then
                marks+=" $GIT_BRANCH_CHANGED_SYMBOL$changedN"
            fi
            if [[ "$stagedN" != 0 ]]; then
                marks+=" $GIT_STAGED_SYMBOL$stagedN"
            fi
            if [[ "$stashedN" != 0 ]]; then
                marks+=" $GIT_STASHED_SYMBOL$stashedN"
            fi
            if [[ "$untrackedN" != 0 ]]; then
                marks+=" $GIT_UNTRACKED_SYMBOL$untrackedN"
            fi
            if [[ -n "$aheadN" ]]; then
                marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
            fi
            if [[ -n "$behindN" ]]; then
                marks+=" $GIT_NEED_PULL_SYMBOL$behindN"
            fi

            printf "($GIT_BRANCH_SYMBOL$branch$marks)"
        else
            return
        fi
    }

    function __my_prompt() {
        local exit_code="$?"
        history -a;

        local HOSTN=$(uname --nodename)

        if [[ "$UID" == 0 ]]; then
            local HOST_FG_COL="$FG_RED"
        elif [[ "$HOSTN" == "riemann" ]]; then
            local HOST_FG_COL="$FG_CYAN"
        elif [[ "$HOSTN" == "cauchy" ]]; then
            local HOST_FG_COL="$FG_YELLOW"
        elif [[ "$HOSTN" == "dirac" ]]; then
            local HOST_FG_COL="$FG_BLUE"
        elif [[ "$HOSTN" == "bojan_tt" ]]; then
            local HOST_FG_COL="$FG_BLUE"
        else
            local HOST_FG_COL="$FG_MAGENTA"
        fi

        if [[ "$PS1_SHOW_HOST" == "False" ]]; then
            PS1=""
        else
            PS1="$HOST_FG_COL\u@\h$RESET:"
        fi

        PS1+="$RESET"
        PS1+="$(pwd | sed -E "s|$HOME|~|" | sed -E "s|([^/]{3})[^/]{8,}([^/]{2})/|\1…\2/|g")"
        PS1+="$RESET"

        if [[ "$PS1_SHOW_GIT" != "False" ]]; then
            if gitstatus_query 2> /dev/null && [[ "$VCS_STATUS_RESULT" == ok-sync ]]; then
                PS1+="$FG_GREEN($GIT_BRANCH_SYMBOL"

                if [[ -n "$VCS_STATUS_LOCAL_BRANCH" ]]; then
                    PS1+="${VCS_STATUS_LOCAL_BRANCH//\\/\\\\}"  # escape backslash
                else
                    PS1+="@${VCS_STATUS_COMMIT//\\/\\\\}"       # escape backslash
                fi

                if [[ "$VCS_STATUS_HAS_UNSTAGED" == 1 ]]; then
                    PS1+=" $GIT_BRANCH_CHANGED_SYMBOL"
                fi

                if [[ "$VCS_STATUS_HAS_STAGED" == 1 ]]; then
                    PS1+=" $GIT_STAGED_SYMBOL"
                fi

                if [[ "$VCS_STATUS_HAS_UNTRACKED" == 1 ]]; then
                    PS1+=" $GIT_UNTRACKED_SYMBOL"
                fi

                if [[ "$VCS_STATUS_COMMITS_AHEAD" -gt 0 ]]; then
                    PS1+=" $GIT_NEED_PUSH_SYMBOL${VCS_STATUS_COMMITS_AHEAD}"
                fi

                if [[ "$VCS_STATUS_COMMITS_BEHIND" -gt 0 ]]; then
                    PS1+=" $GIT_NEED_PULL_SYMBOL${VCS_STATUS_COMMITS_BEHIND}"
                fi

                if [[ "$VCS_STATUS_STASHES" -gt 0 ]]; then
                    PS1+=" $GIT_STASHED_SYMBOL${VCS_STATUS_STASHES}"
                fi
                PS1+=")$RESET"
            else
                PS1+="$FG_GREEN$(__git_fallback_info)$RESET"
            fi
        fi

        if [[ "$PS1_SHOW_VENV" != "False"  ]]; then
            PS1+="$FG_BLUE$(__venv_info)$RESET"
        fi

        if [[ $exit_code != 0 ]]; then
            PS1+="$FG_I_RED"
        fi
        PS1+="\$"
        PS1+="$RESET "
    }

    fd() {
        local dir
        dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
    }

    if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
        PS1_SHOW_HOST=True
    else
        PS1_SHOW_HOST=False
    fi

    if type gitstatus_stop &>/dev/null && type gitstatus_start &>/dev/null; then
        gitstatus_stop && gitstatus_start
    fi
    PROMPT_COMMAND=__my_prompt
fi
