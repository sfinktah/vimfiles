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
