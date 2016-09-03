"--------------------------------------------------------------------
" Name Of File: dw_orange.vim.
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
let g:colors_name="dw_orange"

"--------------------------------------------------------------------
" Jeff yellow: ebfb2e   green: 4cda23
hi Boolean                                       guifg=#ebfb2e
hi cDefine                                       guifg=#ebfb2e
hi cInclude                                      guifg=#4cda23
hi Comment                                       guifg=#696969
hi Constant                                      guifg=#ebfb2e
hi Cursor                         guibg=#555555  guifg=#000000
hi CursorColumn                   guibg=#140500
hi CursorLine                     guibg=#260a00
hi DiffAdd                        guibg=#333333  guifg=#ebfb2e
hi DiffChange                     guibg=#333333  guifg=#ebfb2e
hi DiffDelete                     guibg=#333333  guifg=#ebfb2e
hi DiffText                       guibg=#333333  guifg=#4cda23
hi Directory                      guibg=#000000  guifg=#4cda23
hi ErrorMsg                       guibg=#4cda23  guifg=#000000
hi FoldColumn                     guibg=#222222  guifg=#ff0000
hi Folded                         guibg=#222222  guifg=#ff0000
hi Function                                      guifg=#ebfb2e
hi Identifier                     guibg=#000000  guifg=#d13800
hi IncSearch       gui=none       guibg=#bf3300  guifg=#000000
hi LineNr                         guibg=#000000  guifg=#de3b00
hi MatchParen      gui=none       guibg=#000000  guifg=#ebfb2e
hi ModeMsg                        guibg=#000000  guifg=#ff4400
hi MoreMsg                        guibg=#000000  guifg=#ebfb2e
hi NonText                        guibg=#000000  guifg=#4cda23
hi Normal          gui=none       guibg=#000000  guifg=#c0c0c0
hi Operator        gui=none                      guifg=#696969
hi PreProc         gui=none                      guifg=#4cda23
hi Question                                      guifg=#ebfb2e
hi Search          gui=none       guibg=#ff4400  guifg=#000000
hi SignColumn                     guibg=#111111  guifg=#4cda23
hi Special         gui=none       guibg=#000000  guifg=#ffa600
hi SpecialKey                     guibg=#000000  guifg=#ff4400
hi Statement       gui=bold                      guifg=#ff4400
hi StatusLine      gui=none       guibg=#ff3200  guifg=#000000
hi StatusLineNC    gui=none       guibg=#444444  guifg=#000000
hi String          gui=none                      guifg=#d13800
hi TabLine         gui=none       guibg=#555555  guifg=#000000
hi TabLineFill     gui=underline  guibg=#000000  guifg=#4cda23
hi TabLineSel      gui=none       guibg=#ff4400  guifg=#000000
hi Title           gui=none                      guifg=#4cda23
hi Todo            gui=none       guibg=#000000  guifg=#ff0000
hi Type            gui=none                      guifg=#4cda23
hi VertSplit       gui=none       guibg=#000000  guifg=#4cda23
hi Visual                         guibg=#d13800  guifg=#000000
hi WarningMsg                     guibg=#888888  guifg=#000000

"- end of colorscheme -----------------------------------------------  
