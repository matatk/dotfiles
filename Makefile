DOTFILES=~/dotfiles
VUNDLE_OUT=$(DOTFILES)/vim/dot-vim/bundle/Vundle.vim
KARABINER_CONFIG=$(DOTFILES)/karabiner/private.xml
KARABINER_LINK=~/Library/Application\ Support/Karabiner/private.xml

.PHONY: clean deepclean symlinks kinesis

all: symlinks $(VUNDLE_OUT) $(BREW_ZSH_COMPLETIONS_TARGET)
	@echo
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from: ~/dotfiles/term/"
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + You'll need the latest vim: brew install vim && brew install macvim"
	@echo "   + cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"
	@echo "   + Python crash? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * Perlbrew setup begins: curl -L http://install.perlbrew.pl | bash"
	@echo
	@echo "Recommendations:"
	@echo "   brew install zsh zsh-completions zsh-syntax-highlighting \\"
	@echo "     bash-completion coreutils tree rename rpl autoenv python ruby node"
	@echo "     (the languages come with their respective package managers)"
	@echo "   pip install virtualenv flake8"
	@echo "   gem install bundler"
	@echo "     (can then use this to install things like the github-pages gem)"
	@echo "   npm install -g grunt-cli jshint jsonlint"
	@echo "     (jasmine-node, coffee-script, ... can be installed per-project)"
	@echo "   brew cask install karabiner iterm2 cd-to caffeine gitx soundcast \\"
	@echo "     spotify github-desktop macdown google-chrome firefox \\"
	@echo "     virtualbox virtualbox-extension-pack libreoffice"

symlinks:
	ln -sfv  $(DOTFILES)/shell/bashrc ~/.bashrc
	ln -sfv  ~/.bashrc ~/.profile
	ln -sfv  $(DOTFILES)/shell/zshrc ~/.zshrc
	ln -nsfv $(DOTFILES)/vim/dot-vim ~/.vim
	ln -sfv  $(DOTFILES)/vim/vimrc ~/.vimrc
	ln -sfv  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	ln -nsfv $(DOTFILES)/bin ~/bin
	ln -sfv  $(KARABINER_CONFIG) $(KARABINER_LINK)

$(VUNDLE_OUT): symlinks
	[ -d $(VUNDLE_OUT) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)

kinesis:
	@echo "Kinesis keyboard customisations:"
	@echo "  =m    (Mac)"
	@echo "  =n    (Multimedia keys)"
	@echo "  =F12  (Drop 'stop' key in favour of browser dev tools)"
	@echo "  Swapped up and down [including keycaps] (to match Vim et al)"
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
	rm -f $(KARABINER_LINK)
	@echo
	@echo "Note: Installed vim plugins are kept, unless you specify 'deepclean'."
	@echo
	@echo "Note: The other .gitignored vim files/dirs are always kept, even"
	@echo "      if you /do/ specify 'deepclean'."

deepclean: clean
	@echo
	rm -rf $(DOTFILES)/vim/dot-vim/bundle
