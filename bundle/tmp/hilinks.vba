" Vimball Archiver by Charles E. Campbell, Ph.D.
UseVimball
finish
plugin/hilinks.vim	[[[1
365
" hilinks.vim: the source herein generates a trace of what
"              highlighting groups link to what highlighting groups
"
"  Author:		Charles E. Campbell <NdrOchipS@PcampbellAfamily.Mbiz>
"  Date:		Jan 10, 2008 - Feb 18, 2016
"  Version:		4m	ASTRO-ONLY
"
"  NOTE:        This script requires Vim 6.0 (or later)
"               Works best with Vim 7.1 with patch#215
"
"  Usage: {{{1
"
"  \hlt   : will reveal a linked list of highlighting from the top-level down
"           to the bottom level.
"           You may redefine the leading character using "let mapleader= ..."
"           in your <.vimrc>.
"
"  History: {{{1
"   3 04/07/05 :	* cpo&vim supported
"   2 07/14/04 :	* register a is used as before but now its original contents are restored
"   				* bugfix: redraw taken before echo to fix message display
"   				* debugging code installed
"  	1 08/01/01 :	* the first release
" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("g:loaded_hilinks") || &cp
  finish
endif
let g:loaded_hilinks= "v4m"
if v:version < 700
 echohl WarningMsg
 echo "***warning*** this version of hilinks needs vim 7.0"
 echohl Normal
 finish
endif
let s:keepcpo= &cpo
set cpo&vim
"DechoRemOn

" ---------------------------------------------------------------------
"  Initialization: {{{1
let s:HLTmode       = 0

" ---------------------------------------------------------------------
" Public Interface: {{{1
if !hasmapto('<Plug>HiLinkTrace')
 map <script> <s-F10>		<Leader>hlt
 map <unique> <Leader>hlt	<Plug>HiLinkTrace
endif
map <script> <Plug>HiLinkTrace	:sil! call <SID>HiLinkTrace(0)<CR>
com! -bang	HLT					sil! call s:HiLinkTrace(<bang>0)
com!		HLTm				sil! call s:HiLinkTrace(1)
com! -bang	HLTX				let s:x256=1|sil! call s:HiLinkTrace(<bang>0)|unlet s:x256

" ---------------------------------------------------------------------
"  Options: {{{1
if !exists("g:hilinks_fmtwidth")
 let g:hilinks_fmtwidth= 35
endif

" ---------------------------------------------------------------------
" HiLinkTrace: this function traces the highlighting group names {{{1
"             from transparent/top level through to the bottom
"             always=0:
"                   =1: installs autocmd, supporting HiLinkTrace calling on cursor moves
"                   =2: initialize with top-level highlighting
fun! <SID>HiLinkTrace(always)
"  call Dfunc("HiLinkTrace(always=".a:always.")")

  " save register a
  let keep_rega= @a

  " get highlighting linkages into register "a"
  redir @a
   silent! hi
  redir END
"  call Decho("reg-A now has :hi output")

  " initialize with top-level highlighting
  if a:always == 2
   let curline   = v:beval_lnum
   let curcol    = v:beval_col
"   call Decho("curline#".curline." curcol#".curcol." (used mouse location)")
  else
   let curline   = line(".")
   let curcol    = col(".")
"   call Decho("curline#".curline." curcol#".curcol." (used cursor location)")
  endif
  let firstlink = synIDattr(synID(curline,curcol,1),"name")
  let lastlink  = synIDattr(synIDtrans(synID(curline,curcol,1)),"name")
  let translink = synIDattr(synID(curline,curcol,0),"name")                
"  call Decho("firstlink<".firstlink."> lastlink<".lastlink."> translink<".translink.">")

  " if transparent link isn't the same as the top highlighting link,
  " then indicate it with a leading "T:"
  if firstlink != translink
   let hilink= "T:".translink."->".firstlink
"   call Decho("firstlink!=translink<".hilink.">")
  else
   let hilink= firstlink
"   call Decho("firstlink==translink<".hilink.">")
  endif

  " trace through the linkages
  if firstlink != lastlink
   let no_overflow= 0
   let curlink    = firstlink
"   call Decho("loop#".no_overflow.": hilink<".hilink.">")
   while curlink != lastlink && no_overflow < 10
   	let no_overflow = no_overflow + 1
   	let nxtlink     = substitute(@a,'^.*\<'.curlink.'\s\+xxx links to \(\a\+\).*$','\1','')
	if nxtlink =~# '\<start=\|\<cterm[fb]g=\|\<gui[fb]g='
	 let nxtlink= substitute(nxtlink,'^[ \t\n]*\(\S\+\)\s\+.*$','\1','')
   	 let hilink = hilink ."->". nxtlink
	 break
	endif
"    call Decho("loop#".no_overflow.": curlink<".curlink."> nxtlink<".nxtlink."> hilink<".hilink.">")
   	let hilink      = hilink ."->". nxtlink
   	let curlink     = nxtlink
   endwhile
"   call Decho("endloop: hilink<".hilink.">")
  endif

  " Use new synstack() function, available with 7.1 and patch#215
  let x256= ""
  if v:version > 701 || ( v:version == 701 && has("patch215"))
   let syntaxstack = ""
   let isfirst     = 1
   let idlist      = synstack(curline,curcol)
   if !empty(idlist)
    for id in idlist
     if isfirst
      let syntaxstack= syntaxstack." ".synIDattr(id,"name")
      let isfirst = 0
     else
      let syntaxstack= syntaxstack."->".synIDattr(id,"name")
     endif
    endfor
   endif
  endif

  " display hilink traces
  redraw
  let synid= hlID(lastlink)
  if exists("s:x256")
   let x256= s:X256matcher(synid)
  endif

  if !exists("syntaxstack")
   let retval= printf("HltTrace: %-".g:hilinks_fmtwidth."s fg<%s> bg<%s>%s",hilink,synIDattr(synid,"fg"),synIDattr(synid,"bg"),x256)
  else
   let retval= printf("SynStack: %-".g:hilinks_fmtwidth."s  HltTrace: %-".g:hilinks_fmtwidth."s fg<%s> bg<%s>%s",syntaxstack,hilink,synIDattr(synid,"fg"),synIDattr(synid,"bg"),x256)
  endif
  if a:always == 0 || a:always == 1
   echo retval
  endif

  " restore register a
  let @a= keep_rega

  " set up CursorMoved autocmd on bang
  if a:always == 1
   if !s:HLTmode
	" install a CursorMoved highlighting trace
"	call Decho("install CursorMoved HLT")
	let s:HLTmode= 1
	augroup HLTMODE
	 au!
	 if exists("s:x256")
	  au CursorMoved * let s:x256=1|call s:HiLinkTrace(0)|unlet s:x256
	 else
	  au CursorMoved * call s:HiLinkTrace(0)
	 endif
	augroup END
   else
	" remove the CursorMoved highlighting trace
"	call Decho("remove CursorMoved HLT")
	let s:HLTmode= 0
	augroup HLTMODE
	 au!
	augroup END
	augroup! HLTMODE
   endif

   if v:version >= 700 && has("balloon_eval") && !exists("g:hilinks_nobeval") && a:always == 1
	if !exists("s:initbeval")
"	 call Decho("saving beval, bexpr")
	 let s:initbeval= &beval
	 let s:initbexpr= &bexpr
	endif
    if s:HLTmode
	 " install a balloon eval for highlight tracing
"	 call Decho("setting beval")
     set beval
	 exe "let &bexpr= '".s:SID()."HiLinkTrace(2)'"
"	 call Decho("installing bexpr=".&bexpr)
	else
	 " restore balloon eval/expr to initial values
"	 call Decho("restoring beval, bexpr")
	 let &beval= s:initbeval
	 let &bexpr= s:initbexpr
	endif
   endif
  endif

  if a:always == 2
"   call Dret("HiLinkTrace <".hilink.">")
   return retval
  endif

"  call Dret("HiLinkTrace : hilink<".hilink.">")
endfun

" ---------------------------------------------------------------------
" s:SID: determine what <SID> normally maps to {{{1
function s:SID()
"  call Dfunc("s:SID()")
  let retval= '<SNR>'.matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$').'_'
"  call Dret("s:SID ".retval." : sfile<".expand('<sfile>'))
  return retval
endfun

" ---------------------------------------------------------------------
" s:X256matcher: returns a string with the best match to xterm's 256 colors {{{1
fun! s:X256matcher(id)
"  call Dfunc("s:X256matcher(id=".a:id.")")
  if !exists("s:xterm256colors")
   let s:xterm256colors=[[0x00,0x00,0x00],[0x08,0x00,0x00],[0x00,0x08,0x00],[0x08,0x08,0x00],[0x00,0x00,0x08],[0x08,0x00,0x08],[0x00,0x08,0x08],[0x08,0x08,0x08],[0x08,0x08,0x08],[0xff,0x00,0x00],[0x00,0xff,0x00],[0xff,0xff,0x00],[0x00,0x00,0xff],[0xff,0x00,0xff],[0x00,0xff,0xff],[0xff,0xff,0xff],[0x00,0x00,0x5f],[0x00,0x00,0x87],[0x00,0x00,0xaf],[0x00,0x00,0xd7],[0x00,0x00,0xff],[0x00,0x5f,0x00],[0x00,0x5f,0x5f],[0x00,0x5f,0x87],[0x00,0x5f,0xaf],[0x00,0x5f,0xd7],[0x00,0x5f,0xff],[0x00,0x87,0x00],[0x00,0x87,0x5f],[0x00,0x87,0x87],[0x00,0x87,0xaf],[0x00,0x87,0xd7],[0x00,0x87,0xff],[0x00,0xaf,0x00],[0x00,0xaf,0x5f],[0x00,0xaf,0x87],[0x00,0xaf,0xaf],[0x00,0xaf,0xd7],[0x00,0xaf,0xff],[0x00,0xd7,0x00],[0x00,0xd7,0x5f],[0x00,0xd7,0x87],[0x00,0xd7,0xaf],[0x00,0xd7,0xd7],[0x00,0xd7,0xff],[0x00,0xff,0x00],[0x00,0xff,0x5f],[0x00,0xff,0x87],[0x00,0xff,0xaf],[0x00,0xff,0xd7],[0x00,0xff,0xff],[0x5f,0x00,0x00],[0x5f,0x00,0x5f],[0x5f,0x00,0x87],[0x5f,0x00,0xaf],[0x5f,0x00,0xd7],[0x5f,0x00,0xff],[0x5f,0x5f,0x00],[0x5f,0x5f,0x5f],[0x5f,0x5f,0x87],[0x5f,0x5f,0xaf],[0x5f,0x5f,0xd7],[0x5f,0x5f,0xff],[0x5f,0x87,0x00],[0x5f,0x87,0x5f],[0x5f,0x87,0x87],[0x5f,0x87,0xaf],[0x5f,0x87,0xd7],[0x5f,0x87,0xff],[0x5f,0xaf,0x00],[0x5f,0xaf,0x5f],[0x5f,0xaf,0x87],[0x5f,0xaf,0xaf],[0x5f,0xaf,0xd7],[0x5f,0xaf,0xff],[0x5f,0xd7,0x00],[0x5f,0xd7,0x5f],[0x5f,0xd7,0x87],[0x5f,0xd7,0xaf],[0x5f,0xd7,0xd7],[0x5f,0xd7,0xff],[0x5f,0xff,0x00],[0x5f,0xff,0x5f],[0x5f,0xff,0x87],[0x5f,0xff,0xaf],[0x5f,0xff,0xd7],[0x5f,0xff,0xff],[0x87,0x00,0x00],[0x87,0x00,0x5f],[0x87,0x00,0x87],[0x87,0x00,0xaf],[0x87,0x00,0xd7],[0x87,0x00,0xff],[0x87,0x5f,0x00],[0x87,0x5f,0x5f],[0x87,0x5f,0x87],[0x87,0x5f,0xaf],[0x87,0x5f,0xd7],[0x87,0x5f,0xff],[0x87,0x87,0x00],[0x87,0x87,0x5f],[0x87,0x87,0x87],[0x87,0x87,0xaf],[0x87,0x87,0xd7],[0x87,0x87,0xff],[0x87,0xaf,0x00],[0x87,0xaf,0x5f],[0x87,0xaf,0x87],[0x87,0xaf,0xaf],[0x87,0xaf,0xd7],[0x87,0xaf,0xff],[0x87,0xd7,0x00],[0x87,0xd7,0x5f],[0x87,0xd7,0x87],[0x87,0xd7,0xaf],[0x87,0xd7,0xd7],[0x87,0xd7,0xff],[0x87,0xff,0x00],[0x87,0xff,0x5f],[0x87,0xff,0x87],[0x87,0xff,0xaf],[0x87,0xff,0xd7],[0x87,0xff,0xff],[0xaf,0x00,0x00],[0xaf,0x00,0x5f],[0xaf,0x00,0x87],[0xaf,0x00,0xaf],[0xaf,0x00,0xd7],[0xaf,0x00,0xff],[0xaf,0x5f,0x00],[0xaf,0x5f,0x5f],[0xaf,0x5f,0x87],[0xaf,0x5f,0xaf],[0xaf,0x5f,0xd7],[0xaf,0x5f,0xff],[0xaf,0x87,0x00],[0xaf,0x87,0x5f],[0xaf,0x87,0x87],[0xaf,0x87,0xaf],[0xaf,0x87,0xd7],[0xaf,0x87,0xff],[0xaf,0xaf,0x00],[0xaf,0xaf,0x5f],[0xaf,0xaf,0x87],[0xaf,0xaf,0xaf],[0xaf,0xaf,0xd7],[0xaf,0xaf,0xff],[0xaf,0xd7,0x00],[0xaf,0xd7,0x5f],[0xaf,0xd7,0x87],[0xaf,0xd7,0xaf],[0xaf,0xd7,0xd7],[0xaf,0xd7,0xff],[0xaf,0xff,0x00],[0xaf,0xff,0x5f],[0xaf,0xff,0x87],[0xaf,0xff,0xaf],[0xaf,0xff,0xd7],[0xaf,0xff,0xff],[0xd7,0x00,0x00],[0xd7,0x00,0x5f],[0xd7,0x00,0x87],[0xd7,0x00,0xaf],[0xd7,0x00,0xd7],[0xd7,0x00,0xff],[0xd7,0x5f,0x00],[0xd7,0x5f,0x5f],[0xd7,0x5f,0x87],[0xd7,0x5f,0xaf],[0xd7,0x5f,0xd7],[0xd7,0x5f,0xff],[0xd7,0x87,0x00],[0xd7,0x87,0x5f],[0xd7,0x87,0x87],[0xd7,0x87,0xaf],[0xd7,0x87,0xd7],[0xd7,0x87,0xff],[0xd7,0xaf,0x00],[0xd7,0xaf,0x5f],[0xd7,0xaf,0x87],[0xd7,0xaf,0xaf],[0xd7,0xaf,0xd7],[0xd7,0xaf,0xff],[0xd7,0xd7,0x00],[0xd7,0xd7,0x5f],[0xd7,0xd7,0x87],[0xd7,0xd7,0xaf],[0xd7,0xd7,0xd7],[0xd7,0xd7,0xff],[0xd7,0xff,0x00],[0xd7,0xff,0x5f],[0xd7,0xff,0x87],[0xd7,0xff,0xaf],[0xd7,0xff,0xd7],[0xd7,0xff,0xff],[0xff,0x00,0x00],[0xff,0x00,0x5f],[0xff,0x00,0x87],[0xff,0x00,0xaf],[0xff,0x00,0xd7],[0xff,0x00,0xff],[0xff,0x5f,0x00],[0xff,0x5f,0x5f],[0xff,0x5f,0x87],[0xff,0x5f,0xaf],[0xff,0x5f,0xd7],[0xff,0x5f,0xff],[0xff,0x87,0x00],[0xff,0x87,0x5f],[0xff,0x87,0x87],[0xff,0x87,0xaf],[0xff,0x87,0xd7],[0xff,0x87,0xff],[0xff,0xaf,0x00],[0xff,0xaf,0x5f],[0xff,0xaf,0x87],[0xff,0xaf,0xaf],[0xff,0xaf,0xd7],[0xff,0xaf,0xff],[0xff,0xd7,0x00],[0xff,0xd7,0x5f],[0xff,0xd7,0x87],[0xff,0xd7,0xaf],[0xff,0xd7,0xd7],[0xff,0xd7,0xff],[0xff,0xff,0x00],[0xff,0xff,0x5f],[0xff,0xff,0x87],[0xff,0xff,0xaf],[0xff,0xff,0xd7],[0xff,0xff,0xff],[0x08,0x08,0x08],[0x12,0x12,0x12],[0x1c,0x1c,0x1c],[0x26,0x26,0x26],[0x30,0x30,0x30],[0x3a,0x3a,0x3a],[0x44,0x44,0x44],[0x4e,0x4e,0x4e],[0x58,0x58,0x58],[0x62,0x62,0x62],[0x6c,0x6c,0x6c],[0x76,0x76,0x76],[0x80,0x80,0x80],[0x8a,0x8a,0x8a],[0x94,0x94,0x94],[0x9e,0x9e,0x9e],[0xa8,0xa8,0xa8],[0xb2,0xb2,0xb2],[0xbc,0xbc,0xbc],[0xc6,0xc6,0xc6],[0xd0,0xd0,0xd0],[0xda,0xda,0xda],[0xe4,0xe4,0xe4],[0xee,0xee,0xee]]
  endif

  if a:id == 0
   " this means that the colorization is default, which means vim doesn't really know
   let s:x256id  = a:id
   let s:x256ret = ""
"   call Dret("s:X256matcher <".s:x256ret."> : default fg,bg = don't know")
   return s:x256ret
  endif

  if !exists("s:x256id") || s:x256id != a:id
   let s:x256id= a:id
  else
   " quick return (id hasn't changed since last call)
"   call Dret("s:X256matcher <".s:x256ret.">")
   return s:x256ret
  endif

  if !exists("s:x256dict")
   let s:x256dict= {}
  endif

  " extract foreground red-green-blue components
  let dofg  = 0
  let x256F = -1
  let fg    = synIDattr(a:id,"fg#")
  if !empty(fg)
"   call Decho("fg=".fg)
   if has_key(s:x256dict,fg)
	let x256F= s:x256dict[fg]
"	call Decho("used dictionary: x256F=".x256F)
   else
	let Fr    = "0x".strpart(fg,1,2)
	let Fg    = "0x".strpart(fg,3,2)
	let Fb    = "0x".strpart(fg,5,2)
	let Fr    = 0 + Fr
	let Fg    = 0 + Fg
	let Fb    = 0 + Fb
	let dofg  = 1
"	call Decho(printf("will search: fg=%s: Fr=%3d Fg=%3d Fb=%3d",fg,Fr,Fg,Fb))
   endif
  endif

  " extract background red-green-blue components
  let dobg  = 0
  let x256B = -1
  let bg    = synIDattr(a:id,"bg#")
  if !empty(bg)
"   call Decho("bg=".bg)
   if has_key(s:x256dict,bg)
	let x256B= s:x256dict[bg]
"	call Decho("used dictionary: x256B=".x256B)
   else
    let Br    = "0x".strpart(bg,1,2)
    let Bg    = "0x".strpart(bg,3,2)
    let Bb    = "0x".strpart(bg,5,2)
    let Br    = 0 + Br
    let Bg    = 0 + Bg
    let Bb    = 0 + Bb
    let dobg  = 1
"    call Decho(printf("will search: bg=%s: Br=%3d Bg=%3d Bb=%3d",bg,Br,Bg,Bb))
   endif
  endif

  " find the best fit using the infinite norm
  "  (F=foreground, B=background)
  let x256Fr = 0
  let x256Fg = 0
  let x256Fb = 0
  let x256Br = 0
  let x256Bg = 0
  let x256Bb = 0
  if dofg
   let critF  = 4*255
  else
   let critF= 0
  endif
  if dobg
   let critB  = 4*255
  else
   let critB  = 0
  endif
"  call Decho("dofg=".dofg." dobg=".dobg)
  let indx   = 0
  if dofg || dobg
	for item in s:xterm256colors
"   let critreport = "          "   " Decho
	 if dofg
	  let critf = abs(item[0] - Fr) + abs(item[1] - Fg) + abs(item[2] - Fb)
	  if critf < critF
	   let x256F      = indx
	   let critF      = critf
"    let critreport = printf(" critF=%3d",critF)  " Decho
	  endif
	 endif
	 if dobg
	  let critb = abs(item[0] - Br) + abs(item[1] - Bg) + abs(item[2] - Bb)
	  if critb < critB
	   let x256B      = indx
	   let critB      = critb
"       let critreport = critreport.printf(" critB=%3d",critB)  " Decho
	  endif
	 endif
"     call Decho(printf("color#%3d: r=%3d g=%3d b=%3d critf=%3d critb=%3d%s",indx,s:xterm256colors[indx][0],s:xterm256colors[indx][1],s:xterm256colors[indx][2],critf,critb,critreport))
	 if critF == 0 && critB == 0
	  break
	 endif
	 let indx= indx + 1
	endfor
   endif

  " update the dictionary
  if dofg && x256F >= 0
   let s:x256dict[fg] = x256F
  endif
  if dobg && x256B >= 0
   let s:x256dict[bg] = x256B
  endif

  if x256F >= 0 && x256B >= 0
   let s:x256ret = "  xfg#".x256F." xbg#".x256B
  elseif x256F >= 0
   let s:x256ret = "  xfg#".x256F
  elseif x256B >= 0
   let s:x256ret = "  xbg#".x256B
  else
   let s:x256ret= ""
  endif

"  call Dret("s:X256matcher <".s:x256ret.">")
  return s:x256ret
endfun

" =====================================================================
"  Restore: {{{1
let &cpo= s:keepcpo
" vim: fdm=marker
doc/hilinks.txt	[[[1
68
*hilinks.txt*	Highlighting Links				Feb 18, 2016

Author:  Charles E. Campbell  <NdrOchip@ScampbellPfamily.AbizM>
	  (remove NOSPAM from Campbell's email first)
Copyright: (c) 2008-2013 by Charles E. Campbell		*hilinks-copyright*
           The VIM LICENSE applies to hilinks.vim, and hilinks.txt
           (see |copyright|) except use "hilinks" instead of "Vim"
	   NO WARRANTY, EXPRESS OR IMPLIED.  USE AT-YOUR-OWN-RISK.

==============================================================================
1. Contents					*hilinks* *hilinks-contents*
     1. Contents : ............................. |hilinks|
     2. Manual   : ............................. |hilinks-manual|
     3. History  : ............................. |hilinks-history|

==============================================================================
2. Manual					*hilinks-manual*

MAPS						*hlt*
	\hlt  : reveals a linked list of highlighting from the top-level down
	        to the bottom level for the cursor position.  For vim 7.1
	        with patch 215, will also reveal the syntax stack at the cursor
	        position.

COMMANDS					*:HLT* *:HLT!* *:HLTm*
	:HLT  : same as \hlt, but in a command format.
	:HLT! : same as \hlt, but will execute on every CursorMoved event,
	        so one can see the highlighting trace and syntax stack as
		one moves the cursor.  The next :HLT! will toggle this mode
		off.
		May enable mouse-based balloons, too (see |hilinks-beval|).
	:HLTm : same as :HLT! (provided so AsNeeded can trigger off it)
	:HLTX : like :HLT, but also converts the colors into an xterm-256-color
	        index
	:HLTX!: like :HLT!, but also converts the colors into an xterm-256-color
	        index
	
	NOTE: Vim 7.1 with patch#215 required for the syntax stack.

BEVAL						*hilinks-beval*
	By default and with |:HLT!|, if your vim supports |'beval'|, hilinks will enable
	beval and install a ballon expression (|'bexpr'|).  You can
	prevent that by putting >
		let g:hilinks_nobeval= 1
<	into your .vimrc .

	This feature means that a hovering mouse will show a highlighting
	trace when |:HLT!| is used to enable syntax and highlighting tracing
	as you move the cursor.
	

==============================================================================
3. History					*hilinks-history*

   v4   Jan 10, 2008	* :HLT and :HLT! implemented
        Feb 29, 2008	* shows foreground and background definitions
	May 20, 2008	* (bugfix) wasn't working when patch#215 was missing
	Feb 23, 2009	* (bugfix) the map was missing the new argument
			* :HLTm implemented (so AsNeeded can use :HLTm)
	Feb 28, 2013	* |'beval'| usage implemented
	Apr 03, 2013	* included :HLTX and :HLTX! commands
	Feb 18, 2016	* Change =~ to =~# where appropriate

==============================================================================
Modelines: {{{1
vim:tw=78:ts=8:ft=help:fdm=marker:


