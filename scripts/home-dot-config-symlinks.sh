#!/bin/sh
for thing in dot-config/*; do
	base=$(basename "$thing")
	if [ ! -e "$HOME/.config/$base" ]; then
		ln -vs "$HOME/dotfiles/dot-config/$base" ~/.config
	fi
done
