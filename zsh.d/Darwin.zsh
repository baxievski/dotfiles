export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')

[[ ! -f /usr/libexec/java_home ]] || export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
