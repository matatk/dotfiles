# Standard UNIX commands
function make_ls_aliases() {
	alias  ls="$1ls --color=auto"
	alias   l="$1ls --color=auto -CF"
	alias  la="$1ls --color=auto -a"
	alias  ll="$1ls --color=auto -l"
	alias lal="$1ls --color=auto -la"
	alias  lh="$1ls --color=auto -lh"
	alias lah="$1ls --color=auto -lha"
}

if [ $(uname -s) = 'Darwin' ]; then
	make_ls_aliases g
	alias  lo='/bin/ls -lhaO'   # OS X flags
	alias loe='/bin/ls -lhaO@'  # OS X flags and extended attributes
	alias loa='/bin/ls -lhaOe'  # OS X flags and ACLs
else
	make_ls_aliases
fi
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Useful du shortcut
alias ud='du -sch *'

# Trees!
alias t='tree'
alias td='tree -d'
alias tl='tree -ps'
alias th='tree -psh'
alias ta='tree -a'
alias tal='tree -aps'
alias tah='tree -apsh'
alias tahng='tree -apsh -I .git'
alias tahnng='tree -apsh -I "node_modules|.git"'
alias tng='tree -I .git'
alias tngd='tree -I .git -d'
alias tnn='tree -I node_modules'
alias tnnd='tree -I node_modules -d'
alias tnng='tree -I "node_modules|.git"'
alias tnngd='tree -I "node_modules|.git" -d'

# Quicker git stuff
alias gl='git log'
alias glo='git log --oneline'
alias glod='git log --oneline --shortstat'
alias gla='git log --all --decorate --oneline --graph'  # https://stackoverflow.com/a/35075021
alias gst='git status'
alias gft="git grep -Ei 'TODO|FIXME'"
alias gds='git diff --stat'
alias gdsm='gds master'

# Where is a command/binary defined/located?
alias cv='command -v'

alias slt='stylelint --config-basedir /usr/local/lib/node_modules/stylelint/'

# DooM
[ $(uname -s) = 'Darwin' ] && alias gzdoom='/Applications/GZDoom.app/Contents/MacOS/gzdoom'
alias lswad='ls ~/Library/Application\ Support/gzdoom/'
alias twad='tah /Volumes/Extension/Extra/Games/DooM/WADs'
alias doom='gzdoom -iwad doom'
alias doom2='gzdoom -iwad doom2'
alias udoom1coop='doom -private -host 2 -skill 4 -iwad doom'
alias sigil='doom -file sigil_v1_21'
alias sigilcoop='doom -private -host 2 -skill 4 -iwad doom -file sigil'
alias eviternity='doom2 -file Eviternity'
alias verdant-citadel='doom2 -file vercit.pk3'
alias paradise='doom2 -file t-paradise-v2.pk3'
alias sunlust='doom2 -file sunlust'
alias ancient-aliens='doom2 -file aaliens'
alias tech-gone-bad='doom -file e1m8b'
alias alien-vendetta='doom2 -file av -deh av'
alias eternal-doom='doom2 -file eternall'
alias eternal-doom-cybersweeper='doom2 -file eternall -file csweeper -warp 1'
alias eternal-doom-credits='doom2 -file eternall -file credits -warp 1'
alias eternal-doom-4='doom2 -file ed4_rfo1 -warp 8'
alias tnt-evilution='gzdoom -iwad tnt'
alias plutonia='gzdoom -iwad plutonia'
alias plutonia-2='plutonia -file pl2 -deh pl2'
alias pl2='plutonia-2'
alias back-to-saturn-x='doom2 -file btsx_e1a -file btsx_e1b'
alias btsx='back-to-saturn-x'
alias deus-vult='doom2 -file dv -warp 5'

alias renpm='rm -rf package-lock.json node_modules && npm install'

# For devving
alias ogd='open . -a Github\ Desktop'
alias orm='open README.md -a MacDown'
alias chsbs='mvim -U ~/.gvimrc.fullscreen -p *.c -c "tabdo vsp %<.h | windo set nowrap"'
alias hcsbs='mvim -U ~/.gvimrc.fullscreen -p *.h -c "set splitright | tabdo vsp %<.c | windo set nowrap"'
alias mkcompdb='make clean && intercept-build make && cat compile_commands.json'

