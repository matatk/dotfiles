PREFIX=`brew --prefix`

export PATH=$HOME/bin:$PREFIX/bin:$PREFIX/sbin:$PATH
export EDITOR=`which vim`                           # used by git commit et al
export XML_CATALOG_FILES="$PREFIX/etc/xml/catalog"  # for DocBook

source $PREFIX/opt/autoenv/activate.sh

if [ -d ~/perl5 ]; then
	PATH="/Users/matatk/perl5/bin${PATH:+:${PATH}}"; export PATH;
	PERL5LIB="/Users/matatk/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
	PERL_LOCAL_LIB_ROOT="/Users/matatk/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
	PERL_MB_OPT="--install_base \"/Users/matatk/perl5\""; export PERL_MB_OPT;
	PERL_MM_OPT="INSTALL_BASE=/Users/matatk/perl5"; export PERL_MM_OPT;
fi
