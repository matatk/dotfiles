" Thanks https://github.com/ekawa/conf/blob/master/vim/.vim/after/indent/applescript.vim
setlocal autoindent
setlocal indentexpr=GetApplescriptIndent()
setlocal indentkeys=!^F,o,O,0=end

"setlocal expandtab
"setlocal tabstop<
"setlocal softtabstop=2
"setlocal shiftwidth=2

let b:undo_indent = 'setlocal '.join([
	\   'autoindent<',
	\   'expandtab<',
	\   'indentexpr<',
	\   'indentkeys<',
	\   'shiftwidth<',
	\   'softtabstop<',
	\   'tabstop<',
	\ ])

function! GetApplescriptIndent()
	let plnum = prevnonblank(v:lnum - 1)
	let pplnum = prevnonblank(plnum-1)

	if getline(plnum) =~# '¬$'
		if getline(pplnum) !~# '¬$'
			return indent(plnum) + &l:shiftwidth*2
		endif
	elseif getline(pplnum) =~# '¬$'
		return indent(plnum) - &l:shiftwidth*2
	endif

	if getline(plnum) =~# '\v^\s*<tell>(.*to)@!'  " matatk: check 'to'
		return indent(plnum) + &l:shiftwidth
	endif

	" Added by matatk: 'on' blocks and multi-line 'if's should indent
	" FIXME: 'else' clauses should step back an indent for that line
	if getline(plnum) =~# '\v^\s*<on>.*'
		return indent(plnum) + &l:shiftwidth
	endif
	if getline(plnum) =~# '\v\s*<if>.*<then>$'
		return indent(plnum) + &l:shiftwidth
	endif

	if getline(v:lnum) =~# '\v^\s*<end>.*'
		return indent(plnum) - &l:shiftwidth
	endif

	" Added by matatk: else branches
	"if getline(v:lnum) =~# '\v^\s*<else>.*'
	"	return indent(plnum) - &l:shiftwidth
	"endif

	return indent(prevnonblank(v:lnum-1))
endfunction
