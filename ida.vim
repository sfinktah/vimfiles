" Vim syntax file;
" Language:	IDA
" Maintainer:	Robert Klep <robert@ilse.nl>
" Last change:	2000 Mar 29

" Remove any old syntax stuff hanging around
syn clear

" the following parameters are available for tuning the syntax highlighting
let ida_no_sync_on_sub = 1
"let ida_sync_dist = 100

" comments
syn match  idaComment         	"^#.*" contains=idaTodo

" Syncing to speed up processing
if !exists("ida_no_sync_on_sub")
  syn sync match idaSync grouphere NONE "^function\s*("
endif

if exists("ida_sync_dist")
  execute "syn sync maxlines=" . ida_sync_dist
else
  syn sync maxlines=100
endif

syn keyword idaTodo 	contained TODO TBD FIXME XXX
syn keyword idaSection	_section _subsection _subsubsection _p _chapter
syn keyword idaModifier	_b _i _em
syn keyword idaList	_list _item _ul _ol
syn keyword idaSpecial	_title _author _pre
syn match   idaSSpecial "\\"
" syn match   idaFunction 	"_[a-zA-Z0-9_*]\+"

if !exists("did_ida_syntax_inits")
  let did_ida_syntax_inits = 1

  hi link idaTodo  		Todo
  hi link idaSection		Include
  hi link idaModifier		Operator
  hi link idaList		Type
  hi link idaSpecial		String
  hi link idaSSpecial		String

"   hi link idaLabel		Label
"   hi link idaConditional	Conditional
"   hi link idaRepeat		Repeat
"   hi link idaOperator		Operator
"   hi link idaCharacter		Character
"   hi link idaNumber		Number
"   hi link idaClassDecl		Typedef
"   hi link idaInclude		Include
"   hi link idaControl		PreProc
"   hi link idaStatement		Statement
"   hi link idaType		Type
"   hi link idaString		String
"   hi link idaShellCommand     	Special
"   hi link idaComment		Comment
"   hi link idaSpecial		Special
"   hi link idaTodo		Todo
"   hi link idaFunction		Function
"   hi link idaIdentifier		Identifier
endif

let b:current_syntax = "ida"
set ts=2
set sw=2
set formatoptions=croqlv 

" vim: ts=8
