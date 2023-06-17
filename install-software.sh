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

CROSS_PLAT_UTILS='direnv fd fish fortune fzf hyperfine rename ripgrep rpl shellcheck tree'

on_platform Darwin 'Shells & Utilities' \
	"brew install bash-completion bat coreutils fisher node@18 python@3.11 mas z $CROSS_PLAT_UTILS" \
	'brew install --cask caffeine colour-contrast-analyser firefox github google-chrome kitty macdown homebrew/cask-fonts' \
	'brew install --cask font-fira-code-nerd-font'

on_platform Linux 'Utilities' \
	"sudo apt install nodejs python3 rust-bat $CROSS_PLAT_UTILS"

if_test 'command -v pip3' 'Python linter' \
	'pip3 install flake8'

if_test 'command -v gem' 'Ruby package manager' \
	'gem install bundler'

if_test 'command -v npm' 'Important JavaScript utilities' \
	'npm install -g bash-language-server colour-contrast-cli eclint eslint http-server json-diff jsonlint npm npm-check package-json-validator stylelint stylelint-config-standard typescript'

echo 'Software installations complete.'
