function! s:CoffeeObjectToClass()
	exec ":%s/^  \(\w\+\) = \(([^)]\+)\)\?/  \1: \2"
endfunction
com! CoffeeObjectToClass call s:CoffeeObjectToClass()

function! s:CoffeeObjectToClassExtraIndent()
	exec ":%s/^  \(\w\+\) = \(([^)]\+)\)\?/  \1: \2"
endfunction
com! CoffeeObjectToClassExtraIndent call s:CoffeeObjectToClassExtraIndent()

set keywordprg=jsman
