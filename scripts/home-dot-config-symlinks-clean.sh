#!/bin/sh
echo Removing symlinks in ~/.config/...
for thing in ~/.config/*; do
	if [ -h "$thing" ]; then
		echo "$thing"
		rm "$thing"
	fi
done
