DOTFILES=~/dotfiles
VUNDLE_OUT=~/.vim/bundle/Vundle.vim
COMPLETIONS_OUT=~/.zsh-completions

all: symlinks $(VUNDLE_OUT) $(COMPLETIONS_OUT) update
	@echo
	@echo "Reminders:"
	@echo " * Vim plugins are managed within Vim with Vundle."
	@echo " * Set iTerm2 to load settings from ~/dotfiles."
	@echo " * Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo " * To finish YouCompleteMe setup:"
	@echo "   + You'll need the latest vim: brew install vim && brew install macvim"
	@echo "   + cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"
	@echo "   + Python crashes? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo " * GNU ls is required for the colouring: brew install coreutils"
	@echo
	@echo "Recommendations:"
	@echo "   brew install python ruby node tree rename watch autoenv coreutils"
	@echo "     (the languages come with their respective package managers)"
	@echo "   pip install virtualenv flake8"
	@echo "   gem install jekyll"
	@echo "   npm install -g grunt-cli coffeelint"
	@echo "     (jasmine-node, coffee-script, ... can be installed per-project)"


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

$(COMPLETIONS_OUT): symlinks
	@[ -d $(COMPLETIONS_OUT) ] || ( \
		git clone https://github.com/zsh-users/zsh-completions.git \
			$(COMPLETIONS_OUT) \
		&& echo You may need to \
		&& echo "    rm -f ~/.zcompdump; compinit" )

update: $(COMPLETIONS_OUT)
	@echo "Updating zsh completions..."
	@cd $(COMPLETIONS_OUT) \
		&& git pull
