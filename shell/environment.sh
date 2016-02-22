export PATH=$HOME/bin:$PREFIX/bin:$PREFIX/sbin:$PATH
export EDITOR=`which vim`  # used by git commit et al
export XML_CATALOG_FILES="$PREFIX/etc/xml/catalog"  # for DocBook

PREFIX=`brew --prefix`
source $PREFIX/opt/autoenv/activate.sh
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Perlbrew
if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi
