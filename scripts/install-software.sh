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

gp Darwin 'brew install bash-completion coreutils direnv fortune macvim mas node@14 python rename rpl ruby shellcheck tree zsh'

gp Darwin 'brew install --cask caffeine firefox github google-chrome iterm2 macdown meld spotify'

gp Darwin 'brew install --cask libreoffice'

gp Linux 'sudo apt install direnv rename rpl shellcheck tree zsh'

gt 'command -v pip3' 'pip3 install flake8'

gt 'command -v gem' 'gem install bundler'

gt 'command -v npm' 'npm install -g eclint eslint jsonlint npm npm-check package-json-validator stylelint stylelint-config-standard'

echo Software installations complete.
