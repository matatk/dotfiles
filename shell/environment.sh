if [ $(uname -s) = 'Darwin' ]; then
	[ -x /usr/local/bin/brew ] && eval $(/usr/local/bin/brew shellenv)
	[ -x /opt/homebrew/bin/brew ] && eval $(/opt/homebrew/bin/brew shellenv)
fi
export PATH=$HOME/bin:$PATH
export EDITOR=`which vim`                           # used by git commit et al
export XML_CATALOG_FILES="$HOMEBREW_PREFIX/etc/xml/catalog"  # for DocBook

if [ -d ~/perl5 ]; then
	PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
	PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
	PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
	PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
	PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

BREW_RUBY="$HOMEBREW_PREFIX/opt/ruby"
if [ -d "$BREW_RUBY" ]; then
	export PATH="$BREW_RUBY/bin:$PATH"
	export LDFLAGS="-L$BREW_RUBY/lib"
	export CPPFLAGS="-I$BREW_RUBY/include"
	export PKG_CONFIG_PATH="$BREW_RUBY/lib/pkgconfig"
fi

# There's an ~/.emscripten file that is a Python script that contains the
# full path to the EMSDK node version
if [ -r ~/projects/emsdk/emsdk_env.sh ]; then
	. ~/projects/emsdk/emsdk_env.sh > /dev/null
fi

# Emscripten has its own node but we want to ensure ours comes first
BREW_NODE="$HOMEBREW_PREFIX/opt/node@14/bin"
if [ -d "$BREW_NODE" ]; then
	export PATH="$BREW_NODE:$PATH"
fi

BREW_NPM="$BREW_PREFIX/bin/npm"
[ -x "$BREW_NPM" ] && alias npm="$BREW_NPM"
