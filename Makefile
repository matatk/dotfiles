DOTFILES=~/dotfiles
VIM_BUNDLE_DIR=$(DOTFILES)/vim/dot-vim/bundle
VUNDLE_REPO=$(VIM_BUNDLE_DIR)/Vundle.vim
IMGCAT_OUT=~/bin/imgcat
ZSH_ANTIGEN_REPO=~/.antigen-repo
ZSH_ANTIGEN_PROG=~/.antigen

.PHONY: clean deepclean home-dot-symlinks imgcat kinesis test

all: test home-dot-symlinks $(VUNDLE_REPO) $(ZSH_ANTIGEN_REPO) imgcat kinesis
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from: ~/dotfiles/term/"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer"
	@echo "   + Python crash? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * Homebrew's Perl has its own CPAN, which can use local::lib and install"
	@echo "   to ~/perl5/ -- which these scripts will detect and add to the PATH."
	@echo
	@echo "Recommendations:"
	@echo "   brew install zsh bash-completion coreutils tree rename rpl \\"
	@echo "     python node@10 ruby perl vim shellcheck"
	@echo "   pip3 install virtualenv flake8"
	@echo "   gem install bundler"
	@echo "   npm install -g eslint jsonlint package-json-validator eclint \\"
	@echo "     stylelint stylelint-config-standard"
	@echo "   brew cask install spectacle iterm2 cd-to-iterm caffeine spotify \\"
	@echo "     macvim macdown meld github google-chrome firefox libreoffice \\"
	@echo "     virtualbox-extension-pack  # will not error after kext approval"

test:
	-shellcheck shell/**.sh --shell=bash

home-dot-symlinks:
	@ln -sfv  $(DOTFILES)/shell/bashrc ~/.bashrc
	@ln -sfv  ~/.bashrc ~/.profile
	@ln -sfv  $(DOTFILES)/shell/zshrc ~/.zshrc
	@ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	@ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	@ln -nsfv $(DOTFILES)/bin ~/bin
	@echo

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
	@echo "Downloading and installing imgcat, if needed..."
	@[ $$(uname -s) == 'Darwin' ] && [ -x $(IMGCAT_OUT) ] || \
		curl -o $(IMGCAT_OUT) "https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat" && chmod +x $(IMGCAT_OUT)
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
	@rm -fv ~/.gvimrc
	@rm -fv ~/bin
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
