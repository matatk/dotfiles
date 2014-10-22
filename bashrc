source ~/dotfiles/my-environment.sh
source ~/dotfiles/my-colours.sh
source ~/dotfiles/my-commands.sh

# Homebrew
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi
. <(npm completion)

PS1="\[\033[0;1;32m\]\u@\h:\[\033[0;1;34m\]\w\[\033[0;1;33m\]\$ \[\033[0m\]"
