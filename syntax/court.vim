" Vim syntax file
" Language: crt screenplay
" File: .crt, .spmd, .txt
" Reference: http://crt.io/
" Maintainer:   Carson Fire <carsonfire@gmail.com>
" Last Change:  February 20, 2012
" Version: 2.02


" :syntax include @CPP syntax/cpp.vim
" :syntax region cppSnip matchgroup=Snip start="@begin=cpp@" end="@end=cpp@" contains=@CPP
" :hi link Snip SpecialComment

if exists("b:current_syntax")
  finish
endif
syn sync minlines=200


syn   match      crtSection1           "^\s*# \(\_[^#]\)" fold transparent contains=ALL

syn   match      crtParenthetical      "^\s*\((.*)\)$" contained contains=crtBoneyard,crtNotes

syn   match      crtTransition         "^\(\L\)* TO:$" contains=crtBoneyard,crtNotes

syn   match      crtTransitionForced   "^\s*[<>]\(.*\)" contains=crtBoneyard,crtNotes
syn   match      crtCentered           "^\s*>\(.*\)<" contains=crtBoneyard,crtNotes

syn   match      crtUnderlined         "_[^_]*_"
syn   match      crtItalic             "\*[^\*]*\*"
syn   match      crtBold               "\*\*[^\*]*\*\*"
syn   match      crtBoldItalic         "\*\*\*[^\*]*\*\*\*"
syn   match      crtPagebreak          "^===[=]*$"

syn   match      xLineContinue         "\\$" contained

" syn   region     crtDialogue           matchgroup=crtCharacter start="^\(\L\)\+:\s\+" end="\s*$" contains=crtCharacter,crtParenthetical,crtBoneyard,crtNotes,crtEmphasis
syn   match      crtCharacter          "^\(\L\)\+:\s\s\+"
" syn   region     crtDialogue           matchgroup=crtCharacter start="^\(\L\)\+:\s\+" end="^\(\L\{3,\}\)" contains=crtCharacter,crtParenthetical,crtBoneyard,crtNotes,crtEmphasis 
" keepend

" \% matches a page thing, eg \%^ start of document, \%$ end of document
syn   region     crtTitlePage          start="\%^\(.*\):" end="^$" contains=crtBoneyard,crtNotes
syn   region     crtNotes              start="\[\[" end="\]\]" contains=xLineContinue
syn   region     crtHeader1            start="^\s*# " end="$" contains=crtBoneyard,crtNotes
syn   region     crtHeader2            start="^\s*## " end="$" contains=crtBoneyard,crtNotes
syn   region     crtHeader3            start="^\s*### " end="$" contains=crtBoneyard,crtNotes
syn   region     crtHeader4            start="^\s*#### " end="$" contains=crtBoneyard,crtNotes
syn   region     crtHeader5            start="^\s*##### " end="$" contains=crtBoneyard,crtNotes
syn   region     crtHeader6            start="^\s*###### " end="$" contains=crtBoneyard,crtNotes
syn   region     crtSynopses           start="^\s*= " end="$" contains=crtBoneyard,crtNotes
syn   region     crtSceneHeading       start="^\s*\(\.\|INT\. \|EXT\. \|INT\./EXT\. \|INT/EXT\. \|INT \|EXT \|INT/EXT \|I/E \|int\. \|ext\. \|int\./ext\. \|int/ext\. \|int \|ext \|int/ext \|i/e \)" end="$" contains=crtSceneNumber,crtBoneyard,crtNotes
syn   region     crtExhibit            start="^#\(\L\+\)[^#]*$" end="$" 
syn   region     crtBoneyard           start="/\*" end="\*\/" contains=xLineContinue
syn   region     crtSceneNumber        start="#" end="#" contained


" " http://www.openlogic.com/wazi/bid/188101/Create-Your-Own-Syntax-Highlighting-in-Vim
" syn region todoWork start=/^w: / end=/$/
" syn region todoPersonal start=/^p: / end=/$/
" " syn match todoEmail "[a-zA-Z0-9._-]\+@[a-zA-Z0-9./-]\+"
" syn match todoEmail ":\(.*\)$"
" highlight link todoEmail    Identifier
" syn region codeBlock	start=/\(:\)/ end=/\(:\)/
" syn match dialog contained "[a-zA-Z._, -]\+"
" " syn region todoHome start="^\L\{3,\}" end=/  /
" " syn region todoHome start="^\L\{3,\}" end=/  / contains=dialog
" syn region todoHome start="^\L\{3,\}" end=/  / nextgroup=codeBlock
" " If the definition of the contained element also includes an end-of-line
" " character (here, it doesn't), add keepend at the end of the syntax
" " definition to avoid the end-of-line being "swallowed" and the containing
" " element running over into the next line
" 
" 
" highlight link codeBlock	Gray2
" highlight link todoHome     Type
" highlight link todoWork     String
" highlight link dialog     DarkAmber
" highlight link todoPersonal Statement

syn region crtWhip	start=/\(---\)/ end=/\(---\|$\)/


" hi def link crtCharacter                Green1
" hi def link crtDialogue                 Gray5
" hi def link crtExhibit                  Inverse5
" hi def link crtWhip						LightAmber
hi crtCharacter	cterm=bold
hi crtExhibit cterm=bold,italic
hi crtWhip cterm=italic

"
" was 14

" hi crtCharacter ctermfg=7
" hi crtDialog ctermfg=5
hi def link crtCentered	character
hi def link crtNotes	comment
hi def link crtPagebreak	conditional
hi def link crtParenthetical	function
hi def link crtHeader1	htmlH1
hi def link crtHeader2	htmlH2
hi def link crtHeader3	htmlH3
hi def link crtHeader4	htmlH4
hi def link crtHeader5	htmlH5
hi def link crtHeader6	htmlH6
hi def link crtBoneyard	nontext
hi def link crtActionForced	normal
hi def link crtSceneNumber	number
hi def link crtSynopses	number
hi def link crtSceneHeading	title
hi def link crtTitlePage	title
hi def link crtTransition	todo
hi def link crtTransitionForced	todo
" Shades of white in dw_green
" 4 12
" 5 13
" 6 14
"   15
"
" 7 and 8  are the two shades of amber
hi                                      crtUnderlined                           ctermbg=7
hi                                      crtItalic                               ctermfg=7
hi                                      crtBold                                 ctermfg=8
hi                                      crtBoldItalic                           gui=bold,italic cterm=bold,italic

let b:current_syntax = "crt"
" vim: set ts=4 sts=0 sw=4 noet:
