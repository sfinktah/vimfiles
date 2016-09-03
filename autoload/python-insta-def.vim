" nnoremap <leader>def :set operatorfunc=<SID>PythonInstaDef<cr>g@
nnoremap <leader>def :call <SID>PythonInstaDef("w")<cr>
vnoremap <leader>def :<c-u>call <SID>PythonInstaDef(visualmode())<cr>
nnoremap <C-n> :call <SID>FindNextOccuranceOfWord()<cr>

function! s:FindNextOccuranceOfWord()
    " let saved_unnamed_register = @@
    normal! "ayiw
    let @/=@a
    
    execute "normal! l/".@a
    " let @@ = saved_unnamed_register
endfunction

function! s:PythonInstaDef(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'w'
	normal! yiw
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    execute "normal \<esc>?^\\\s*class\<cr>/^\\\s\\\+def\<cr>nOdef\<space>\<esc>pa(self):\<cr>\<space>"
    " silent execute "grep! -R " . shellescape(@@) . " ."
    " copen

    let @@ = saved_unnamed_register
endfunction

" From http://stackoverflow.com/questions/2312844/vim-yank-into-search-register
" vnoremap <silent>* <ESC>:call VisualSearch('/')<CR>/<CR>
" vnoremap <silent># <ESC>:call VisualSearch('?')<CR>?<CR>
" 
"     function! VisualSearch(dirrection)
"         let l:register=@@
"         normal! gvy
"         let l:search=escape(@@, '$.*/\[]')
"         if a:dirrection=='/'
"             execute 'normal! /'.l:search
"         else
"             execute 'normal! ?'.l:search
"         endif
"         let @/=l:search
"         normal! gV
"         let @@=l:register
"     endfunction
