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