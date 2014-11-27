"
" Bindings
" Info: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"

" Toggling Gundo
noremap <F5> :GundoToggle<CR>
" Toggling Semantic Highlighting
noremap <F6> :SemanticHighlightToggle<CR>
" Showing whitespace characters
nmap <leader>l :set list!<CR>
" Removing trailing whitespace
nmap <leader>$ :call RemoveTrailingWhitespace()<CR>
" Indenting the whole file
nmap <leader>= :call Preserve("normal gg=G")<CR>
" Toggling spell-checking
nmap <silent> <leader>s :set spell!<CR>


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


"
" Colours
"

"let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


"
" Filetype-specific stuff
"
" Note: in theory, should use an 'if has("autocmd")' block here, but
"       Vundle already seems to require autocmd anyway.

" Use an indent of only two spaces when editing HTML
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Automatically do spell checking on certain filetypes
" http://robots.thoughtbot.com/vim-spell-checking
autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell
autocmd FileType gitcommit setlocal spell

" Remove trailing whitespace for certain filetypes
autocmd BufWritePre *.py,*.js,*.coffee,*.html,*.xml,*.md,*.markdown :call RemoveTrailingWhitespace()

"
" General UI
"
set mouse=a
set number
set spelllang=en_gb


"
" Whitespace
"

" Use four-space indentation by default
" Thanks http://vimcasts.org/episodes/tabs-and-spaces/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Show whitespace
" http://stackoverflow.com/a/1675752
" http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬


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

" DRY trailing whitespace removal
function! RemoveTrailingWhitespace()
    call Preserve("%s/\\s\\+$//e")
endfunction
