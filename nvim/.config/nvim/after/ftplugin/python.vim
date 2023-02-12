" TODO: override LSP formatting key
function CleanUp()
	silent %!isort - -q
	silent %!black - -q
endfunction

nnoremap <buffer><silent> <leader>p :call CleanUp()<cr>
