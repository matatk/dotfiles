# Standard UNIX commands
alias l='ls -CF'
alias ll='ls -l'
alias lh='ls -lh'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

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
