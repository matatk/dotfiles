set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'python-rope/ropevim'            " pip install rope
                                        " then :PluginInstall ; quit vim
                                        "  and python setup.py install
                                        "  and :PluginInstall again
Plugin 'Valloric/YouCompleteMe'         " Autocompletion
Plugin 'scrooloose/syntastic'           " Multi-language syntax checking
Plugin 'sjl/gundo.vim'                  " Awesome graph-based undo
Plugin 'jaxbot/semantic-highlight.vim'  " What it says on the tin!
Plugin 'kchmck/vim-coffee-script'       " CoffeeScript Support
Plugin 'tomasr/molokai'                 " Colour scheme
Plugin 'Rykka/colorv.vim'               " Colour preview and editing tools
Plugin 'scrooloose/nerdtree'            " Exploration and manipulation
Plugin 'tpope/vim-fugitive'             " Git magic
Plugin 'ntpeters/vim-better-whitespace' " Dealing with trailing whitespace

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
