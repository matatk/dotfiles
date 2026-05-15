# Pre-requisites: Git and Make
# Optional pre-requisite: ShellCheck

# TODO:
# - Is coreutils already installed on Debian? Fedora?

DOTFILES := $(HOME)/.dotfiles
SYS := $(shell uname -s)
BREW := /opt/homebrew/bin/brew
BREW_EXECUTABLE := $(shell test -x $(BREW) && echo 'yes' || echo 'no')
STOW := $(shell test -x /usr/bin/stow \
	&& echo /usr/bin/stow \
	|| echo /opt/homebrew/bin/stow)
NPM := $(shell test -x /opt/homebrew/bin/npm \
	&& echo /opt/homebrew/bin/npm \
	|| echo /usr/bin/npm)

.PHONY: \
	all \
	check-dir \
	check-not-fish \
	clean \
	clean-symlinks \
	deepclean \
	kinesis \
	software \
	symlinks \
	test

# The following section is written by packages.pl, in accordance with packages.csv
# PACKAGES_BLOCK_START
DEBIAN_BIN_PKGS := bat coreutils curl fd-find fish fortune hx jq nodejs npm ripgrep sd shellcheck node-sort-package-json stow tree tsx node-typescript
DEBIAN_NPM_PKGS := npm-check-updates typescript-language-server vscode-langservers-extracted@4.8.0

FEDORA_BIN_PKGS := 
FEDORA_NPM_PKGS := npm-check-updates sort-package-json tsx typescript typescript-language-server vscode-langservers-extracted@4.8.0

HOMEBREW_BIN_PKGS := bat caffeine coreutils dua-cli fd firefox fish font-meslo-lg fortune gh github helix jq kitty mas node npm-check-updates ripgrep sd shellcheck stow tree typescript typescript-language-server
HOMEBREW_NPM_PKGS := sort-package-json tsx vscode-langservers-extracted@4.8.0
# PACKAGES_BLOCK_END

define ask_before_running
	@echo Proposing to run:
	@tput bold
	@echo '    $(1)'
	@tput sgr0
	@read -p 'Continue? [y/N] ' answer; echo; \
	if [ "$$answer" = 'y' ]; then \
		$(1); \
		echo; \
	fi
endef
	
all: test software symlinks kinesis
	@echo 'Reminders:'
	@echo ' * To change shells to fish:'
	@echo '   + ./add_shells.sh fish (it will show the path if shell is already there)'
	@echo '   + chsh -s <path-to-fish>'
	@echo ' * To see available fonts in kitty:'
	@echo '   + kitty +list-fonts'
	@echo ' * After Helix updates on Debian, may need to run (as normal user):'
	@echo '   + hx --grammar fetch && hx --grammar build'
	@echo ' * To set up credentials helper integration on WSL:'
	@echo "   + git config --global credential.helper '/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe'"

check-dir:
ifneq ($(DOTFILES), $(shell pwd))
	$(error Must be run from $(DOTFILES))
endif

test: check-dir
	-shellcheck *.sh bin/.local/bin/*
	@echo

software:
ifeq ($(SYS), Darwin)
ifneq ($(BREW_EXECUTABLE), yes)
	@echo Installing Homebrew...
	$(call ask_before_running,/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
endif
	@echo Installing Homebrew packages...
	$(call ask_before_running,$(BREW) install --quiet $(HOMEBREW_BIN_PKGS))
	@echo Installing NPM packages...
	$(call ask_before_running,$(NPM) install --quiet --global $(HOMEBREW_NPM_PKGS))
endif
ifeq ($(SYS), Linux)
	@echo Installing core packages, including Debian NPM packages...
	$(call ask_before_running,sudo apt-get install -yq $(DEBIAN_BIN_PKGS))
	@echo Setting up bat...
	$(call ask_before_running,sudo dpkg-divert --rename --divert /usr/bin/bat /usr/bin/batcat && sudo dpkg-divert --rename --divert /usr/sbin/bacula-bat /usr/sbin/bat)
	@echo Setting up Helix...
	$(call ask_before_running,hx --grammar fetch && hx --grammar build)
	@echo Setting local NPM prefix...
	$(call ask_before_running,$(NPM) config set prefix ~/.local)
	@echo Installing NPM packages...
	$(call ask_before_running,$(NPM) install --quiet --global $(DEBIAN_NPM_PKGS))
endif

symlinks: check-dir
	$(STOW) */
	@echo

clean-symlinks: check-dir
	$(STOW) --delete */
	@echo

kinesis:
	@echo 'Kinesis keyboard customisations:'
	@echo '  Soft reset: Program + Shift + F10'
	@echo '  Hard reset: power-off, hold F7 whilst powering computer on'
	@echo '  Program + [the key right of P] (disables normal key click)'
	@echo '  Program + [the key directly below] (disables mode key beep)'
	@echo '  =m    (Mac)'
	@echo '  =n    (Multimedia keys)'
	@echo '  =F12  (Drop 'stop' key in favour of browser dev tools)'
	@echo '  =F5   (Drop 'next' key in favour of Vim Gundo plugin)'
	@echo '  Swap up and down [swapped keycaps] (to match Vim et al)'
	@echo
	@echo 'Remapping steps:'
	@echo '  Program + F12 (Remap)'
	@echo '  ( press source, press destination ), ...'
	@echo '  Program + F12 (Remap)'
	@echo

check-not-fish:
	@echo "WARNING: Don't run this from within fish (start another shell instead)."
	@echo
	@echo "         If you're directly in fish when the symlinks are removed, fish"
	@echo "         will re-create a stock config, which will need to be deleted"
	@echo "         manually before running make again."
	@echo
	@echo "         Press ENTER to continue, or interrupt to exit."
	@read

clean: check-not-fish clean-symlinks
	@echo "Use the 'deepclean' target to clean the following additional files..."
	@git clean --dry-run -d -x

deepclean: clean
	git clean -fdx
