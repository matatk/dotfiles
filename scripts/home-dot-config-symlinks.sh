#!/bin/sh
create() {
	echo "Creating ~/.config symlinks"
	for thing in dot-config/*; do
		base=$(basename "$thing")
		target_dir="$HOME/.config/$base"
		if [ ! -e $target_dir ]; then
			ln -vs "$HOME/dotfiles/dot-config/$base" ~/.config
		else
			echo "$target_dir already exists; skipping"
		fi
	done
}

clean() {
	echo "Cleaning ~/.config symlinks"
	for thing in dot-config/*; do
		base=$(basename "$thing")
		target_dir="$HOME/.config/$base"
		if [ -e $target_dir ]; then
			if [ -h $target_dir ]; then
				rm -v $target_dir
			else
				echo "$target_dir is not a symlink; not removing"
			fi
		else
			echo "$target_dir already does not exist in ~/.config"
		fi
	done
}

case "$1" in
	"create")
		create
		;;
	"clean")
		clean
		;;
	*)
		if [ "$1" ]; then
			echo "Action \"$1\" is not valid"
		fi
		echo "Usage: $(basename $0) <create|clean>"
		exit 42
esac
echo
