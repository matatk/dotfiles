DOTFILES := $(HOME)/.dotfiles

CROSS_PLAT_UTILS :=\
	direnv \
	dua-cli \
	fd \
	fish \
	fortune \
	jq \
	ripgrep \
	sd \
	shellcheck \
	tree

NPM_PACKAGES :=\
	json-diff \
	jsonlint \
	npm \
	npm-check-updates \
	package-json-validator-cli \
	sort-package-json \
	tsx \
	typescript \
	typescript-language-server \
	vscode-langservers-extracted

SYS := $(shell uname -s)
BREW := /opt/homebrew/bin/brew
BREW_EXECUTABLE := $(shell test -x $(BREW) && echo 'yes' || echo 'no')
STOW := $(shell test -x /usr/bin/stow \
	&& echo /usr/bin/stow \
	|| echo /opt/homebrew/bin/stow)
NPM := $(shell test -x /usr/bin/npm \
	&& echo /usr/bin/npm \
	|| echo /opt/homebrew/bin/npm)

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

define ask_before_running
	@echo Proposing to run:
	@echo '    $(1)'
	@read -n 1 -p 'Continue? [y/N] ' answer; echo; \
	if [ "$$answer" = 'y' ]; then \
		$(1); \
	else \
		echo Skipped; \
	fi
	@echo
endef
	
all: test software symlinks kinesis
	@echo 'Reminders:'
	@echo ' * To change shells to fish:'
	@echo '   - ./add_shells.sh fish'
	@echo '   - chsh -s <path-to-fish>'
	@echo '   - On first launch, run: universal_setup'
	@echo '     (installs plugins, sets paths, vi mode, etc.)'

check-dir:
ifneq ($(DOTFILES), $(shell pwd))
	$(error Must be run from $(DOTFILES))
endif

test: check-dir
	-shellcheck *.sh bins/bin/*
	@echo

software:
ifeq ($(SYS), Darwin)
ifneq ($(BREW_EXECUTABLE), yes)
	$(call ask_before_running,/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
endif
	$(call ask_before_running,$(BREW) install --quiet bat coreutils fisher node mas $(CROSS_PLAT_UTILS))
	$(call ask_before_running,$(BREW) install --quiet --cask caffeine font-fira-code-nerd-font firefox github kitty)
endif
ifeq ($(SYS), Linux)
	$(call ask_before_running,sudo apt-get install -qq nodejs npm rust-bat $(CROSS_PLAT_UTILS))
endif
	$(call ask_before_running,$(NPM) install --quiet --global install $(NPM_PACKAGES))

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
	@echo "         before running make again."
	@echo
	@echo "         Press ENTER to continue, or interrupt to exit."
	@read

clean: check-not-fish clean-symlinks
	@echo "Use the 'deepclean' target to clean the following additional files..."
	@git clean --dry-run -d -x

deepclean: clean
	git clean -fdx
