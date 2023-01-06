" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

if has('gui_running')
   " set runtimepath=~/.gvim
      " /Applications/MacVim.app/Contents/Resources/vim/vimfiles
      " /Applications/MacVim.app/Contents/Resources/vim/runtime
      " /Applications/MacVim.app/Contents/Resources/vim/vimfiles/after
      " ~/.gvim/after
      " ~/.vim
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Liberation_Mono:h11:cANSI
    " set pythonthreedll="python37.dll"
    set runtimepath+=/Users/sfink/vimfiles
    " set runtimepath+=~/.vim
    set runtimepath+=~/.vim/after
    source ~/.tvimrc.sorted
  endif
else
   set runtimepath=~/.vim,/usr/share/vim/vim82,~/.vim/after
   source ~/.tvimrc.sorted
endif

" put this line first in ~/.vimrc
set nocompatible | filetype indent plugin on | syn on

if has('gui_running')
   " set runtimepath=~/.gvim
      " /Applications/MacVim.app/Contents/Resources/vim/vimfiles
      " /Applications/MacVim.app/Contents/Resources/vim/runtime
      " /Applications/MacVim.app/Contents/Resources/vim/vimfiles/after
      " ~/.gvim/after
      " ~/.vim
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Liberation_Mono:h11:cANSI
    set runtimepath+=/Users/sfink/vimfiles
    set runtimepath+=/Users/sfinktah/vimfiles
    " set runtimepath+=~/.vim
    set runtimepath+=~/.vim/after
    source ~/.tvimrc.sorted
  endif
else
   set runtimepath=~/.vim,/usr/share/vim/vim82,~/.vim/after
   source ~/.tvimrc.sorted
endif
