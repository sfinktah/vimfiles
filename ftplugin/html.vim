" set iskeyword=@,48-57,_,192-255,#
" iab <buffer> int var
" iab <buffer> ,i++ ;i++
" imap <buffer> ,<Space>i++ ;<Space>i++
" iab <buffer> fori for (var i=0; i <; i++) {<Left><Left><Left><Left><Left><Left><Left><Left>
"
" http://vimdoc.sourceforge.net/htmldoc/map.html#mapping
" http://stackoverflow.com/questions/11507039/automatic-insertion-of-a-colon-after-def-if-etc
"
imap <buffer> <lt>style<Space>src= <lt>link rel="stylesheet" type="text/css" href="" /><Left><Left><Left><Left>
imap <buffer> <lt>script<Space>src= <lt>script type="text/javascript" src=""><lt>/script><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
imap <buffer> \utf8 <lt>meta http-equiv="content-type" content="text/html; charset=utf-8" />

