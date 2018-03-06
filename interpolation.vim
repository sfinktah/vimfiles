function! s:TidyXmlLine()
"	" Store indentation
"	let l:oldcinoptions = &cinoptions
"	" Set new indentation
"	let &cinoptions=g:DoxygenToolkit_cinoptions
"
"	" Test authorName variable
"	if !exists("g:DoxygenToolkit_authorName")
"		let g:DoxygenToolkit_authorName = input("Enter name of the author (generally yours...) : ")
"	endif
"	mark d
"	let l:date = strftime("%Y")

	exec ":.!qtidy.sh tidy -xml -q -i -w 0 2>&1 | grep -v 'Warning:'"
endfunction

function! s:RefactorIndexOf()
   exec "%s/\~\(.\{\-\}\.indexOf([^)]\+)\)/(\1 > -1)/g"
endfunction

function! s:TabSwap()
	exec ":%s/\\(.*\\)\\t\\(.*\\)/\\2\\t\\1/"
endfunction

function! s:TidyHtml()
	exec ":%!qtidy.sh tidy -c -config ~/.tidyrc -q -i -w 0 2>&1 | grep -v 'Warning:'"
endfunction

function! s:TidyXmlLineCDATA()
	exec ":s/<!\\[CDATA\\[//g"
	exec ":s/\\]\\]>//g"
	call s:TidyXmlLine()
endfunction

function! s:PhpLint()
	exec "%!php-vim-lint"
endfunction

function! s:TidyXmlTamperData()
	exec "%!egrep -v '^</?root>'"
	exec "%!tidy -xml -i -w 0 -q 2>&1; cd"
	exec "1,$ s/<tdRequest /<!-- {{{ -->&/"
	exec "1,$ s/<\\/tdRequest>/<!-- }}} -->&/"
endfunction

function! s:GlobalDocument()
	exec "%!/Users/cyrus/dev/tank/globalpreg.php"
endfunction

function! s:GlobalLine()
	exec ":.!/Users/cyrus/dev/tank/globalpreg.php"
endfunction

function! s:GlobalSelection()
	exec ":'<,'>!/Users/cyrus/dev/tank/globalpreg.php"
endfunction
	
function! s:TidyXmlHttpAnalyzer()
	exec "%!tidy -xml -i -w 0 -q 2>&1; cd"
	exec "1,$ s/<entry /<!-- {{{ -->&/"
	exec "1,$ s/<\\/entry>/<!-- }}} -->&/"
endfunction

