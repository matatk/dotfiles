if [ -r ~/dotfiles/shell/local-startup-sequence.sh ]; then
	source ~/dotfiles/shell/local-startup-sequence.sh
fi

command -v fortune > /dev/null && fortune
