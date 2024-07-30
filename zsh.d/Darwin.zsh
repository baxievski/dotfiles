export PATH="/opt/homebrew/opt/openssl@1.1/bin:/usr/local/opt/libpq/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-getopt/bin:$PATH"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:${MANPATH}"

export HISTDB_TABULATE_CMD=(sed -e $'s/\x1f/\t/g')

export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"

