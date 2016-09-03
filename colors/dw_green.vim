"--------------------------------------------------------------------
" Name Of File: dw_green.vim.
" Description: Gvim colorscheme, designed against VIM 7.0 GUI
" By: Steve Cadwallader
" Contact: demwiz@gmail.com
" Credits: Inspiration from the brookstream and redblack schemes.
" Last Change: Saturday, September 17, 2006.
" Installation: Drop this file in your $VIMRUNTIME/colors/ directory.
"--------------------------------------------------------------------

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="dw_green"

"--------------------------------------------------------------------
" DiffDelete    cterm=bold ctermfg=4 ctermbg=6
" 0 0 0
" 8 1 8
" 1 2 1
" 9 3 9
" 2 4 2
" 10 5 10
" 3 6 3
" 11 7 11
" 4 8 4
" 12 9 12
" 5 10 5
" 13 11 13
" 6 12 6
" 14 13 14
" 7 14 7
" 15 15 15

hi CursorColumn	ctermbg=0
hi CursorLine	ctermbg=8

hi ErrorMsg	ctermbg=15	ctermfg=0
hi IncSearch	ctermbg=2	ctermfg=0
hi Search	ctermbg=3	ctermfg=0
hi StatusLine	ctermbg=1	ctermfg=0
hi StatusLineNC	ctermbg=5	ctermfg=0
hi TabLine	ctermbg=5	ctermfg=0
hi TabLineSel	ctermbg=9	ctermfg=0
hi Visual	ctermbg=10	ctermfg=0
hi WarningMsg	ctermbg=6	ctermfg=0

hi LineNr	ctermbg=0	ctermfg=1

hi Boolean	ctermbg=0	ctermfg=2
hi Identifier	ctermbg=0	ctermfg=2
hi String	ctermbg=0	ctermfg=2

hi Constant	ctermbg=0	ctermfg=3
hi DiffAdd	ctermbg=12	ctermfg=3
hi DiffChange	ctermbg=12	ctermfg=3
hi DiffDelete	ctermbg=12	ctermfg=3
hi Directory	ctermbg=0	ctermfg=3
hi Function	ctermbg=0	ctermfg=3
hi MatchParen	ctermbg=4	ctermfg=3
hi ModeMsg	ctermbg=0	ctermfg=3
hi MoreMsg	ctermbg=0	ctermfg=3
hi Question	ctermbg=0	ctermfg=3
hi SpecialKey	ctermbg=0	ctermfg=3
hi Statement	ctermbg=0	ctermfg=3
hi Title	ctermbg=0	ctermfg=3
hi cDefine	ctermbg=0	ctermfg=3

hi FoldColumn	ctermbg=4	ctermfg=7
hi Folded	ctermbg=4	ctermfg=7

hi Comment	ctermbg=0	ctermfg=13
hi Operator	ctermbg=0	ctermfg=13

hi Normal	ctermbg=0	ctermfg=14

hi Cursor	ctermbg=5	ctermfg=15
hi DiffText	ctermbg=12	ctermfg=15
hi NonText	ctermbg=0	ctermfg=15
hi PreProc	ctermbg=0	ctermfg=15
hi SignColumn	ctermbg=11	ctermfg=15
hi Special	ctermbg=0	ctermfg=15
hi TabLineFill	ctermbg=0	ctermfg=15
hi Todo	ctermbg=7	ctermfg=15
hi Type	ctermbg=0	ctermfg=15
hi VertSplit	ctermbg=0	ctermfg=15
hi cInclude	ctermbg=0	ctermfg=15

hi LightAmber	ctermfg=8
hi DarkAmber	ctermfg=7

hi Green1 ctermfg=1
hi Green2 ctermfg=9
hi Green3 ctermfg=2
hi Green4 ctermfg=10
hi Green5 ctermfg=3

hi Gray1 ctermfg=11
hi Gray2 ctermfg=4
hi Gray3 ctermfg=12
hi Gray4 ctermfg=5
hi Gray5 ctermfg=13
hi Gray6 ctermfg=6
hi Gray7 ctermfg=14
hi Gray8 ctermfg=15

hi Inverse1 ctermbg=11 ctermfg=0
hi Inverse2 ctermbg=4 ctermfg=0
hi Inverse3 ctermbg=12 ctermfg=0
hi Inverse4 ctermbg=5 ctermfg=0
hi Inverse5 ctermbg=13 ctermfg=0
hi Inverse6 ctermbg=6 ctermfg=0
hi Inverse7 ctermbg=14 ctermfg=0
hi Inverse8 ctermbg=15 ctermfg=0


" TODO 
"- end of colorscheme -----------------------------------------------  
" vim: set ts=8 sts=0 sw=8 noet:
