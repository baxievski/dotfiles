if [[ $(type "nvim" &> /dev/null) ]]
then
    export VISUAL=nvim
    export EDITOR="$VISUAL"
    alias vim='nvim'
    alias vimdiff='nvim -d'
else
    export VISUAL=vim
    export EDITOR="$VISUAL"
fi
