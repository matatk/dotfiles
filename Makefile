DOTFILES=~/dotfiles
VUNDLE_OUT=~/.vim/bundle/Vundle.vim
COMPLETIONS_OUT=~/.zsh-completions

all: symlinks $(VUNDLE_OUT) $(COMPLETIONS_OUT)
	@echo "Reminder: Vim plugins are managed within Vim with Vundle."
	@echo "Reminder: Set iTerm2 to load settings from ~/dotfiles."

symlinks:
	@mkdir -p $(DOTFILES)/vim/vim     # until I have some stuff there
	@mkdir -p $(DOTFILES)/vim/plugin  # until I have some plugins
	@ln -sf $(DOTFILES)/zshrc ~/.zshrc
	@ln -sf $(DOTFILES)/bashrc ~/.bashrc
	@ln -nsf $(DOTFILES)/vim/vim ~/.vim
	@ln -nsf $(DOTFILES)/vim/plugin ~/.vim/plugin
	@ln -sf $(DOTFILES)/vim/vimrc ~/.vimrc
	@ln -sf $(DOTFILES)/vim/gvimrc ~/.gvimrc

$(VUNDLE_OUT): symlinks
	@[ -d $(VUNDLE_OUT) ] || \
		git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)

$(COMPLETIONS_OUT): symlinks
	@[ -d $(COMPLETIONS_OUT) ] || ( \
		git clone https://github.com/zsh-users/zsh-completions.git \
			$(COMPLETIONS_OUT) \
		&& echo You may need to \
		&& echo "    rm -f ~/.zcompdump; compinit" )
