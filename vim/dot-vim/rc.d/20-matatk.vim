"
" Bindings
" Info: http://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
"

noremap <F5> :GundoToggle<CR>
noremap <F6> :SemanticHighlightToggle<CR>
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>


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
"       Vundle already requires autocmd anyway.

" Use an indent of only two when editing HTML
autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Remove trailing whitespace for certain filetypes
autocmd BufWritePre *.py,*.js,*.coffee,*.html,*.xml,*.md,*.markdown :call Preserve("%s/\\s\\+$//e")<CR>


"
" General UI
"
set mouse=a
set number


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
nmap <leader>l :set list!<CR>


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
