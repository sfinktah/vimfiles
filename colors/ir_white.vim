" Vim color file
" Converted from Textmate theme IR_White using Coloration v0.3.2 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "IR_White"

hi Cursor ctermfg=NONE ctermbg=248 cterm=NONE guifg=NONE guibg=#a7a7a7 gui=NONE
hi Visual ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#e0e0ed gui=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=244 ctermbg=254 cterm=NONE guifg=#808080 guibg=#e6e6e6 gui=NONE
hi VertSplit ctermfg=249 ctermbg=249 cterm=NONE guifg=#b5b5b5 guibg=#b5b5b5 gui=NONE
hi MatchParen ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi StatusLine ctermfg=232 ctermbg=249 cterm=bold guifg=#010101 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=232 ctermbg=249 cterm=NONE guifg=#010101 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=130 ctermbg=NONE cterm=NONE guifg=#a15001 guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=189 cterm=NONE guifg=NONE guibg=#e0e0ed gui=NONE
hi IncSearch ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#cdcdd8 gui=NONE
hi Search ctermfg=NONE ctermbg=188 cterm=NONE guifg=NONE guibg=#cdcdd8 gui=NONE
hi Directory ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi Folded ctermfg=245 ctermbg=15 cterm=NONE guifg=#898989 guibg=#ffffff gui=NONE

hi Normal ctermfg=232 ctermbg=15 cterm=NONE guifg=#010101 guibg=#ffffff gui=NONE
hi Boolean ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi Character ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi Comment ctermfg=245 ctermbg=NONE cterm=NONE guifg=#898989 guibg=NONE gui=NONE
hi Conditional ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi Constant ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi Define ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Float ctermfg=90 ctermbg=NONE cterm=NONE guifg=#8c008a guibg=NONE gui=NONE
hi Function ctermfg=130 ctermbg=NONE cterm=NONE guifg=#a15001 guibg=NONE gui=NONE
hi Identifier ctermfg=100 ctermbg=NONE cterm=NONE guifg=#877611 guibg=NONE gui=NONE
hi Keyword ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi Label ctermfg=36 ctermbg=NONE cterm=NONE guifg=#009f78 guibg=NONE gui=NONE
hi NonText ctermfg=231 ctermbg=231 cterm=NONE guifg=#f3f8fe guibg=#f2f2f2 gui=NONE
hi Number ctermfg=90 ctermbg=NONE cterm=NONE guifg=#8c008a guibg=NONE gui=NONE
hi Operator ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi PreProc ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi Special ctermfg=232 ctermbg=NONE cterm=NONE guifg=#010101 guibg=NONE gui=NONE
hi SpecialKey ctermfg=231 ctermbg=254 cterm=NONE guifg=#f3f8fe guibg=#e6e6e6 gui=NONE
hi Statement ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi StorageClass ctermfg=100 ctermbg=NONE cterm=NONE guifg=#877611 guibg=NONE gui=NONE
hi String ctermfg=36 ctermbg=NONE cterm=NONE guifg=#009f78 guibg=NONE gui=NONE
hi Tag ctermfg=130 ctermbg=NONE cterm=NONE guifg=#a15001 guibg=NONE gui=NONE
hi Title ctermfg=232 ctermbg=NONE cterm=bold guifg=#010101 guibg=NONE gui=bold
hi Todo ctermfg=245 ctermbg=NONE cterm=inverse,bold guifg=#898989 guibg=NONE gui=inverse,bold
hi Type ctermfg=58 ctermbg=NONE cterm=underline guifg=#646409 guibg=NONE gui=underline
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi rubyFunction ctermfg=130 ctermbg=NONE cterm=NONE guifg=#a15001 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi rubyConstant ctermfg=58 ctermbg=NONE cterm=NONE guifg=#646409 guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=36 ctermbg=NONE cterm=NONE guifg=#009f78 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi rubyInclude ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi rubyRegexp ctermfg=136 ctermbg=NONE cterm=NONE guifg=#9d7416 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=136 ctermbg=NONE cterm=NONE guifg=#9d7416 guibg=NONE gui=NONE
hi rubyEscape ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi rubyControl ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi rubyOperator ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi rubyException ctermfg=24 ctermbg=NONE cterm=NONE guifg=#016692 guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=58 ctermbg=NONE cterm=NONE guifg=#646409 guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=245 ctermbg=NONE cterm=NONE guifg=#898989 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi htmlTag ctermfg=25 ctermbg=NONE cterm=NONE guifg=#0067c2 guibg=NONE gui=NONE
hi htmlEndTag ctermfg=25 ctermbg=NONE cterm=NONE guifg=#0067c2 guibg=NONE gui=NONE
hi htmlTagName ctermfg=25 ctermbg=NONE cterm=NONE guifg=#0067c2 guibg=NONE gui=NONE
hi htmlArg ctermfg=25 ctermbg=NONE cterm=NONE guifg=#0067c2 guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=100 ctermbg=NONE cterm=NONE guifg=#877611 guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlKey ctermfg=130 ctermbg=NONE cterm=NONE guifg=#a15001 guibg=NONE gui=NONE
hi yamlAnchor ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi yamlAlias ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=36 ctermbg=NONE cterm=NONE guifg=#009f78 guibg=NONE gui=NONE
hi cssURL ctermfg=60 ctermbg=NONE cterm=NONE guifg=#696989 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=94 ctermbg=NONE cterm=NONE guifg=#7a7025 guibg=NONE gui=NONE
hi cssColor ctermfg=59 ctermbg=NONE cterm=NONE guifg=#333366 guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=130 ctermbg=NONE cterm=NONE guifg=#bc4d00 guibg=NONE gui=NONE
hi cssClassName ctermfg=130 ctermbg=NONE cterm=NONE guifg=#bc4d00 guibg=NONE gui=NONE
hi cssValueLength ctermfg=90 ctermbg=NONE cterm=NONE guifg=#8c008a guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=52 ctermbg=NONE cterm=NONE guifg=#582b00 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE