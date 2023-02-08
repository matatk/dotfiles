" Bring up the ToC as a vertical window on the right-hand side, with a width
" that fits the terminal size.
" NOTE: I would like this to be gO but it's a custom mapping already.
if &columns < 91
  noremap <buffer> gL gO<C-w>L<C-w>30<Bar>
else
  noremap <buffer> gL gO<C-w>L<C-w>50<Bar>:set nu<CR>
endif

" Follow links with <Return>
nnoremap <buffer> <CR> <C-]>
" Just q to close help (same as with quickfix) windows
nnoremap <silent><buffer> q :q<CR>
" Use + to make the help window tall
nnoremap <buffer> + :resize 30+<CR>
" Use > to expand the help window fully wide-wise
nnoremap <buffer> > :vertical resize 78<CR>
" Use L to close the ToC (the previous window)
nnoremap <buffer> L <C-w><C-p>:q<CR>
