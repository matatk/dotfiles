DOTFILES=~/dotfiles
VUNDLE_OUT=~/.vim/bundle/Vundle.vim
COMPLETIONS_OUT=~/.zsh-completions

all: symlinks $(VUNDLE_OUT) $(COMPLETIONS_OUT) update
	@echo
	@echo "Reminder: Vim plugins are managed within Vim with Vundle."
	@echo "Reminder: Set iTerm2 to load settings from ~/dotfiles."
	@echo "Reminder: Changing shells: http://unix.stackexchange.com/questions/111365"
	@echo "Reminder: To finish YouCompleteMe setup:"
	@echo "    You'll need the latest vim: brew install vim && brew install macvim"
	@echo "    cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer"
	@echo "    Python crashes? https://github.com/Valloric/YouCompleteMe/issues/620"
	@echo
	@echo "Recommendation: For cleanly installing third-party libraries:"
	@echo "    brew install python (gives you pip)"
	@echo "    brew install ruby (gives you gem)"
	@echo "Recommendation: brew install tree rename autoenv node"
	@echo "Recommendation: pip install virtualenv flake8"
	@echo "Recommendation: gem install jekyll"
	@echo "Recommendation: npm install -g grunt-cli coffeelint"
	@echo "    (jasmine-node, coffee-script, ... can be installed per-project)"


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
