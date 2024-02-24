#!/bin/bash
core() {
	pretty=$1
	shift
	echo "$pretty:"
	for cmd in "$@"; do
		echo "> $cmd"
	done
	if [ $# -gt 1 ]; then
		these_commands=' these commands'
	fi
	read -rp "Run$these_commands (y/n)? " -n 1
	echo
	if [ "$REPLY" = 'y' ]; then
		echo
		for cmd in "$@"; do
			$cmd
		done
		echo
	fi
	echo
}

on_platform() {
	platform=$1
	shift
	if [ "$(uname -s)" = "$platform" ]; then
		core "$@"
	fi
}

if_test() {
	test_cmd=$1
	shift
	if $test_cmd > /dev/null; then
		core "$@"
	fi
}

CROSS_PLAT_UTILS='direnv fd fish fortune fzf hyperfine jq rename ripgrep sd shellcheck tree'

on_platform Darwin 'Shells & Utilities' \
	"brew install bat coreutils fisher node@20 mas $CROSS_PLAT_UTILS" \
	'brew install --cask caffeine colour-contrast-analyser firefox github google-chrome kitty macdown homebrew/cask-fonts' \
	'brew install --cask font-fira-code-nerd-font'

on_platform Linux 'Utilities' \
	"sudo apt install nodejs rust-bat $CROSS_PLAT_UTILS"

if_test 'command -v npm' 'JavaScript utilities' \
	'npm install -g colour-contrast-cli http-server json-diff jsonlint npm npm-check npm-check-updates package-json-validator'

echo 'Software installations complete.'
