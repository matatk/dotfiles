#!/bin/sh
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

install_fira_code_font() {
	brew tap homebrew/cask-fonts && brew install --cask font-fira-code
}

gp Darwin install_fira_code_font

gp Darwin 'brew install bash-completion coreutils direnv fd fortune mas node@16 python rename ripgrep rpl ruby shellcheck tree zsh'

gp Darwin 'brew install --cask caffeine colour-contrast-analyser firefox github google-chrome kitty macdown macvim meld microsoft-edge rectangle spotify'

gp Darwin 'brew install --cask libreoffice'

gp Linux 'sudo apt install direnv fd rename ripgrep rpl shellcheck tree zsh'

gt 'command -v pip3' 'pip3 install flake8'

gt 'command -v gem' 'gem install bundler'

gt 'command -v npm' 'npm install -g bash-language-server colour-contrast-cli eclint eslint http-server json-diff jsonlint npm npm-check package-json-validator stylelint stylelint-config-standard typescript'

echo Software installations complete.
