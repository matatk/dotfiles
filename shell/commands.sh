# Standard UNIX commands
alias  ls='gls --color=auto'
alias   l='gls --color=auto -CF'
alias  la='gls --color=auto -a'
alias  ll='gls --color=auto -l'
alias lal='gls --color=auto -la'
alias  lh='gls --color=auto -lh'
alias lah='gls --color=auto -lha'
alias  lo='/bin/ls -lhaO'   # OS X flags
alias loe='/bin/ls -lhaO@'  # OS X flags and extended attributes
alias loa='/bin/ls -lhaOe'  # OS X flags and ACLs
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
alias tng='tree -I .git'
alias tngd='tree -I .git -d'
alias tnn='tree -I node_modules'
alias tnnd='tree -I node_modules -d'
alias tnng='tree -I "node_modules|.git"'
alias tnngd='tree -I "node_modules|.git" -d'

# Quicker git stuff
alias gl='git log'
alias glo='git log --oneline'
alias gla='git log --all --decorate --oneline --graph'  # https://stackoverflow.com/a/35075021
alias gst='git status'
alias gft="git grep -Ei 'TODO|FIXME'"

# Where is a command/binary defined/located?
alias cv='command -v'

alias slt='stylelint --config-basedir /usr/local/lib/node_modules/stylelint/'

# Redo the 'Open With' menu on OS X
alias fixowmenu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Shorter versions
alias jt='bundle exec jekyll serve --drafts --incremental'
alias karabiner="/Applications/Karabiner.app/Contents/Library/bin/karabiner"

# Homebrew update, cleanup and check
alias brewup='\
	brew --version && echo && \
	echo Updating... && brew update && echo && \
	brew --version && echo  && \
	echo Outdated: && brew outdated'
alias brewdo='\
	echo Upgrading... && brew upgrade && echo && \
	echo Cleaning up... && brew cleanup -s && echo && \
	echo Checking... && brew doctor && echo && \
	echo Note: brew cask app upgrades are manual.'
alias brewall='brewup && echo && brewdo'
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

# Linter rule-lookup commands
function rle() {
	open "https://eslint.org/docs/rules/$1"
}
function rls() {
	open "https://stylelint.io/user-guide/rules/$1"
}
function rlsc() {
	open "https://github.com/koalaman/shellcheck/wiki/$1"
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
