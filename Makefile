SHELL=/bin/sh
DOTFILES=$(HOME)/.dotfiles
VIM_PLUGIN_DIR=$(DOTFILES)/vim/.vim/plugged
ZSH_ANTIGEN_REPO=~/.antigen-repo
ZSH_ANTIGEN_PROG=~/.antigen

STOW = $(shell test -x /opt/homebrew/bin/stow && echo /opt/homebrew/bin/stow || echo /usr/local/bin/stow)

.PHONY: \
	all \
	check-dir \
	clean \
	clean-symlinks \
	clean-vim-plugin-dir \
	clean-zsh-antigen-dirs \
	deepclean \
	kinesis \
	symlinks \
	test

all: test symlinks $(ZSH_ANTIGEN_REPO) kinesis
	@echo 'Reminders:'
	@echo ' * To install software: ./install-software.sh'
	@echo '   - NOTE: Need this to install fisher (fish plugin manager)'
	@echo ' * To change shells to fish:'
	@echo '   - ./add_shells.sh fish'
	@echo '   - chsh -s <path-to-fish>'
	@echo '   - On first launch, run:'
	@echo '       + fisher update (installs plugins)'
	@echo '       + universal_setup (sets paths, vi mode, etc.)'
	@echo ' * To install NeoVim plugins for the first time:'
	@echo "     nvim --headless -u NONE -c 'lua require(\"bootstrap\").bootstrap_paq()'"
	@echo
	@echo 'Legacy reminders:'
	@echo ' * Changing shells: http://unix.stackexchange.com/questions/111365'
	@echo ' * Vim plugins are handled by vim-plug; run :PlugInstall in vim'

check-dir:
ifneq ($(DOTFILES), $(shell pwd))
	$(error Must be run from $(DOTFILES))
endif

test: check-dir
	-shellcheck *.sh _shell/* bins/bin/* bash/.bashrc
	@echo

symlinks: check-dir
	$(STOW) */
	@echo

# FIXME: This breaks fish if it's running at the time.
clean-symlinks: check-dir
	$(STOW) --delete */
	@echo

$(ZSH_ANTIGEN_REPO):
	@echo 'Cloning zsh-antigen, if needed...'
	@[ -d $(ZSH_ANTIGEN_REPO) ] || \
		git clone https://github.com/zsh-users/antigen.git $(ZSH_ANTIGEN_REPO)
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
	@echo 'Note: Installed vim plugins are kept, unless you specify 'deepclean'.'
	@echo
	@echo 'Note: The other .gitignored vim files/dirs are always kept, even'
	@echo '      if you /do/ specify 'deepclean'.'

clean-vim-plugin-dir:
	@echo
	@echo 'Removing Vim plugin directory...'
	rm -rf $(VIM_PLUGIN_DIR)
	@echo

clean-zsh-antigen-dirs:
	@echo 'Removing Zsh Antigen repo and bundle directory...'
	rm -rf $(ZSH_ANTIGEN_REPO) $(ZSH_ANTIGEN_PROG)

deepclean: \
	clean \
	clean-vim-plugin-dir \
	clean-zsh-antigen-dirs
