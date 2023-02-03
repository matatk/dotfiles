DOTFILES=~/.dotfiles
VIM_PLUGIN_DIR=$(DOTFILES)/vim/dot-vim/plugged
ZSH_ANTIGEN_REPO=~/.antigen-repo
ZSH_ANTIGEN_PROG=~/.antigen

.PHONY: \
	all \
	test \
	home-dot-symlinks \
	clean-home-dot-symlinks \
	managed-symlinks \
	clean-managed-symlinks \
	kinesis \
	install-software \
	clean \
	clean-vim-plugin-dir \
	clean-zsh-antigen-dirs \
	deepclean

all: test home-dot-symlinks managed-symlinks $(ZSH_ANTIGEN_REPO) kinesis
	@echo "Reminders:"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * Vim plugins are handled by vim-plug; run :PlugInstall in vim"
	@echo " * To install software: make install-software"

# NOTE: shell/.shellcheckrc specifies the shell for the shell/*.sh scripts
test:
	-shellcheck scripts/*.sh shell/*.sh bin/*
	@echo

# FIXME: These will be removed even if they weren't links
home-dot-symlinks:
	@ln -sfv  $(DOTFILES)/shell/bashrc.sh ~/.bashrc
	@ln -sfv  $(DOTFILES)/shell/zshrc.zsh ~/.zshrc
	@ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	@ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sfv  $(DOTFILES)/vim/gvimrc.core ~/.gvimrc.core
	@ln -sfv  $(DOTFILES)/vim/gvimrc.fullscreen ~/.gvimrc.fullscreen
	@ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	@echo

clean-home-dot-symlinks:
	@echo "Removing direct home symlinks..."
	@rm -fv ~/.bashrc
	@rm -fv ~/.zshrc
	@rm -fv ~/.vim
	@rm -fv ~/.vimrc
	@rm -fv ~/.gvimrc.core
	@rm -fv ~/.gvimrc.fullscreen
	@rm -fv ~/.gvimrc
	@echo

~/.config:
	mkdir -pv ~/.config

~/bin:
	mkdir -pv ~/bin

managed-symlinks: | ~/.config ~/bin
	@bin/symlinks dot-config ~/.config create
	@bin/symlinks bin ~/bin create

clean-managed-symlinks:
	@bin/symlinks dot-config ~/.config clean
	@bin/symlinks bin ~/bin clean

$(ZSH_ANTIGEN_REPO):
	@echo "Cloning zsh-antigen, if needed..."
	@[ -d $(ZSH_ANTIGEN_REPO) ] || \
		git clone https://github.com/zsh-users/antigen.git $(ZSH_ANTIGEN_REPO)
	@echo

kinesis:
	@echo "Kinesis keyboard customisations:"
	@echo "  Soft reset: Program + Shift + F10"
	@echo "  Hard reset: power-off, hold F7 whilst powering computer on"
	@echo "  Program + [the key right of P] (disables normal key click)"
	@echo "  Program + [the key directly below] (disables mode key beep)"
	@echo "  =m    (Mac)"
	@echo "  =n    (Multimedia keys)"
	@echo "  =F12  (Drop 'stop' key in favour of browser dev tools)"
	@echo "  =F5   (Drop 'next' key in favour of Vim Gundo plugin)"
	@echo "  Swap up and down [swapped keycaps] (to match Vim et al)"
	@echo
	@echo "Remapping steps:"
	@echo "  Program + F12 (Remap)"
	@echo "  ( press source, press destination ), ..."
	@echo "  Program + F12 (Remap)"
	@echo

install-software:
	@scripts/install-software.sh

clean: clean-home-dot-symlinks clean-managed-symlinks
	@echo "Note: Installed vim plugins are kept, unless you specify 'deepclean'."
	@echo
	@echo "Note: The other .gitignored vim files/dirs are always kept, even"
	@echo "      if you /do/ specify 'deepclean'."

clean-vim-plugin-dir:
	@echo
	@echo "Removing Vim plugin directory..."
	rm -rf $(VIM_PLUGIN_DIR)
	@echo

clean-zsh-antigen-dirs:
	@echo "Removing Zsh Antigen repo and bundle directory..."
	rm -rf $(ZSH_ANTIGEN_REPO) $(ZSH_ANTIGEN_PROG)

deepclean: clean clean-vim-plugin-dir clean-zsh-antigen-dirs
