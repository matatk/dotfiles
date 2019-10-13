"
" Bindings
" http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"

" Toggling Gundo
noremap <F5> :GundoToggle<CR>
" Toggling Semantic Highlighting
noremap <F6> :SemanticHighlightToggle<CR>
" Showing indentation and non-printing characters
nmap <leader>l :set list!<CR>
" Removing trailing whitespace
nmap <leader>$ :StripWhitespace<CR>
" Indenting the whole file
nmap <leader>= :call Preserve("normal gg=G")<CR>
" Open a new tab (with explorer) in the directory of the current file
nmap <leader>e :tabnew %:h<CR>
" Open ToC for Markdown documents
nmap <leader>t :Toc<CR>
" Toggle the width of tabs
nmap <leader>w :call ToggleTabWidth()<CR>
" Note: ColorV uses <leader>c* mappings.

" Tab navigation; http://vimcasts.org/episodes/working-with-tabs/
map <D-S-]> gt
map <D-S-[> gT
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-0> :tablast<CR>

" Show tab summary; https://vim.fandom.com/wiki/Using_tab_pages
map T :tabs<CR>


"
" Whitespace, Indentation and Non-printing characters
"

" Note: EditorConfig is recommended for projects that may be shared with
"       others; these settings are therefore mainly personal defaults.

" Use four-column indentation with tabs by default
" Thanks http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" Show some nonprinting characters
" http://stackoverflow.com/a/1675752
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬

" Automatically strip trailing whitespace on save for certain file types
autocmd FileType text,markdown,html,javascript,coffee,python
	\ autocmd BufWritePre <buffer> StripWhitespace

" Use an indent of four spaces when editing Python
" However I like to ignore this with .editorconfig files and also am about to
" ignore flake8 warnings about tabs in indentation...
autocmd FileType python
	\ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Recognise AppleScript files
autocmd BufNewFile,BufRead *.applescript set filetype=applescript


"
" Colours
"

"let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Force a clear/black background
" http://stackoverflow.com/questions/4325682/
highlight Normal ctermbg=NONE guibg=Black

" Enable syntax highlighting of JSDoc strings in JavaScript files
let g:javascript_plugin_jsdoc = 1


"
" Spelling
"

" Automatically do spell checking on certain filetypes
" http://robots.thoughtbot.com/vim-spell-checking
autocmd FileType text,markdown,html,gitcommit setlocal spell
autocmd FileType help setlocal nospell


"
" General UI
"

set spelllang=en_gb
set mouse=a
set number
set smartcase  " searches are only case-sensitive if the pattern is
set wildmenu   " http://derekwyatt.org/2009/08/20/the-absolute-bare-minimum/
set tabpagemax=42


"
" Filetype-specific
"

" WebAccessibilityToolbar uses files that are almost JavaScript
autocmd BufNewFile,BufRead *.ws set filetype=javascript

" Nunjucks templates are HTMLy
autocmd BufNewFile,BufRead *.nunjucks set filetype=html

" When working with Markdown files, grok the YAML frontmatter...
let g:vim_markdown_frontmatter = 1
" ...and don't fold
let g:vim_markdown_folding_disabled = 1
" Auto-shrink Markdown ToC
let g:vim_markdown_toc_autofit = 1
" Open the ToC on loading a Markdown file
" https://github.com/plasticboy/vim-markdown/issues/166#issuecomment-174747050
function! s:Toc()
	if &filetype == 'markdown'
		:Toc
		set filetype=qf
		setl nofoldenable
		syntax on
	endif
endfunction
autocmd VimEnter *.m* call s:Toc()
autocmd BufReadPost *.m* call s:Toc()
autocmd BufWinEnter *.m* call s:Toc()

" CHANGES files are text files
autocmd BufNewFile,BufRead CHANGES set filetype=text
" CHANGES files should be auto-wrapped
autocmd BufNewFile,BufRead CHANGES set textwidth=72

" Format Cish files on save
" FIXME: This path won't work on !macOS
function! Formatonsave()
  let l:formatdiff = 1
  let l:lines = "all"
  py3file /usr/local/Cellar/clang-format/2019-05-14/share/clang/clang-format.py
endfunction
autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Formatonsave()


"
" Syntastic
"

" Recommended defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" My customisations
let g:syntastic_c_checkers = ['cppcheck']
let g:syntastic_cpp_checkers = ['cppcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_css_stylelint_args = '--config-basedir /usr/local/lib/node_modules/stylelint/'
let g:syntastic_loc_list_height = 3
let g:syntastic_coffee_coffeelint_args = '--reporter csv --file coffeelint.json'
" The flake8 rules are also specified in shell/commands.sh
let g:syntastic_python_flake8_args='--ignore=E117,W191,W503'
" E117: over-indented (happens with single tabs, yet where four spaces are OK)
" W191: indentation contains tabs (naughty :-))
" W503: https://lintlyci.github.io/Flake8Rules/rules/W503.html (to be removed)

" Python version
" https://stackoverflow.com/a/43125342/1485308
function Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python'
endfunction

function Py3()
  let g:syntastic_python_python_exec = '/usr/local/bin/python3'
endfunction

call Py3()


"
" YouCompleteMe
"

let g:ycm_add_preview_to_completeopt = 1  " default 0
let g:ycm_autoclose_preview_window_after_insertion = 1  " default 0
let g:ycm_show_diagnostics_ui = 0  " default 1
" More info: https://github.com/ycm-core/YouCompleteMe#user-content-the-gycm_show_diagnostics_ui-option
" TODO: does this negatively affect anything else?


"
" Fugitive
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"

" Convenient 'up' command for navigation
autocmd User fugitive
	\ if get(b:, 'fugitive_type', '') =~# '^\%(tree\|blob\)$' |
	\   nnoremap <buffer> .. :edit %:h<CR> |
	\ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"
" Functions
"

" Preserving state when executing a command
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" Toggle the width of tabs
" http://stackoverflow.com/questions/5736580/setting-vim-options-with-variables
function! ToggleTabWidth()
	let new_tab_size = &tabstop == 4 ? 2 : 4
	let &tabstop = new_tab_size
	let &softtabstop = new_tab_size
endfunction
