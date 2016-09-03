let g:idle_counter = 0
function! Idle()
   echo "I am idle!!!! (" .  g:idle_counter . ")"

   let g:idle_counter = g:idle_counter + 1
   if g:idle_counter < 0
      execute ":q"
   endif
   normal ggG
endfunction

" autocmd CursorHold * call Idle()
" autocmd FocusGained * call Idle()
" autocmd FocusLost * call Idle()
