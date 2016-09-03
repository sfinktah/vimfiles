" set iskeyword=@,48-57,_,192-255,#
" some examples i did for javascript
" iab <buffer> int var
" iab <buffer> ,i++ ;i++
" imap <buffer> ,<Space>i++ ;<Space>i++
" iab <buffer> fori for (var i=0; i <; i++) {<Left><Left><Left><Left><Left><Left><Left><Left>
"
" http://vimdoc.sourceforge.net/htmldoc/map.html#mapping
"
imap <buffer> {$ ${

" set iskeyword=@,48-57,_,192-255,#
" iab <buffer> int var
" iab <buffer> ,i++ ;i++
" imap <buffer> ,<Space>i++ ;<Space>i++
" iab <buffer> fori for (var i=0; i <; i++) {<Left><Left><Left><Left><Left><Left><Left><Left>
" iab <buffer> forEach forEach( function(v, k) {<Return>});<Esc>k$a<Return><C-R>=Eatchar('(')<CR>
" iab <buffer> each each( function(v, k) {<Return>});<Esc>k$a<Return><C-R>=Eatchar('(')<CR>
" <Left><Left><Left><Left><Left><Left><Left><Left>
"
" http://vimdoc.sourceforge.net/htmldoc/map.html#mapping
"
"
"
"
fun! GetVarName()
    let val = input("Enter the varname: ")
    exec "ia" val StringChar
endfun

func! JAVA_EatChar(pat)
  let c=nr2char(getchar())
  return (c =~ a:pat) ? '' : c
endfunc
" echo "iab" a:abbr a:val

func! JAVA_insert_p()
  exec "normal i \e"
  let modeVal=synIDattr( synIDtrans( synID(line("."), col("."), 0)), "name")
  return modeVal!=?"Constant" && modeVal!=?"Comment"
endfunc

func! JAVA_replace(name, repl)
  if JAVA_insert_p()
    exec a:repl
    return ""
  else
    exec a:name
    return " "
  endif
endfunc

" iabbrev <silent> <buffer> for for<C-R>=JAVA_replace("", "normal i(){\n}\ekf(\el")<CR><C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> fori for(int i=0;;i++){<CR>}<Esc>k^f;a<C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> forint for(int){<CR>}<Esc>kf)i
" iabbrev <silent> <buffer> foriti for(Iterator i=;i.hasNext();){<CR>}<Esc>kf=a<C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> forit for(Iterator){<CR>}<Esc>kf)i
" iabbrev <silent> <buffer> while while<C-R>=JAVA_replace("", "normal i(){\n}\ekf(\el")<CR><C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> sysout <C-R>=JAVA_replace("normal isysout", "normal iSystem.out.println();\eF)")<CR><C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> syserr <C-R>=JAVA_replace("normal isyserr", "normal iSystem.err.println();\eF)")<CR><C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> privfun private(){<CR>}<Esc>kf(i
" iabbrev <silent> <buffer> pubfun public(){<CR>}<Esc>kf(i
" iabbrev <silent> <buffer> profun protected(){<CR>}<Esc>kf(i
" iabbrev <silent> <buffer> tryc try{<CR>}catch(){}<Esc>F)i<C-R>=JAVA_EatChar('\s')<CR>
" iabbrev <silent> <buffer> trya try{<CR>}catch(Exception e){}<Esc>O<C-R>=JAVA_EatChar('\s')<CR>

" iabbrev <silent> <buffer> localvar <C-R>=JAVA_replace("normal localvar", "normal i(){\n}\ekf(\el")<CR><C-R>=JAVA_EatChar('\s')<CR>

