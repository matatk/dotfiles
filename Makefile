DIR=~/dotfiles
VUNDLE_OUT=~/.vim/bundle/Vundle.vim

all: symlinks $(VUNDLE_OUT)
	@echo "Reminder: Vim plugins are managed within Vim with Vundle."
	@echo "Reminder: Set iTerm2 to load settings from ~/dotfiles."

symlinks:
	@mkdir -p $(DIR)/vim/vim     # until I have some stuff there
	@mkdir -p $(DIR)/vim/plugin  # until I have some plugins
	@ln -sf $(DIR)/zshrc ~/.zshrc
	@ln -sf $(DIR)/bashrc ~/.bashrc
	@ln -nsf $(DIR)/vim/vim ~/.vim
	@ln -nsf $(DIR)/vim/plugin ~/.vim/plugin
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@ln -sf $(DIR)/vim/gvimrc ~/.gvimrc

$(VUNDLE_OUT): symlinks
	@[ -d $(VUNDLE_OUT) ] || git clone https://github.com/gmarik/Vundle.vim.git $(VUNDLE_OUT)
