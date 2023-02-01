if [ -r "$DOTFILES/shell/local-startup-sequence.sh" ]; then
	source "$DOTFILES/shell/local-startup-sequence.sh"
fi

if [ -r "/usr/local/etc/profile.d/z.sh" ]; then
	source /usr/local/etc/profile.d/z.sh
fi

command -v fortune > /dev/null && fortune