# Redo the 'Open With' menu on OS X
# FIXME no longer needed?
alias fixowmenu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Shorter versions
alias jt='bundle exec jekyll serve --drafts --incremental'
alias karabiner="/Applications/Karabiner.app/Contents/Library/bin/karabiner"

# Homebrew update, cleanup and check
alias brewupdate="brew --version && echo && echo 'Updating...' && brew update && echo && brew --version && echo && echo 'Outdated:' && brew outdated && echo && echo 'Outdated casks:' && brew cask outdated"
alias brewupgrade="echo 'Upgrading...' && brew upgrade && echo && echo 'Cleaning up...' && brew cleanup -s && echo && echo 'Checking...' && brew doctor ; echo && echo 'Note: use brewcaskupgrade to upgrade casks.'"
alias brewup="brewupdate && echo && brewupgrade"
alias brewcaskupgrade="echo \"run brewupdate first if it's not already been run\" && echo && brew cask outdated | cut -f1 | xargs brew cask upgrade"
alias brew-leave-developer-mode='git config -f /usr/local/Homebrew/.git/config homebrew.devcmdrun false && brew update --force'

# NPM package listing stuff
# https://gist.github.com/yyx990803/6045243
alias npml="npm list --depth=0 2>/dev/null"

# Add a file to an existing MacVim tab
alias mvt='mvim --remote-tab'

# Remove Xcode clart
# http://stackoverflow.com/a/18933476
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

# Use the same flake8 settings on the command-line as in ViM
alias f8='flake8 --ignore="W191,E117,W503"'

# Clean Python clart from current dir and below
alias cpc='find . -name __pycache__ -exec rm -rfv {} \;'

# Linter rule-lookup commands
function rle() {
	open "https://eslint.org/docs/rules/$1"
}
function rls() {
	open "https://stylelint.io/user-guide/rules/$1"
}
function rlsc() {
	open "https://github.com/koalaman/shellcheck/wiki/SC$1"
}

# Simple searching for text strings
function search() {
	grep -ir $@ .
}
function searchnn() {
	grep --exclude-dir=node_modules --exclude-dir=.nyc_output -ir $@ .
}

function catsay() {
	cat $1 && say -f $1
}
alias cs=catsay

function firefox-for-add-on-developers() {
	if [ "$1" -gt 1 ] && [ "$1" -lt 99 ]; then
		open "https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Releases/$1#Changes_for_add-on_developers"
	fi
}

# Prettify a markdown file
function mdpretty() {
	_mdpretty $@
}
function nmdpretty() {
	_mdpretty $@ --wrap=none
}
function _mdpretty() {
	if [[ ! -x `which pandoc` ]]; then
		echo Cannot execute Pandoc!
		return
	fi

	if [[ $# -eq 0 || $# -eq 1 && $1 == '--wrap=none' ]]; then
		echo No file specified
		return
	fi

	if [[ $# -gt 1 && $2 != '--wrap=none' ]]; then
		echo Does not support multiple files
		return
	fi

	if [[ -f $1 ]]; then
		cat "$1" | pandoc -t markdown -o "$1" $2
		cat "$1"
	else
		echo "$1" is not a file
	fi
}

# Tidy a snippet of HTML that was placed on the clipboard
function tidysnippet() {
	CORE_TIDY='pbpaste | tidy --indent auto --indent-spaces 4 --wrap 0 --show-body-only yes'
	echo 'Tidying:'
	pbpaste | cat
	echo
	echo
	eval $CORE_TIDY
	RETVAL=$?
	echo
	if [ ! $RETVAL -eq 2 ]; then
		eval $CORE_TIDY 2>/dev/null | pbcopy
		echo 'The above result of tidy is now on the clipboard.'
		if [ $RETVAL -eq 1 ]; then
			echo
			echo 'Note: there were warnings from tidy (but no errors).'
		fi
	else
		echo 'There was an error calling tidy; clipboard unchanged.'
	fi
}

function aliases() {
	alias | sed -e 's/^alias *//' | sort | sed -e 's/=/Ω/' | column -t -sΩ
}
