DOTFILES=~/dotfiles
VUNDLE_OUT=~/.vim/bundle/Vundle.vim

all: symlinks $(VUNDLE_OUT)
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from ~/dotfiles."
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + You'll need the latest vim: brew install vim && brew install macvim"
	@echo "   + cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"
	@echo "   + Python crashes? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * GNU ls is required for colouring: brew install coreutils"
	@echo
	@echo "Recommendations:"
	@echo "   brew install zsh zsh-completions zsh-syntax-highlighting bash-completion"
	@echo "   brew install python ruby node tree rename autoenv coreutils rpl"
	@echo "     (the languages come with their respective package managers)"
	@echo "   pip install virtualenv flake8"
	@echo "   gem install bundler"
	@echo "     (can then use this to install things like the github-pages gem)"
	@echo "   npm install -g grunt-cli jshint jsonlint"
	@echo "     (jasmine-node, coffee-script, ... can be installed per-project)"
	@echo "   brew cask install iterm2 cd-to caffeine gitx soundcast \\"
	@echo "     virtualbox virtualbox-extension-pack"

symlinks:
	@ln -sf  $(DOTFILES)/shell/bashrc ~/.bashrc
	@ln -sf  ~/.bashrc ~/.profile
	@ln -sf  $(DOTFILES)/shell/zshrc ~/.zshrc
	@ln -nsf $(DOTFILES)/vim/dot-vim ~/.vim
	@ln -sf  $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sf  $(DOTFILES)/vim/gvimrc ~/.gvimrc
	@ln -nsf $(DOTFILES)/bin ~/bin

$(VUNDLE_OUT): symlinks
	@[ -d $(VUNDLE_OUT) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)
