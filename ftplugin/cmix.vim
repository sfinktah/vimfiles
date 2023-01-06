" https://vi.stackexchange.com/questions/6975/store-the-number-of-matches-in-vimscript-function
" function! Count( word )
  " redir => cnt
    " silent exe '%s/' . a:word . '//gn'
  " redir END
" 
  " let res = strpart(cnt, 0, stridx(cnt, " "))
  " return res
" endfunction

function! Count( word )
  redir => cnt
    silent exe '%s/' . a:word . '//n'
  redir END
  return matchstr( cnt, '\d\+' )
endfunction

function! Adjacent( word )
  redir => cnt
    exe ':silent! %s/' . a:word . '.*\n.*' . a:word . '://n'
  redir END
  return matchstr( cnt, '\d\+' )
endfunction


function! MyMatch()
  " execute ':%s/.*jmp\s\+\<\(\w\+\)\>.*\n\ze.*\<\1\>:.*\n'
  let labels = ingo#text#frompattern#Get(1, '$', '\<\zs\(\.L\d\+\|\(_loc\|_sub\|sub\|lab\|nullret\|loc\|locret\|lab\)_\x\+\)\ze:', '', '', '1')

  " let results = ingo#text#frompattern#Get(1, '$', 'j\w\{1,8\} \zs\(_loc\|_sub\|sub\|lab\|loc\|locret\|lab\)_\x\+\ze', '', '', '1')
  let references = ingo#text#frompattern#Get(1, '$', '\s\<\zs\(\.L\d\+\|\(_loc\|_sub\|sub\|lab\|nullret\|loc\|locret\|lab\)_\x\+\)\ze([^:]|\n)', '', '', '1')

  let counter=1

  for label in labels
    let i = count(references, label)
    if i < -3
      execute ':%s/.*\<xx' . label . '\>:.*\n'
    else
      let k = Count(label)
      let j = Adjacent(label)
      if k == 2 && j == 1
        execute ':%s/.*jmp\s\+\<' . label . '\>.*\n.*\<' . label . '\>:.*\n'
      else
        if j == 1
          execute ':%s/.*jmp\s\+\<' . label . '\>.*\n\ze.*\<' . label . '\>:.*\n'
        endif
        " execute ':silent! %s/' . label . '/label' . counter . '/g'
        let counter+=1
      endif
    endif


      " if k == 2 && j == 1
        " execute ':%s/.*jmp\s\+\<' . label . '\>.*\n.*\<' . label . '\>:.*\n'
      " elseif j > 0
        " execute ':%s/.*jmp\s\+' . label . '\>.*\n\ze.*' . label . ':.*\n'
      " endif
      " let counter+=1



    " if Count(reference) == 1
    " execute ':silent! %s/.*' . reference . ':.*\n' . counter . '/g'
    " elseif Count(reference) != 2
    " " if Count(reference) != 2
    " execute ':silent! %s/' . reference . '/label' . counter . '/g'
    " let counter+=1
    " else
    " execute ':silent! %s/' . reference . '/label' . counter . '/g'
    " execute ":silent! %s/^[^;]*\\<jmp\\>\\s\\+\\<\\(label\\d\\+\\)\\>.*\\n[^;]*\\<\\1\\>:.*\\n"
    " let counter+=1
    " endif
  endfor

  " let references = ingo#text#frompattern#Get(1, '$', 'j[^m]\w\{0,4\} \zs\(loc\|locret\|lab\)_\x\+\ze', '', '', '1')
  " for reference in references
  " execute ':silent! %s/' . reference . '/label' . counter . '/g'
  " let counter+=1
  " endfor
  " let results = ingo#text#frompattern#Get(1, '', '\<loc\|locret\|lab\)_\w\+\>', '', '', '1')
  " for reference in results
  " execute ':silent! %s/\<' . reference . '\>/label' . counter . '/g'
  " let counter+=1
  " endfor
endfun

function! s:RemoveJmps()
  exec ':silent! %s/^\s*;.*\n'
  exec ":silent! %s/;.*$"
	exec ":silent! %s/^[^;]*\\<nop\\>.*\\n"
	exec ":silent! %s/^[^;]*\\<xchg\\>\\s\\+\\<ax, ax\\>.*\\n"
  exec ":silent! %s/^$\\n"
	call MyMatch()
  exec ":silent! %s/\\s\\+$"
  exec ":silent! %s/^\\.text[^ ]\\+$"
	" exec ":silent! %s/^[^;]*\\<jmp\\>\\s\\+\\<\\(loc\\w*_\\x\\+\\)\\>.*\\n[^;]*\\<\\1\\>:.*\\n"
  exec ":silent! %s/^$\\n"
  " exec ":silent! %s/\\C\\(jmp .*\\|retn$\\)/&\\r;------------------------------------------------------------------------------------------------"
endfunction
com! RemoveJmps call s:RemoveJmps()

set keywordprg=x86man

" /\C\<jmp \(\w\+\).*\n.*\1:
