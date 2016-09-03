" set iskeyword=@,48-57,_,192-255,#
iab <buffer> int var
iab <buffer> ,i++ ;i++
imap <buffer> ,<Space>i++ ;<Space>i++
iab <buffer> fori for (var i=0; i <; i++) {<Left><Left><Left><Left><Left><Left><Left><Left>
iab <buffer> forEach forEach( function(v, k) {<Return>});<Esc>k$a<Return><C-R>=Eatchar('(')<CR>
iab <buffer> each each( function(v, k) {<Return>});<Esc>k$a<Return><C-R>=Eatchar('(')<CR>
" <Left><Left><Left><Left><Left><Left><Left><Left>
"
" http://vimdoc.sourceforge.net/htmldoc/map.html#mapping
"
"
