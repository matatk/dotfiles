let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
			\ 'coc-css',
			\ 'coc-eslint',
			\ 'coc-git',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-pyright',
			\ 'coc-stylelintplus',
			\ 'coc-tsserver',
			\ 'coc-deno',
			\ ]
Plug 'sjl/gundo.vim'                  " Awesome graph-based undo
Plug 'jaxbot/semantic-highlight.vim'  " What it says on the tin!
Plug 'kchmck/vim-coffee-script'       " CoffeeScript Support
Plug 'tomasr/molokai'                 " Colour scheme
Plug 'gu-fan/colorv.vim'              " Colour preview and editing tools
Plug 'tpope/vim-fugitive'             " Git magic
Plug 'ntpeters/vim-better-whitespace' " Dealing with trailing whitespace
Plug 'tpope/vim-unimpaired'           " Nice shortcuts
Plug 'vim-scripts/applescript.vim'    " Syntax highlighting for AppleScript
Plug 'godlygeek/tabular'              " Align stuff
Plug 'plasticboy/vim-markdown'        " Folding and other nice things
Plug 'bronson/vim-visual-star-search' " Search for the visually-selected text
Plug 'tpope/vim-abolish'              " Mainly for Subvert
Plug 'alvan/vim-closetag'             " Auto-close HTML tags using > or >>
Plug 'MarkWithall/cif-vim-syntax'     " Railways! Trains!
Plug 'mattn/emmet-vim'                " Fantastic time-saver for writing HTML
Plug 'IN3D/vim-raml'                  " Highlighting support for RAML
Plug 'editorconfig/editorconfig-vim'  " EditorConfig ;-)
Plug 'tpope/vim-repeat'               " Encore (properly)!
Plug 'pangloss/vim-javascript'        " Better indenting; JSDoc highlighting
Plug 'tpope/vim-surround'             " Wrapping :-)
call plug#end()