function! s:interpolate()
   " exec ":.!php -r 'echo preg_replace_callback(\"/\#\{(.+?)\}/\", function ($matches) { return \"\\" + {$matches[1]} + \\"\"; }, file_get_contents(\"php://stdin\"));\"'"
   " php -r 'echo preg_replace_callback("/" . chr(0x23) . "\{(.+?)\}/", function ($matches) { return chr(0x22) . " + ${matches[1]} + " . chr(0x22); }, file_get_contents("php://stdin"));'
   " php -r 'echo preg_replace_callback(\"/\" . chr(0x23) . \"\\{(.+?)\\}/\", function ($matches) { return chr(0x22) . \" + ${matches[1]} + \" . chr(0x22); }, file_get_contents(\"php://stdin\"));'
   "
   " console.log("(job " + job.length + " @{job.length}");
   exec ":.!php -r 'echo preg_replace_callback(chr(0x2f) . chr(0x23) . chr(0x7b) . \"(.+?)}/\", function ($matches) { return chr(0x22) . \" + ${matches[1]} + \" . chr(0x22); }, file_get_contents(\"php://stdin\"));'"
   " exec ":.!php -r 'echo preg_replace_callback(\"/\" . chr(0x23) . \"\\{(.+?)\}/\", function ($matches) { return chr(0x22) . \" + ${matches[1]} + \" . chr(0x22); }, file_get_contents(\"php://stdin\"));'"
   " exec ".!php -r 'eval(urldecode(\"echo+preg_replace_callback\\%28\\%22\\%2F\\%23\\%5C\\%7B\\%28.\\%2B\\%3F\\%29\\%5C\\%7D\\%2F\\%22\\%2C+function+\\%28\\%24matches\\%29+\\%7B+return+\\%22\\%5C\\%22+\\%2B+\\%7B\\%24matches\\%5B1\\%5D\\%7D+\\%2B+\\%5C\\%22\\%22\\%3B+\\%7D\\%2C+file_get_contents\\%28\\%22php\\%3A\\%2F\\%2Fstdin\\%22\\%29\\%29\\%3B\\%0A\"));'"
endfunction

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

function! s:SynStackList()
	for id in synstack(line("."), col("."))
		echo synIDattr(id, "name")
	endfor
endfunction
com! SynStackList call s:SynStackList()

function! s:RemoveJmps()
	exec ":%s/.*jmp.*\\n.*:\\s*$\\n"
endfunction
com! RemoveJmps call s:RemoveJmps()

function! s:CoffeeObjectToClass()
	exec ":%s/^  \(\w\+\) = \(([^)]\+)\)\?/  \1: \2"
endfunction
com! CoffeeObjectToClass call s:CoffeeObjectToClass()

function! s:CoffeeObjectToClassExtraIndent()
	exec ":%s/^  \(\w\+\) = \(([^)]\+)\)\?/  \1: \2"
endfunction
com! CoffeeObjectToClassExtraIndent call s:CoffeeObjectToClassExtraIndent()

function! s:JSDocFixReversedParams()
	exec ":%s/\\* \\(@param\\) \\(\\w\\+\\) \\({[^}]\\+}\\)/* \\1 \\3 \\2"
endfunction
com! JSDocFixReversedParams call s:JSDocFixReversedParams()

function! s:YCM()
	exec ":let g:loaded_youcompleteme = 0"
	exec ":Bundle 'Valloric/YouCompleteMe'"
endfunction
com! YCM call s:YCM()

function! s:JSAddSpaceCommas()
	exec ":%s/\\(\\w\\+\\),\\(\\w\\+\\)/\\1, \\2/g"
	exec ":%s/\\(\\w\\+\\),\\(\\w\\+\\)/\\1, \\2/g"
endfunction
com! JSAddSpaceCommas call s:JSAddSpaceCommas()

function! s:JSAddSpaceComments()
	exec ":%s/\\([^ ]\\)\\/\\//\\1 \\/\\/ "
endfunction
com! JSAddSpaceComments call s:JSAddSpaceComments()

function! s:JSDocFixParamOrder()
	exec "%s/@\\(param\\) \\(\\w\\+\\|\\[[^]]\\+]\\) \\({[^}]\\+}\\)/@\\1 \\3 \\2"
endfunction
com! JSDocFixParamOrder call s:JSDocFixParamOrder()

function! s:FindD3Function(fn)
	" exec "/\\C\\(\\<\\(\\w\\+_\\)\\?".a:fn."\\>.*=.*function\\|\\<function\\>[^(]\\+\\<\\(\\w\\+_\\)\\?".a:fn."\\>\\)"
  " /\C\(\<\(\w\+_\)\?\>.*=.*function\|\<function\>[^(]\+\<\(\w\+_\)\?\>\)
endfunction
com! FindD3Function call s:FindD3Function()

" nnoremap * :'<,'>s/\C\<<c-r><c-w>\>//g<c-f>$F/i
""" nnoremap 	exec "/\\C\\(\\<\\(\\w\\+_\\)\\?".a:fn."\\>.*=.*function\\|\\<function\\>[^(]\\+\\<\\(\\w\\+_\\)\\?".a:fn."\\>\\)"

:map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

function! s:HitTab()
	let key = "\<Tab>"
	let cmd = key
	silent! exe cmd
endfunction
com! HitTab call s:HitTab()


function! s:HitTab2()
	call feedkeys("ccfun\<CR>test\<Tab>\<Tab>\<Tab>")
endfunction
com! HitTab2 call s:HitTab2()

function! HitTab3()
	call feedkeys("\<Tab>")
endfunction

function! UExpand()
python << EOF
import sys, vim
from UltiSnips import UltiSnips_Manager
UltiSnips_Manager.expand()
UltiSnips_Manager.jump_forwards()
EOF
return ""
endfunction
" com! UExpand call UExpand()
" imap <F4> <ESC>:call UExpand()<CR>

function! s:Function()
	exec ":s/\\(^\\s\\+\\)\\(.\\{-\\}\\)\\.\\(\\w\\+\\) = \\(function\\)\\(([^)]\\+)\\)/\\1 \\4 \\3\\5"
endfunction
com! Function call s:Function()


" http://stackoverflow.com/questions/2683521/vim-search-in-c-c-code-lines
function! SearchWithSkip(pattern, flags, stopline, timeout, skip)
"
" Returns true if a match is found for {pattern}, but ignores matches
" where {skip} evaluates to false. This allows you to do nifty things
" like, say, only matching outside comments, only on odd-numbered lines,
" or whatever else you like.
"
" Mimics the built-in search() function, but adds a {skip} expression
" like that available in searchpair() and searchpairpos().
" (See the Vim help on search() for details of the other parameters.)
" 
    " Note the current position, so that if there are no unskipped
    " matches, the cursor can be restored to this location.
    "
    let l:matchpos = getpos('.')

    " Loop as long as {pattern} continues to be found.
    "
    while search(a:pattern, a:flags, a:stopline, a:timeout) > 0

        " If {skip} is true, ignore this match and continue searching.
        "
        if eval(a:skip)
            continue
        endif

        " If we get here, {pattern} was found and {skip} is false,
        " so this is a match we don't want to ignore. Update the
        " match position and stop searching.
        " 
        let l:matchpos = getpos('.')
        break

    endwhile

    " Jump to the position of the unskipped match, or to the original
    " position if there wasn't one.
    "
    call setpos('.', l:matchpos)

endfunction

function! SearchOutside(synName, pattern)
"
" Searches for the specified pattern, but skips matches that
" exist within the specified syntax region.
"
    call SearchWithSkip(a:pattern, '', '', '',
        \ 'synIDattr(synID(line("."), col("."), 0), "name") =~? "' . a:synName . '"' )

endfunction


function! SearchInside(synName, pattern)
"
" Searches for the specified pattern, but skips matches that don't
" exist within the specified syntax region.
"
    call SearchWithSkip(a:pattern, '', '', '',
        \ 'synIDattr(synID(line("."), col("."), 0), "name") !~? "' . a:synName . '"' )

endfunction

command! -nargs=+ -complete=command SearchOutside call SearchOutside(<f-args>)
command! -nargs=+ -complete=command SearchInside  call SearchInside(<f-args>)

function! s:SwapQuotes()
	exec "s/\"/__DBL_QUOTE__/g"
	exec "s/'/\"/g"
	exec "s/__DBL_QUOTE__/'/g"
endfunction
com! SwapQuotes call s:SwapQuotes()
com! QuoteSwap  call s:SwapQuotes()




" "This is a #{test}"
command! -bar RefactorIndexOf :call <SID>RefactorIndexOf()
command! -bar Interpolate :call <SID>interpolate()
command! -bar PhpLint :call <SID>PhpLint()
command! -bar GlobalDocument :call <SID>GlobalDocument()
command! -bar GlobalLine :call <SID>GlobalLine()
command! -bar GlobalSelection :call <SID>GlobalSelection()
command! -bar TidyHtml :call <SID>TidyHtml()
command! -bar TidyXmlLine :call <SID>TidyXmlLine()
command! -bar TidyXmlLineCDATA :call <SID>TidyXmlLineCDATA()
command! -bar TidyXmlTamperData :call <SID>TidyXmlTamperData()
command! -bar TidyXmlHttpAnalyzer :call <SID>TidyXmlHttpAnalyzer()
command! -bar TabSwap :call <SID>TabSwap()
