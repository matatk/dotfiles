alias l='ls -CF'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -A'
export CLICOLOR=1
export LSCOLORS=exgxfxdxcxGxDxabagacad

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export GREP_OPTIONS='--color=auto'

export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# misc commands
alias fixowmenu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
alias jt='jekyll serve --watch --host obviate.local'
catsay() {
	cat $1 && say -f $1
}
alias cs=catsay

# unison
LHN=$(hostname -s)
if [ $LHN != 'obfuscated' ]; then
	export UNISONLOCALHOSTNAME='obtuse'
else
	export UNISONLOCALHOSTNAME=$LHN
fi

# home/bin and homebrew
export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi
. <(npm completion)

# vmware fusion
alias vmware-vdiskmanager="/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager"

PS1="\[\033[0;1;32m\]\u@\h:\[\033[0;1;34m\]\w\[\033[0;1;33m\]\$ \[\033[0m\]"
