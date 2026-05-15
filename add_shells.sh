#!/bin/bash
function check_shell() {
	local shell="$1"
	local path=
	if path=$(command -v "$shell") && [[ -n $path ]]; then
		if ! grep "$path" /etc/shells > /dev/null; then
			echo "command -v $path | sudo tee -a /etc/shells"
			command -v "$path" | sudo tee -a /etc/shells
		else
			echo "$shell is already a chshable shell"
		fi
	else
		echo "$shell does not exist"
	fi
}

for proposed_shell in "$@"; do
	check_shell "$proposed_shell"
done
