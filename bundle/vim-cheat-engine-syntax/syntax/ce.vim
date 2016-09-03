" Language:    CheatEngine Table (XML)
" Maintainer:  Sfinktah Bungholio <sfinktah@vim-ce.spamtrak.org>
" URL:         http://github.com/sfinktah/vim-cheat-engine-syntax
" License:     WTFPL

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" Bail if our syntax is already loaded.
if exists('b:current_syntax') && b:current_syntax == 'ct'
  finish
endif

silent! unlet b:current_syntax

runtime! syntax/xml.vim

let b:current_syntax = ''
unlet b:current_syntax
syntax include @xml syntax/xml.vim

" http://wiki.cheatengine.org/index.php?title=Cheat_Engine:Auto_Assembler
" http://wiki.cheatengine.org/index.php?title=Lua

let b:current_syntax = ''
unlet b:current_syntax
syntax include @Masm syntax/masm.vim
syntax region masmCode matchgroup=MasmSnip 
   \ start="[ENABLE]" 
   \ end="]]>" 
   \ containedin=xmlCdata
   \ contains=@Masm,autoAssembler,autoAssemblerArgs
            " \ start="<AssemblerScript>"
            " \ end="</AssemblerScript>"
   
" Auto Assembler Commands
" http://wiki.cheatengine.org/index.php?title=Cheat_Engine:Auto_Assembler
syn keyword autoAssembler aobscan aobscanmodule alloc createthread dealloc define fullaccess globalalloc include label loadbinary loadlibrary readmem registersymbol unregistersymbol
syn region autoAssemblerArgs start='(' end=')' 
" hi def link autoAssemlber SpecialKey
hi def autoAssemblerArgs term=italic ctermfg=9 ctermbg=0 
hi def link autoAssembler SpecialKey
" hi def link luaCeFunc Todo
" runtime! syntax/xml.vim
unlet b:current_syntax
syntax include @Lua syntax/lua.vim
syntax region luaCode
   \ start=+{$lua}\|]])+ 
   \ keepend
   \ end=+^\[\|{$asm}\|\[\[+ 
   \ containedin=masmCode
   \ contains=@Lua,luaCeFunc,autoAssembler

" syntax region autoAssemblerRegion
   " \ start="{$lua}" 
   " \ keepend
   " \ end=+^\[\|{$asm}+ 
   " \ containedin=masmCode
   " \ contains=@Lua,luaCeFunc,autoAssembler
" syn region luaString2 matchgroup=luaString start=+\[\[+ end=+\]\]+ contains=luaString2,@Spell,autoAssembler
" syn match autoAssemblerMatch "." containedin=luaString2 contains=autoAssembler

" syn keyword luaFunc containedin=luaCode
syn keyword luaCeFunc getAddressList findTableFile TableFile AOBScan
syn keyword luaCeFunc getCurrentMemscan openProcess onOpenProcess
syn keyword luaCeFunc getForegroundProcess getOpenedProcessID
syn keyword luaCeFunc getProcessIDFromProcessName pause unpause
syn keyword luaCeFunc targetIs64Bit speedhack_setSpeed getAddress
syn keyword luaCeFunc getNameFromAddress registerSymbol unregisterSymbol
syn keyword luaCeFunc reinitializeSymbolhandler inModule inSystemModule
syn keyword luaCeFunc errorOnLookupFailure readBytes readInteger
syn keyword luaCeFunc readFloat readDouble readString readRegionFromFile
syn keyword luaCeFunc writeBytes writeInteger writeFloat writeDouble
syn keyword luaCeFunc writeString writeRegionToFile getMousePos
syn keyword luaCeFunc setMousePos isKeyPressed keyDown keyUp doKeyPress
syn keyword luaCeFunc unhideMainCEwindow hideAllCEWindows
syn keyword luaCeFunc supportCheatEngine fuckCheatEngine
syn keyword luaCeFunc getCheatEngineDir readBytesLocal writeBytesLocal
syn keyword luaCeFunc cheatEngineIs64Bit closeCE showMessage
syn keyword luaCeFunc messageDialog playSound beep xmplayer_playXM
syn keyword luaCeFunc xmplayer_pause xmplayer_resume xmplayer_stop
syn keyword luaCeFunc xmplayer_isPlaying resetLuaState sleep onAutoGuess
syn keyword luaCeFunc registerCustomTypeLua custom type
syn keyword luaCeFunc registerCustomTypeAutoAssembler inheritsFromObject
syn keyword luaCeFunc inheritsFromComponent inheritsFromControl
syn keyword luaCeFunc inheritsFromWinControl autoAssemble disassemble
syn keyword luaCeFunc splitDisassembledString getInstructionSize
syn keyword luaCeFunc getPreviousOpcode debugProcess debug_setBreakpoint
syn keyword luaCeFunc debugger_onBreakpoint debug_removeBreakpoint
syn keyword luaCeFunc debug_continueFromBreakpoint
syn keyword luaCeFunc debug_setLastBranchRecording
syn keyword luaCeFunc debug_getMaxLastBranchRecord
syn keyword luaCeFunc debug_getLastBranchRecord debugger_onModuleLoad
syn keyword luaCeFunc getAutoAttachList debug_getContext
syn keyword luaCeFunc debug_setContext dbk_initialize
syn keyword luaCeFunc dbk_useKernelmodeOpenProcess
syn keyword luaCeFunc dbk_useKernelmodeProcessMemoryAccess
syn keyword luaCeFunc dbk_useKernelmodeQueryMemoryRegions
syn keyword luaCeFunc dbk_getPEProcess dbk_getPEThread dbk_readMSR
syn keyword luaCeFunc dbk_writeMSR dbk_executeKernelMemory
syn keyword luaCeFunc dbvm_initialize dbvm_readMSR dbvm_writeMSR
syn keyword luaCeFunc getPixel injectDll allocateSharedMemory
syn keyword luaCeFunc createProcess shellExecute generateAPIHookScript
syn keyword luaCeFunc onAPIPointerChange setAPIPointer getFormCount
syn keyword luaCeFunc getForm getMemoryViewForm getMainForm
syn keyword luaCeFunc getFreezeTimer getUpdateTimer getCommonModuleList
syn keyword luaCeFunc Addresslist Brush Button ButtonControl Canvas
syn keyword luaCeFunc CheatComponent CheckBox Component Control
syn keyword luaCeFunc Collection CollectionItem ComboBox CustomControl
syn keyword luaCeFunc Disassemblerview Edit FileStream Font Form
syn keyword luaCeFunc FoundList GenericHotkey Graphic GraphicControl
syn keyword luaCeFunc GroupBox Hexadecimalview Image Label ListBox
syn keyword luaCeFunc ListColumn ListColumns ListItem ListItems Listview
syn keyword luaCeFunc MainMenu Memo MemScan Menu MenuItem MemoryRecord
syn keyword luaCeFunc MemoryRecordHotkey MemoryStream Memoryview Object
syn keyword luaCeFunc Panel Pen Picture PopupMenu ProgressBar RadioGroup
syn keyword luaCeFunc OpenDialog SaveDialog Splitter Stringlist Strings
syn keyword luaCeFunc TableFile Timer ToggleBox TrackBar Wincontrol
syn keyword luaCeFunc getPropertyList setProperty getProperty
hi def link luaCeFunc Todo

hi SpecialKey cterm=none ctermfg=11

if !exists('b:current_syntax')
  let b:current_syntax = 'ct'
endif
