" Vim color file
" Maintainer: Ruda Moura <ruda@rudix.org>
" Last Change: Sun Feb 24 18:50:47 BRT 2008

highlight clear Normal
set background&

highlight clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "sfin1"

"	    NR-16 NR-8  COLOR NAME ~
"	    0	    0	    Black
"	    1	    4	    DarkBlue
"	    2	    2	    DarkGreen
"	    3	    6	    DarkCyan
"	    4	    1	    DarkRed
"	    5	    5	    DarkMagenta
"	    6	    3	    Brown, DarkYellow
"	    7	    7	    LightGray, LightGrey, Gray, Grey
"	    8	    0*	 DarkGray, DarkGrey
"	    9	    4*	 Blue, LightBlue
"	    10	 2*	 Green, LightGreen
"	    11	 6*	 Cyan, LightCyan
"	    12	 1*	 Red, LightRed
"	    13	 5*	 Magenta, LightMagenta
"	    14	 3*	 Yellow, LightYellow
"	    15	 7*	 White

" Vim colors
highlight Normal     ctermfg=NONE    cterm=NONE
highlight Comment    ctermfg=DarkGray    cterm=NONE
highlight Constant   ctermfg=DarkCyan     cterm=NONE
highlight Number     ctermfg=Red     cterm=NONE
highlight Identifier ctermfg=Yellow    cterm=NONE
highlight Statement  ctermfg=NONE    cterm=Bold
highlight PreProc    ctermfg=Blue    cterm=NONE
highlight Type       ctermfg=Magenta cterm=NONE
highlight Special    ctermfg=DarkYellow cterm=NONE
highlight Error		ctermfg=white	 cterm=NONE		ctermbg=darkred
highlight Visual		ctermbg=DarkBlue

" Vim monochrome
highlight Normal     term=NONE
highlight Comment    term=NONE
highlight Constant   term=Underline
highlight Number     term=Underline
highlight Identifier term=NONE
highlight Statement  term=Bold
highlight PreProc    term=NONE
highlight Type       term=Bold
highlight Special    term=NONE

" GVim colors
highlight Normal     guifg=NONE     gui=NONE
highlight Comment    guifg=DarkCyan gui=NONE
highlight Constant   guifg=Red      gui=NONE
highlight Number     guifg=Red      gui=Bold
highlight Identifier guifg=NONE     gui=NONE
highlight Statement  guifg=NONE     gui=Bold
highlight PreProc    guifg=Blue     gui=NONE
highlight Type       guifg=Magenta  gui=NONE
highlight Special    guifg=Red      gui=Bold
highlight Error		guifg=white		gui=NONE
