#
# Standard UNIX commands
#

# Where is a command/binary defined/located?
alias cv='command -v'

function aliases() {
	alias | sed -e 's/^alias *//' | sort | sed -e 's/=/Ω/' | column -t -sΩ
}

# shellcheck disable=SC2139
# (Directive must come after another command, or applies to whole file.)
function make_ls_aliases() {
	alias  ls="$1ls --color=auto"
	alias   l="$1ls --color=auto -CF"
	alias  la="$1ls --color=auto -a"
	alias  ll="$1ls --color=auto -l"
	alias lal="$1ls --color=auto -la"
	alias  lh="$1ls --color=auto -lh"
	alias lah="$1ls --color=auto -lha"
}

if [ "$(uname -s)" = 'Darwin' ]; then
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


#
# Trees!
#

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


#
# Quicker git stuff
#

alias gl='git log'
alias glo='git log --oneline'
alias glod='git log --oneline --shortstat'
alias gla='git log --all --decorate --oneline --graph'  # https://stackoverflow.com/a/35075021
alias gst='git status'
alias gf="git grep -Ei '\WFIXME\W'"
alias gft="git grep -Ei '\W(FIXME|TODO)\W'"
alias gftn="git grep -Ei '\W(FIXME|TODO|NOTE)\W'"
alias gds='git diff --stat'
alias gdsm='gds master'


#
# Custom commands
#

# Simple searching for text strings
function search() {
	grep -ir "$@" .
}
function searchnn() {
	grep --exclude-dir=node_modules --exclude-dir=.nyc_output -ir "$@" .
}

function catsay() {
	cat "$1" && say -f "$1"
}
alias cs=catsay

# Prettify a markdown file
function mdpretty() {
	_mdpretty "$@"
}
function nmdpretty() {
	_mdpretty "$@" --wrap=none
}
function _mdpretty() {
	# TODO: Don't pass in --wrap=none as there's no point (DRY)
	if [[ ! -x $(which pandoc) ]]; then
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
		# FIXME: negate the need for this
		# shellcheck disable=SC2002
		cat "$1" | pandoc -t markdown -o "$1" "$2"
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
	eval "$CORE_TIDY"
	RETVAL=$?
	echo
	if [ ! $RETVAL -eq 2 ]; then
		eval "$CORE_TIDY" 2>/dev/null | pbcopy
		echo 'The above result of tidy is now on the clipboard.'
		if [ $RETVAL -eq 1 ]; then
			echo
			echo 'Note: there were warnings from tidy (but no errors).'
		fi
	else
		echo 'There was an error calling tidy; clipboard unchanged.'
	fi
}

function pretty_tsv {
    column -t -s $'\t'
}
alias ptsv=pretty_tsv

# Shorter versions
alias jt='bundle exec jekyll serve --drafts --incremental'
alias karabiner="/Applications/Karabiner.app/Contents/Library/bin/karabiner"


#
# Package management
#

# Homebrew update and upgrade
# TODO: Only define if using brew?
alias brewup='brew --version && echo && brew update && echo && brew --version && echo && brew outdated && echo && brew upgrade'
# can use brew autoremove to uninstall unused packages
# can use brew doctor to check for problems
# can use brew cleanup -s to remove all downloads (incl. latest non-installed)


#
# General development
#

alias slt='stylelint --config-basedir /usr/local/lib/node_modules/stylelint/'
alias ogd='open . -a Github\ Desktop'
alias orm='open README.md -a MacDown'
alias mvt='mvim --remote-tab'

# C/C++
alias chsbs='mvim -U ~/.gvimrc.fullscreen -p *.c -c "tabdo vsp %<.h | windo set nowrap"'
alias hcsbs='mvim -U ~/.gvimrc.fullscreen -p *.h -c "set splitright | tabdo vsp %<.c | windo set nowrap"'
alias mkcompdb='make clean && intercept-build make && cat compile_commands.json'

# NPM
# https://gist.github.com/yyx990803/6045243
alias npml="npm list --depth=0 2>/dev/null"
alias renpm='rm -rf package-lock.json node_modules && npm install'

# Use the same flake8 settings on the command-line as in ViM
# This also ignores a standardly-named virtualenv directory
alias f8='flake8 --ignore="W191,E117,W503" --exclude .venv'

# Clean Python clart from current dir and below (but not potentially .venv)
alias cpc='find * -name __pycache__ -exec rm -rfv {} \;'

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

function firefox-for-add-on-developers() {
	if [ "$1" -gt 1 ] && [ "$1" -lt 99 ]; then
		open "https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Releases/$1#Changes_for_add-on_developers"
	fi
}
