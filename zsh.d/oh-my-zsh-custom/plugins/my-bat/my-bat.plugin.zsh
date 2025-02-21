if command -v "bat" &> /dev/null
then
    alias rcat="$(which cat)"
    alias cat='bat --style=plain'
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi