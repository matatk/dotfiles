#!/bin/bash
gr() {
	COMMAND=$1
	read -rp "Would you like to run: $COMMAND (y/n)? " -n 1
	echo
	if [ "$REPLY" = 'y' ]; then
		$COMMAND
	fi
}

gp() {
	PLATFORM=$1
	INSTALL_CMD=$2
	if [ "$(uname -s)" = "$PLATFORM" ]; then
		gr "$INSTALL_CMD"
		echo
	fi
}

gt() {
	TEST_CMD=$1
	INSTALL_CMD=$2
	if $TEST_CMD > /dev/null; then
		gr "$INSTALL_CMD"
		echo
	fi
}

gp Darwin 'brew install zsh bash-completion coreutils tree rename rpl python node@14 ruby macvim shellcheck direnv fortune'

gp Darwin 'brew install --cask cd-to caffeine spotify macdown meld github google-chrome firefox'

gp Darwin 'brew install --cask libreoffice'

gp Linux 'sudo apt install zsh tree rename rpl shellcheck direnv'

gt 'command -v pip3' 'pip3 install flake8'

gt 'command -v gem' 'gem install bundler'

gt 'command -v npm' 'npm install -g npm npm-check eslint jsonlint package-json-validator eclint stylelint stylelint-config-standard'

echo Software installations complete.
