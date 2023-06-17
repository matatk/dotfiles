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
	alias ls="$1ls --color=auto"
	alias  h="$1ls --color=auto -lh"
	alias  a="$1ls --color=auto -lha"
	alias  l="$1ls --color=auto -l"
	alias al="$1ls --color=auto -la"
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

alias bat='bat --tabs 4'
alias  b='bat --tabs 4 -pp'
alias bn='bat --tabs 4 -nP'
alias  c='clear && bat --tabs 4 -pp'
alias cn='clear && bat --tabs 4 -nP'


#
# Trees!
#

alias t='tree -hI node_modules'
alias ta='tree -ahI "node_modules|.git"'
alias td='t -d'
alias tad='ta -d'

alias T='tree -h --gitignore -I .git'
alias Ta='tree -ah --gitignore -I .git'
alias Td='T -d'
alias Tad='Ta -d'


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
alias gdsm='gds main'

# FIXME: These are case-insensitive; should the new ones be?
# FIXME: What about colons?
function gftc() {
	echo "$(git grep -Ei '\WFIXME\W' | wc -l) FIXMEs"
	echo "$(git grep -Ei '\WTODO\W' | wc -l) TODOs"
}

# FIXME: These are case-insensitive; should the new ones be?
# FIXME: What about colons?
function gftnc() {
	echo "$(git grep -Ei '\WFIXME\W' | wc -l) FIXMEs"
	echo "$(git grep -Ei '\WTODO\W' | wc -l) TODOs"
	echo "$(git grep -Ei '\WNOTE\W' | wc -l) NOTEs"
}


#
# Text searching and editing
#

alias rgi='rg -i'


#
# Custom commands
#

alias icat='kitty +kitten icat'
alias f='kitty --single-instance --start-as fullscreen'

function ffp() {
	fzf \
		--preview 'bat --style=numbers --color=always --line-range :500 {}' \
		--preview-window "$(($COLUMNS - 35))"
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
		# The following is needed becuase --wrap=none must not be in quotes
		# shellcheck disable=SC2086
		cat "$1" | pandoc -t markdown -o "$1" $2
		cat "$1"
	else
		echo "$1" is not a file
	fi
}

function pretty_tsv {
    column -t -s $'\t'
}
alias ptsv=pretty_tsv


#
# Package management
#

# FIXME: Only define if using brew?
alias brewup='brew update && brew upgrade'
# can use brew autoremove to uninstall unused packages
# can use brew doctor to check for problems
# can use brew cleanup -s to remove all downloads (incl. latest non-installed)


#
# Development
#

alias jt='bundle exec jekyll serve --drafts --incremental'
alias ogd='open . -a Github\ Desktop'
alias orm='open README.md -a MacDown'
alias om='open -a MacDown'

# https://gist.github.com/yyx990803/6045243
alias npml="npm list --depth=0 2>/dev/null"
alias renpm='rm -rf package-lock.json node_modules && npm install'

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
	open "https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Releases/$1#Changes_for_add-on_developers"
}
