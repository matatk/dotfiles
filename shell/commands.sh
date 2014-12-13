# Standard UNIX commands
alias  ls='gls --color=auto'
alias   l='gls --color=auto -CF'
alias  la='gls --color=auto -a'
alias  ll='gls --color=auto -l'
alias lal='gls --color=auto -la'
alias  lh='gls --color=auto -lh'
alias lah='gls --color=auto -lha'
alias  lo='/bin/ls -lhaO'   # OS X flags
alias loa='/bin/ls -lhaO@'  # OS X flags and extended attributes
alias loc='/bin/ls -lhaOe'  # OS X flags and ACLs
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Useful du shortcut
alias ud='du -sch *'

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
	_mdpretty $@ --no-wrap
}

function _mdpretty() {
	if [[ $# -eq 0 || $# -eq 1 && $1 == '--no-wrap' ]]; then
		echo No file specified
		return
	fi

	if [[ $# -gt 1 && $2 != '--no-wrap' ]]; then
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
