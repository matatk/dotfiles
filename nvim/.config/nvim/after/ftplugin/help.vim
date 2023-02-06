" FIXME: I would like this to be gO but it's a custom mapping already
if &columns < 91
  nmap <buffer> gL gO<C-w>L<C-w>30<Bar>
else
  nmap <buffer> gL gO<C-w>L<C-w>50<Bar>:set nu<CR>
endif

nnoremap <buffer> <CR> <C-]>
nnoremap <silent><buffer> q :q<CR>
nnoremap <buffer> + :resize 30+<CR>
nnoremap <buffer> > :vertical resize 78<CR>
nnoremap <buffer> L <C-w><C-p>:q<CR>
