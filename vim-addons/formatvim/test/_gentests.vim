"             Filename          cmd     hasconceal      hasfolds     hastags haslist   hasdiff
scriptencoding utf-8
let files=[  ['format.help',   '/^1', has('conceal'),       0,           1,      0,        0     ],
            \['concealed.tex', '/x=', has('conceal'),       0,           0,      1,   has('diff')],
            \['folded.yaml',   '/DE',        0,       has('folding'),    0,      0,   has('diff')],
        \]
let files[2][1].='/normal! zR'
let g:Opts={
            \'C': {
            \   'setter': 'let g:formatOptions.IgnoreCursor',
            \   'default': 1,
            \   'requires': 1,
            \   'values': {
            \       0: {},
            \       1: {},
            \   },
            \},
            \'D': {
            \   'setter': 'let g:formatOptions.CollapsFiller',
            \   'default': 0,
            \   'requires': 'hasdiff',
            \   'values': {
            \       0: {},
            \       1: {},
            \       5: {},
            \   },
            \},
            \'F': {
            \   'setter': 'let g:formatOptions.FormatConcealed',
            \   'default': 0,
            \   'requires': 'hasconceal',
            \   'values': {
            \       0: {'ignores': ['c']},
            \       1: {},
            \       2: {},
            \   },
            \},
            \'L': {
            \   'setter': 'let &list',
            \   'default': 0,
            \   'requires': 'haslist',
            \   'values': {
            \       0: {'ignores': ['l']},
            \       1: {},
            \   },
            \},
            \'a': {
            \   'setter': 'let g:formatOptions.AllFolds',
            \   'default': 0,
            \   'requires': 'hasfolds',
            \   'values': {
            \       0: {},
            \       1: {},
            \   },
            \},
            \'c': {
            \   'setter': 'let &cole',
            \   'default': 0,
            \   'requires': 'hasconceal',
            \   'values': {
            \       0: {'ignores': ['F']},
            \       1: {},
            \       2: {},
            \       3: {},
            \   },
            \},
            \'l': {
            \   'setter': 'let &listchars',
            \   'default': '""',
            \   'requires': 'haslist',
            \   'values': {
            \       '""': {},
            \       '"eol:$,tab:>-,trail:!,conceal:~"': {},
            \       '"eol:$,tab:>-,trail:!,conceal:~,nbsp:_"': {},
            \       '"eol:$,trail:!,conceal:~,nbsp:_"': {},
            \   },
            \},
            \'n': {
            \   'setter': 'let &number',
            \   'default': 0,
            \   'requires': 1,
            \   'values': {
            \       0: {},
            \       1: {'ignores': ['r']},
            \   },
            \},
            \'o': {
            \   'setter': 'let &foldcolumn',
            \   'default': 0,
            \   'requires': 'hasfolds',
            \   'values': {
            \       0: {},
            \       1: {},
            \       2: {},
            \       3: {},
            \       12: {},
            \   },
            \},
            \'r': {
            \   'setter': 'let &relativenumber',
            \   'default': 0,
            \   'requires': exists('+relativenumber'),
            \   'ignores': ['n'],
            \   'values': {
            \       0: {'ignores': ['n']},
            \       1: {'ignores': ['n']},
            \   },
            \},
            \'t': {
            \   'setter': 'let g:formatOptions.IgnoreTags',
            \   'default': '2',
            \   'requires': 'hastags',
            \   'values': {
            \       0: {},
            \       1: {},
            \       2: {},
            \   },
            \},
        \}
let g:formatOptions={}
let g:formatOptions.ShowProgress=0
let s:done_options=[]
let g:opts=['list', 'cole', 'foldcolumn', 'number', 'relativenumber', 'listchars']
function! WriteTest(name)
    let r=[]
    call add(r, 'let g:formatOptions='.string(g:formatOptions))
    if g:hastags
        call add(r, 'set tags=./tags')
    endif
    if g:hasfolds
        call add(r, 'set foldmethod=marker')
    endif
    for o in g:opts
        call add(r, 'let &'.o.'='.string(eval('&'.o)))
    endfor
    let ft=fnamemodify(g:file, ':e')
    let r  +=   ['view '.g:file,
                \'set filetype='.ft,
                \'runtime syntax/'.ft.'.vim',
                \]
    if g:hasdiff
        call extend(r, ['diffthis',
                    \   'vnew '.substitute(g:file, '\.', '-2.', ''),
                    \   'set filetype='.ft,
                    \   'runtime syntax/'.ft.'.vim',
                    \   'diffthis',
                    \   'wincmd w',])
        if g:hasfolds && s:setoptions.o!=2
            let r  +=   ['set foldmethod=marker',
                        \'let &foldcolumn='.eval('&foldcolumn'),]
        endif
    endif
    if g:hasfolds
        call add(r, 'normal! zM')
    endif
    call add(r, g:command)
    call add(r, 'try | execute "Format format html to ".escape(g:outfile, " ")'.
                \' | let succeeded=1'.
                \' | endtry')
    call add(r, 'if !exists("succeeded")'.
                \' | call writefile(["fail"], '.
                \                     'fnamemodify(g:outfile, ":r").".fail")'.
                \' | endif')
    call map(r, '":".v:val')
    call add(r, '')
    call writefile(r, a:name.'.in', 'b')
endfunction
function! Test(settings_list)
    if empty(a:settings_list)
        let settings_string=join(sort(values(map(copy(s:setoptions), 'v:key.v:val'))), '-')
        let settings_string=substitute(settings_string, '%', '%%', 'g')
        let settings_string=substitute(settings_string, '"', '%q', 'g')
        let settings_string=substitute(settings_string, '»', '%>', 'g')
        let settings_string=substitute(settings_string, '—', '%-', 'g')
        let settings_string=substitute(settings_string, ':', '%.', 'g')
        let settings_string=substitute(settings_string, '&', '%a', 'g')
        if g:hasconceal && s:setoptions.F && !s:setoptions.c
            " It should have been fixed by `ignores' below, but it is not. So 
            " writing a workaround here
        elseif g:file is# 'concealed.tex' && s:setoptions.D>1
            " It will be just the same as with `s:setoptions.D=1'
        elseif g:file is# 'format.help' && s:setoptions.c>2
            " In help files all concealed characters are just not shown, so no 
            " difference between cole=2 and cole=3
        elseif index(s:done_options, settings_string)==-1
            call add(s:done_options, settings_string)
            let name=g:file.'%'.settings_string
            call WriteTest(name)
        endif
    else
        let nextlist=copy(a:settings_list)
        let s=remove(nextlist, 0)
        let O=g:Opts[s]
        if has_key(O, 'ignores')
            call filter(nextlist, 'index(O.ignores, v:val)==-1')
        endif
        for [value, o] in items(O.values)
            let curlist=copy(nextlist)
            execute O.setter.'='.value
            let s:setoptions[s]=value
            if has_key(o, 'ignores')
                call filter(curlist, 'index(o.ignores, v:val)==-1')
            endif
            call Test(curlist)
        endfor
        execute O.setter.'='.O.default
        let s:setoptions[s]=O.default
    endif
endfunction
execute 'cd' fnameescape(expand('<sfile>:h'))
for [file, command, hasconceal, hasfolds, hastags, haslist, hasdiff] in files
    let s:setoptions={}
    for [letter, o] in items(g:Opts)
        execute o.setter.'='.o.default
        if eval(o.requires)
            let s:setoptions[letter]=o.default
        endif
    endfor
    call Test(sort(keys(s:setoptions)))
    for o in values(g:Opts)
        execute o.setter.'='.o.default
    endfor
endfor
qa!
