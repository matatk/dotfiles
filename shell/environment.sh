PREFIX=`brew --prefix`
export PATH=$HOME/bin:$PREFIX/bin:$PATH
export EDITOR=`which vim`  # used by git commit et al
export XML_CATALOG_FILES="$PREFIX/etc/xml/catalog"  # for DocBook
source $PREFIX/opt/autoenv/activate.sh
