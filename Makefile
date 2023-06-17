SHELL=/bin/sh
DOTFILES=$(HOME)/.dotfiles

STOW = $(shell test -x /opt/homebrew/bin/stow && echo /opt/homebrew/bin/stow || echo /usr/local/bin/stow)

.PHONY: \
	all \
	check-dir \
	clean \
	clean-symlinks \
	deepclean \
	kinesis \
	symlinks \
	test

all: test symlinks kinesis
	@echo 'Reminders:'
	@echo ' * To install software: ./install-software.sh'
	@echo '   - NOTE: Need this to install fish and fisher (plugin manager)'
	@echo ' * To change shells to fish:'
	@echo '   - ./add_shells.sh fish'
	@echo '   - chsh -s <path-to-fish>'
	@echo '   - On first launch, run:'
	@echo '       + fisher update (installs plugins)'
	@echo '       + universal_setup (sets paths, vi mode, etc.)'
	@echo
	@echo 'Legacy reminders:'
	@echo ' * Changing shells: http://unix.stackexchange.com/questions/111365'
	@echo ' * Start nvim to install NeoVim plugins'

check-dir:
ifneq ($(DOTFILES), $(shell pwd))
	$(error Must be run from $(DOTFILES))
endif

test: check-dir
	-shellcheck *.sh bins/bin/*
	@echo

symlinks: check-dir
	$(STOW) */
	@echo

# FIXME: This breaks fish if it's running at the time.
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

clean: clean-symlinks
