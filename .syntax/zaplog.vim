
if exists("b:current_syntax")
 finish
endif

syn match tarComment '^".*' contains=tarFilename
syn match tarFilename 'tarfile \zs.*' contained
syn match tarDirectory '.*/$'

hi def link tarComment	Comment
hi def link tarFilename	Constant
hi def link tarDirectory Type


syn match zdebug '^debug.*'
syn match zresmsg "^resmsg.*"
syn match zresxt "^resxt.*"
syn match zzapwrite "^zapwrite.*"
syn match zconnect "^connect.*"
syn match zerror "^error.*"
syn match zres "^res: .*"
syn match zreq "^req: .*"

hi def link zdebug Comment 
hi def link zresmsg Constant 
hi def link zres Constant 
hi def link zresxt Identifier
hi def link zzapwrite Statement 
hi def link zreq Statement 
hi def link zconnect PreProc 
hi def link zerror Todo 

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
