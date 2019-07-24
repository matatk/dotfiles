PREFIX=`brew --prefix`
export PATH=$HOME/bin:$PREFIX/bin:$PREFIX/sbin:$PATH
export EDITOR=`which vim`                           # used by git commit et al
export XML_CATALOG_FILES="$PREFIX/etc/xml/catalog"  # for DocBook

if [ -d ~/perl5 ]; then
	PATH="$HOME/perl5/bin${PATH:+:${PATH}}"; export PATH;
	PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
	PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
	PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
	PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;
fi

export PATH="/usr/local/opt/node@10/bin:$PATH"
alias npm='/usr/local/bin/npm'  # because it always installs here

export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

if [ -r ~/projects/emsdk/emsdk_env.sh ]; then
	source ~/projects/emsdk/emsdk_env.sh > /dev/null
fi

export PATH="$HOME/.cabal/bin:$PATH"
