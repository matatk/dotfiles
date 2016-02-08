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
alias tl='tree -ps'
alias th='tree -psh'
alias ta='tree -a'
alias tal='tree -aps'
alias tah='tree -apsh'

# Redo the 'Open With' menu on OS X
alias fixowmenu='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Start a Jekyll auto-rebuilding server in the current directory
alias jt='jekyll serve --watch --host $(hostname)'

# vmware fusion
alias vmware-vdiskmanager="/Applications/VMware\ Fusion.app/Contents/Library/vmware-vdiskmanager"

# cat and speak the contents of a file
function cs() {
	cat $1 && say -f $1
}

# Tell the story of a TDD project through the medium of commits
function tddh() {
	git log | grep '\(RED\|REFACTOR\)' | tail -r
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

# Homebrew reverse dependencies
function rdeps() {
	first=true
	without=()
	for package in `brew list`; do
		rdeps=`brew uses --recursive --installed $package`
		if [[ $rdeps != '' ]]; then
			if $first; then
				first=false
			else
				echo
			fi
			echo "Reverse dependencies for: $package..."
			echo $rdeps
		else
			without+=("$package")
		fi
	done
	echo
	echo Packages without rdeps...
	for package in ${without[@]}; do
		echo "    $package"
	done
}

# Homebrew update, cleanup and check
alias brewup='\
	echo Updating... && brew update && echo \
	&& echo Outdated: && brew outdated'
alias brewdo='\
	echo Upgrading... && brew upgrade && echo \
	&& echo Linking Applications... && brew linkapps && echo \
	&& echo Cleaning up... && brew cleanup -s && echo \
	&& echo Checking... && brew doctor'
alias brewall='brewup && echo && brewdo'

# node listing stuff
# https://gist.github.com/yyx990803/6045243
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# Add a file to an existing MacVim tab
alias mvt='mvim --remote-tab'

# Remove Xcode clart
# http://stackoverflow.com/a/18933476
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

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

#that's some old shit
function __clean-cask {
	caskBasePath="/opt/homebrew-cask/Caskroom"
	local cask="$1"
	local caskDirectory="$caskBasePath/$cask"
	local versionsToRemove="$(ls -r $caskDirectory | sed 1,1d)"
	if [[ -n $versionsToRemove ]]; then
		while read versionToRemove ; do
			echo "Removing $cask $versionToRemove..."
			rm -rf "$caskDirectory/$versionToRemove"
		done <<< "$versionsToRemove"
	fi
}

#call this command to cleanup all, or you can specify cask name
	function cask-retire {
	if [[ $# -eq 0 ]]; then
		while read cask; do
			__clean-cask "$cask"
		done <<< "$(brew cask list)"
	else
		clean-cask "$1"
	fi
}
