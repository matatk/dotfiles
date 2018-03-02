DOTFILES=~/dotfiles
VUNDLE_OUT=$(DOTFILES)/vim/dot-vim/bundle/Vundle.vim
IMGCAT_OUT=~/bin/imgcat

.PHONY: clean deepclean home-dot-symlinks imgcat kinesis

all: home-dot-symlinks $(VUNDLE_OUT) imgcat kinesis
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from: ~/dotfiles/term/"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --js-completer"
	@echo "   + Python crash? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * Homebrew's Perl has its own CPAN, which can use local::lib and install"
	@echo "   to ~/perl5/ -- which these scripts will detect and add to the PATH."
	@echo
	@echo "Recommendations:"
	@echo "   brew install zsh bash-completion coreutils tree rename rpl python node@8 \\"
	@echo "     zsh-completions zsh-syntax-highlighting zsh-autosuggestions ruby perl vim"
	@echo "     (the languages come with their respective package managers)"
	@echo "   brew link node@8 --force (easier way to keep it in the path)"
	@echo "   pip install virtualenv flake8"
	@echo "   gem install bundler"
	@echo "     (can then use this to install things like the github-pages gem)"
	@echo "   npm install -g eslint jsonlint package-json-validator"
	@echo "     (jasmine-node, coffee-script, ... can be installed per-project)"
	@echo "   brew cask install spectacle iterm2 cd-to caffeine spotify \\"
	@echo "     macvim macdown meld google-chrome firefox libreoffice"

home-dot-symlinks:
	@ln -sfv  $(DOTFILES)/shell/bashrc ~/.bashrc
	@ln -sfv  ~/.bashrc ~/.profile
	@ln -sfv  $(DOTFILES)/shell/zshrc ~/.zshrc
	@ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	@ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	@ln -nsfv $(DOTFILES)/bin ~/bin
	@echo

$(VUNDLE_OUT): home-dot-symlinks
	@echo "Cloning Vundle, if needed..."
	@[ -d $(VUNDLE_OUT) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)

imgcat:
	@echo "Downloading and installing imgcat, if needed..."
	@[ -x $(IMGCAT_OUT) ] || \
		curl -o $(IMGCAT_OUT) "https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat" && chmod +x $(IMGCAT_OUT)
	@echo

kinesis:
	@echo "Kinesis keyboard customisations:"
	@echo "  =m    (Mac)"
	@echo "  =n    (Multimedia keys)"
	@echo "  =F12  (Drop 'stop' key in favour of browser dev tools)"
	@echo "  Swapped up and down [including keycaps] (to match Vim et al)"
	@echo "  Program + [the key right of P] (disables normal key click)"
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
	rm -rf $(DOTFILES)/vim/dot-vim/bundle
