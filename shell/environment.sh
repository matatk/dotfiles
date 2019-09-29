if [ $(uname -s) = 'Darwin' ]; then
	PREFIX=`brew --prefix`
	export PATH=$PREFIX/bin:$PREFIX/sbin:$PATH
fi
export PATH=$HOME/bin:$PATH
export EDITOR=`which vim`                           # used by git commit et al
export XML_CATALOG_FILES="$PREFIX/etc/xml/catalog"  # for DocBook

if [ -d ~/perl5 ]; then
	PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
	PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
	PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
	PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
	PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

BREW_RUBY='/usr/local/opt/ruby'
if [ -d $BREW_RUBY ]; then
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
BREW_NODE10='/usr/local/opt/node@10/bin'
if [ -d $BREW_NODE10 ]; then 
	export PATH="$BREW_NODE10:$PATH"
fi

BREW_NPM='/usr/local/bin/npm'
[ -x $BREW_NPM ] && alias npm=$BREW_NPM
