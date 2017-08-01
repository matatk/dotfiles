DOTFILES=~/dotfiles
VUNDLE_OUT=$(DOTFILES)/vim/dot-vim/bundle/Vundle.vim
IMGCAT_OUT=~/bin/imgcat
PIP_PATH=/usr/local/bin/pip
PIP3_PATH=/usr/local/bin/pip3

.PHONY: clean deepclean home-dot-symlinks pip3-symlink imgcat kinesis

all: home-dot-symlinks $(VUNDLE_OUT) pip3-symlink imgcat kinesis
	@echo
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from: ~/dotfiles/term/"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + You'll need the latest vim: brew install vim && brew install macvim"
	@echo "   + cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer"
	@echo "   + Python crash? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * Homebrew's Perl has its own cpan, which can use local::lib and install"
	@echo "   to ~/perl5/ -- which these scripts will detect and add to the PATH."
	@echo
	@echo "Recommendations:"
	@echo "   brew install zsh bash-completion coreutils tree rename rpl python3 \\"
	@echo "     zsh-completions zsh-syntax-highlighting zsh-autosuggestions node ruby perl"
	@echo "     (the languages come with their respective package managers)"
	@echo "   brew install vim --with-python3 && brew cask install macvim"
	@echo "   pip install virtualenv flake8"
	@echo "   gem install bundler"
	@echo "     (can then use this to install things like the github-pages gem)"
	@echo "   npm install -g eslint jsonlint package-json-validator grunt-cli yo"
	@echo "     (jasmine-node, coffee-script, ... can be installed per-project)"
	@echo "   brew cask install spectacle iterm2 cd-to caffeine spotify \\"
	@echo "     github-desktop macdown google-chrome firefox libreoffice"

home-dot-symlinks:
	ln -sfv  $(DOTFILES)/shell/bashrc ~/.bashrc
	ln -sfv  ~/.bashrc ~/.profile
	ln -sfv  $(DOTFILES)/shell/zshrc ~/.zshrc
	ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	ln -nsfv $(DOTFILES)/bin ~/bin

$(VUNDLE_OUT): home-dot-symlinks
	[ -d $(VUNDLE_OUT) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)

pip3-symlink:
	@echo
	@if [ -L $(PIP_PATH) ] && [ `readlink $(PIP_PATH)` == $(PIP3_PATH) ]; then \
		echo 'INFO: pip symlink already set up correctly.'; \
	elif [ ! -e $(PIP_PATH) ]; then \
		echo 'INFO: setting up pip symlink'; \
		ln -sv $(PIP3_PATH) $(PIP_PATH); \
	else \
		echo 'WARNING: $(PIP_PATH) already exists; not overwriting.'; \
	fi

imgcat:
	@echo
	@curl -so $(IMGCAT_OUT) "https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/imgcat"
	@chmod +x $(IMGCAT_OUT)
	@echo "INFO: imgcat downloaded and installed"

kinesis:
	@echo
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

clean:
	rm -f ~/.bashrc
	rm -f ~/.profile
	rm -f ~/.zshrc
	rm -f ~/.vim
	rm -f ~/.vimrc
	rm -f ~/.gvimrc
	rm -f ~/bin
	@echo
	@echo "Note: Installed vim plugins are kept, unless you specify 'deepclean'."
	@echo
	@echo "Note: The other .gitignored vim files/dirs are always kept, even"
	@echo "      if you /do/ specify 'deepclean'."
	@echo
	@echo "Note: Pip 3 symlink in /usr/local/bin/ not removed."

deepclean: clean
	@echo
	rm -rf $(DOTFILES)/vim/dot-vim/bundle
