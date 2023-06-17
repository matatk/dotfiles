if [ "$(uname -s)" = 'Darwin' ]; then
	[ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
	[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH=$HOME/bin:$PATH
EDITOR="$(which nvim)"  # used by git commit et al
export EDITOR

export XML_CATALOG_FILES="$HOMEBREW_PREFIX/etc/xml/catalog"  # for DocBook

BREW_RUBY="$HOMEBREW_PREFIX/opt/ruby"
if [ -d "$BREW_RUBY" ]; then
	export PATH="$BREW_RUBY/bin:$PATH"
	export LDFLAGS="-L$BREW_RUBY/lib"
	export CPPFLAGS="-I$BREW_RUBY/include"
	export PKG_CONFIG_PATH="$BREW_RUBY/lib/pkgconfig"
fi

# Ensure we can find brew-installed node, but also that it doesn't override the
# path to a later version of npm that we upgraded ourselves.
BREW_NODE="$HOMEBREW_PREFIX/opt/node@18/bin"
if [ -d "$BREW_NODE" ]; then
	export PATH="$PATH:$BREW_NODE"
fi

# TODO: Only if fzf is installed
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d'
