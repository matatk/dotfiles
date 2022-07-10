#!/bin/sh
create() {
	echo "Creating $DEST_DIR_PRETTY symlinks"
	for thing in "$SRC_DIR"/*; do
		base=$(basename $thing)
		full_dest="$DEST_DIR/$base"
		if [ ! -e $full_dest ]; then
			ln -vs "$thing" $DEST_DIR
		else
			echo "EXISTS; SKIPPING: $full_dest"
		fi
	done
}

clean() {
	echo "Cleaning $DEST_DIR_PRETTY symlinks"
	for thing in "$SRC_DIR"/*; do
		base=$(basename "$thing")
		full_dest="$DEST_DIR/$base"
		if [ -h $full_dest ]; then
			rm -v $full_dest
		else
			if [ -e $full_dest ]; then
				echo "NON-LINK; SKIPPING: $full_dest"
			else
				echo "Doesn't exist; skipping: $full_dest"
			fi
		fi
	done
}

USAGE="Usage: $(basename $0) <source-dir> <destination-dir> <create|clean>"

if [ -d "$1" ]; then
	SRC_DIR=$(realpath $1)
else
	echo $USAGE
	echo "$1 is not a directory"
	exit 42
fi

if [ -d "$2" ]; then
	DEST_DIR=$(realpath $2)
else
	echo $USAGE
	echo "$2 is not a directory"
	exit 42
fi

DEST_DIR_PRETTY=$(basename $DEST_DIR)

case "$3" in
	"create")
		create
		;;
	"clean")
		clean
		;;
	*)
		echo $USAGE
		if [ "$1" ]; then
			echo "Action \"$1\" is not valid"
		fi
		exit 42
esac

echo
