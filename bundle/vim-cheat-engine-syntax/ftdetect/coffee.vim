" Language:    CheatEngine Table (XML)
" Maintainer:  Sfinktah Bungholio <sfinktah@vim-ce.spamtrak.org>
" URL:         http://github.com/sfinktah/vim-cheat-engine-syntax
" License:     WTFPL

autocmd BufNewFile,BufRead *.ct set filetype=ct
autocmd BufNewFile,BufRead *.CT set filetype=ct

function! s:DetectCheatEngine()
    if getline(2) =~ '^<CheatTable'
        set filetype=ce
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectCheatEngine()
