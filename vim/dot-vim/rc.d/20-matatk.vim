"
" Bindings
" Info: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
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
" Toggling spell-checking
nmap <leader>s :set spell!<CR>
" Open a new tab (with explorer) in the directory of the current file
nmap <leader>e :tabnew %:h<CR>
" Open ToC for Markdown documents
nmap <leader>t :Toc<CR>
" Note: ColorV uses <leader>c* mappings.

" Tab navigation; http://vimcasts.org/episodes/working-with-tabs/
" FIXME: These don't work in console vim tabs
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


"
" Whitespace, Indentation and Non-printing characters
"

" Use four-space indentation with tabs by default
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


"
" Spelling
"

" Automatically do spell checking on certain filetypes
" http://robots.thoughtbot.com/vim-spell-checking
autocmd FileType text,markdown,html,gitcommit setlocal spell
autocmd FileType help setlocal nospell

" CHANGES files are text files
autocmd BufNewFile,BufRead CHANGES set filetype=text


"
" General UI
"
set mouse=a
set number
set spelllang=en_gb
set smartcase        " searches are only case-sensitive if the pattern is


"
" Filetype-specific
"

" WebAccessibilityToolbar uses files that are almost JavaScript
autocmd BufNewFile,BufRead *.ws set filetype=javascript

" When working with Markdown files, grok the YAML frontmatter
let g:vim_markdown_frontmatter=1
" Also start with the first fold (only) open (allwing for YAML as above)
" FIXME: for files with YAML this fails at the zr (it is not done)
autocmd FileType mkd normal ]]zrgg
autocmd FileType mkd :Toc


"
" Fugitive
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"

" Convenient 'up' command for navigation
autocmd User fugitive
	\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	\   nnoremap <buffer> .. :edit %:h<CR> |
	\ endif

" FIXME: this doesn't seem to work
autocmd BufReadPost fugitive://* set bufhidden=delete


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
