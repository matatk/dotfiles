" TODO: override LSP formatting key
function CleanUp()
	silent %!isort - -q --profile black
	silent %!black - -q
endfunction

nnoremap <buffer><silent> <leader>p :call CleanUp()<cr>
