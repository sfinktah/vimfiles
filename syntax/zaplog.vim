
if exists("b:current_syntax")
 finish
endif

syn match tarComment '^".*' contains=tarFilename
syn match tarFilename 'tarfile \zs.*' contained
syn match tarDirectory '.*/$'

hi def link tarComment	Comment
hi def link tarFilename	Constant
hi def link tarDirectory Type


syn match zdebug '^debug\t.*'
syn match zdebug '^d .*'

syn match zresxt "^\" .*"
" syn match zresmsg "^\# .*"
" syn match zresxtmsg "^\# <msg t='xt'>.*"
" syn match zresmsg "^\# <msg t='sys'>.*"

syn match zresxt "^res: %xt"
syn match zresmsg "^res: <msg"
syn match zreq "^req: <"

" "integer number, or floating point number without a dot.
" syn match  basicNumber		"\<\d\+\>"
" "floating point number, with dot
" syn match  basicNumber		"\<\d\+\.\d*\>"
" "floating point number, starting with a dot
" syn match  basicNumber		"\.\d\+\>"
" 
" " String and Character contstants
" syn match   basicSpecial contained "\\\d\d\d\|\\."
" syn region  basicString		  start=+"+  skip=+\\\\\|\\"+  end=+"+  contains=basicSpecial
syn match zresmsg contained "^\# .*"
syn region  roomId			start="='" skip="='" end="'>" contains=zresmsg
" syn region  basicComment	start="^[ \t]*'" end="$" contains=basicTodo
" syn region  basicLineNumber	start="^\d" end="\s"
" syn match   basicTypeSpecifier  "[a-zA-Z0-9][\$%&!#]"ms=s+1
" " Used with OPEN statement
" syn match   basicFilenumber  "#\d\+"
" "syn sync ccomment basicComment
" " syn match   basicMathsOperator "[<>+\*^/\\=-]"
" syn match   basicMathsOperator   "-\|=\|[:<>+\*^/\\]\|AND\|OR"


hi def link zdebug Comment 
hi def link zresmsg Constant 
hi def link zres Identifier 
hi def link zresxt Identifier
hi def link zresxtmsg PreProc

hi def link zreq Statement
hi def link zconnect PreProc 
hi def link roomId Todo 


"        *Comment        any comment
"        *Constant       any constant
"        *Identifier     any variable name
"        *Statement      any statement
"        *PreProc        generic Preprocessor
"        *Type           int, long, char, etc.
"        *Special        any special symbol
"        *Underlined     text that stands out, HTML links
"        *Ignore         left blank, hidden
"        *Error          any erroneous construct
"        *Todo           anything that needs extra attention; mostly the

" "   HiLink httpHost Comment
" "   HiLink httpUnknown PreProc
" "   HiLink httpId Exception
" "   HiLink httpDate String
" "   HiLink httpCommand Statement
" "   HiLink httpResult Type
" "   HiLink httpSize Number
" "   HiLink httpReferer Function
" "   HiLink httpBrowser Boolean
" "   HiLink httpRobot Debug
" "   HiLink httpIgnore Debug
"   delcommand HiLink
" endif
" 
