DOTFILES=~/dotfiles
VIM_BUNDLE_DIR=$(DOTFILES)/vim/dot-vim/bundle
VUNDLE_REPO=$(VIM_BUNDLE_DIR)/Vundle.vim
IMGCAT_OUT=~/bin/imgcat
ZSH_ANTIGEN_REPO=~/.antigen-repo
ZSH_ANTIGEN_PROG=~/.antigen

.PHONY: \
	all \
	test \
	home-dot-symlinks \
	home-dot-config-symlinks \
	imgcat \
	kinesis \
	ycm-setup \
	install-software \
	clean \
	deepclean

all: test home-dot-symlinks home-dot-config-symlinks $(VUNDLE_REPO) $(ZSH_ANTIGEN_REPO) imgcat kinesis
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from: ~/dotfiles/term/"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To complete YouCompleteMe setup: make ycm-setup"
	@echo " * Homebrew's Perl has its own CPAN, which can use local::lib and install"
	@echo "   to ~/perl5/ -- which these scripts will detect and add to the PATH."
	@echo " * To install software: make install-software"

test:
	-shellcheck shell/**.sh --shell=bash

home-dot-symlinks:
	@ln -sfv  $(DOTFILES)/shell/bashrc ~/.bashrc
	@ln -sfv  ~/.bashrc ~/.profile
	@ln -sfv  $(DOTFILES)/shell/zshrc ~/.zshrc
	@ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	@ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sfv  $(DOTFILES)/vim/gvimrc.core ~/.gvimrc.core
	@ln -sfv  $(DOTFILES)/vim/gvimrc.fullscreen ~/.gvimrc.fullscreen
	@ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	@ln -nsfv $(DOTFILES)/bin ~/bin
	@echo

~/.config:
	@mkdir ~/.config

home-dot-config-symlinks: ~/.config
	@scripts/home-dot-config-symlinks.sh

$(VUNDLE_REPO): home-dot-symlinks
	@echo "Cloning Vundle, if needed..."
	@[ -d $(VUNDLE_REPO) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_REPO)
	@echo

$(ZSH_ANTIGEN_REPO):
	@echo "Cloning zsh-antigen, if needed..."
	@[ -d $(ZSH_ANTIGEN_REPO) ] || \
		git clone https://github.com/zsh-users/antigen.git $(ZSH_ANTIGEN_REPO)
	@echo

imgcat:
	@if [ $$(uname -s) = 'Darwin' ]; then \
		echo 'Downloading and installing imgcat, if needed...'; \
		if [ ! -x $(IMGCAT_OUT) ]; then \
			curl -o $(IMGCAT_OUT) "https://iterm2.com/utilities/imgcat"; \
			chmod +x $(IMGCAT_OUT); \
		fi; \
		echo; \
	fi

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

ycm-setup:
	python3 ~/.vim/bundle/YouCompleteMe/install.py \
		--clang-completer --ts-completer --system-libclang

install-software:
	@scripts/install-software.sh

clean:
	@echo "Removing imgcat..."
	@rm -fv $(IMGCAT_OUT)
	@echo
	@echo "Removing symlinks..."
	@rm -fv ~/.bashrc
	@rm -fv ~/.profile
	@rm -fv ~/.zshrc
	@rm -fv ~/.vim
	@rm -fv ~/.vimrc
	@rm -fv ~/.gvimrc.core
	@rm -fv ~/.gvimrc.fullscreen
	@rm -fv ~/.gvimrc
	@rm -fv ~/bin
	@echo
	@scripts/home-dot-config-symlinks-clean.sh
	@echo
	@echo "Note: Installed vim plugins are kept, unless you specify 'deepclean'."
	@echo
	@echo "Note: The other .gitignored vim files/dirs are always kept, even"
	@echo "      if you /do/ specify 'deepclean'."

deepclean: clean
	@echo
	@echo "Removing Vim bundle directory..."
	rm -rf $(VIM_BUNDLE_DIR)
	@echo
	@echo "Removing Zsh Antigen repo and bundle directory..."
	rm -rf $(ZSH_ANTIGEN_REPO) $(ZSH_ANTIGEN_PROG)
