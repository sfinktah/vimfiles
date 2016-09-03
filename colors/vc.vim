" Vim color file
" Maintainer:   Vladimir Vrzic <random@bsd.org.yu>
" Last Change:  28. june 2003.
" URL:          http://galeb.etf.bg.ac.yu/~random/pub/vim/ 

" set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="vc"

hi Normal	cterm=NONE	ctermfg=gray	ctermbg=black
hi Comment              cterm=NONE                ctermfg=green          ctermbg=black
hi Constant             cterm=NONE                ctermfg=lightgreen           ctermbg=black
"hi Identifier  cterm=NONE                ctermfg=Blue                      ctermbg=black
hi Statement    cterm=NONE                ctermfg=Blue                      ctermbg=black
hi PreProc              cterm=NONE                ctermfg=Blue                      ctermbg=black      
hi Type                 cterm=NONE                ctermfg=Blue                      ctermbg=black
hi Special              cterm=NONE                ctermfg=lightblue ctermbg=black
"hi Underlined  
"hi Ignore              
"hi Error               
"hi Todo                

