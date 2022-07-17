if [ -r "$DOTFILES/shell/local-startup-sequence.sh" ]; then
	source "$DOTFILES/shell/local-startup-sequence.sh"
fi

command -v fortune > /dev/null && fortune
