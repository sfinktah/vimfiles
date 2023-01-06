" Vim syntax file
" Language:     Mixed C and Assembly GCC objdump disassembly format.
" Maintainer:   Vihar Rai   oxcrete@yahoo.com
" Last Change:  2001 Oct 17
" Version:      0.1
" File Names:   *.dis
" Comment:      gcc -g -c xxx.c             /*output is xxx.o*/
"               objdump -S xxx.o > xxx.dis  /* creates disassembly mixed with source */
"               It does not recognize any opcodes, so it's processor independent.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
" if version < 600
  " so <sfile>:p:h/c.vim
" else
  " runtime! syntax/c.vim
  " unlet b:current_syntax
" endif

" syn region cBracket     transparent start='\[\|<::\@!' end=']\|:>'
"     contains=ALLBUT,nasmStdInstruction,cIdaStack,cIdaHexDump

syn sync clear

syn keyword cTodo   contained TODO FIXME XXX
syn region cComment     matchgroup=cCommentStart start=";" end="$" keepend contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell


" cCommentGroup allows adding matches for special things in comments
syn cluster     cCommentGroup   contains=cTodo,cBadContinuation

syn keyword nasmStdInstruction aaa aad aam aas adc add and arpl bound bsf bsr bt btc btr bts call call call
syn keyword nasmStdInstruction cbw cwde cdqe clc cld cli clts cmc cmp cmps cwd cdq cqo daa das dec div
syn keyword nasmStdInstruction enterw enter enterd enterq hlt idiv imul in inc ins int into int iretw iret
syn keyword nasmStdInstruction iretd iretq ja jae jb jbe jc jcxz jecxz jrcxz je jg jge jl jle jna jnae jnb
syn keyword nasmStdInstruction jnbe jnc jne jng jnge jnl jnle jno jnp jns jnz jo jp jpe jpo js jz jmp jmp
syn keyword nasmStdInstruction jmp jmp short lahf lar lea leavew leave leaved leaveq lgdt lidt lgs lss lds
syn keyword nasmStdInstruction les lfs lldt lmsw lock lods loopw loop loopd loopq loopwe loope loopde loopqe
syn keyword nasmStdInstruction loopwne loopne loopdne loopqne lsl ltr mov mov movs movsx movzx mul neg nop
syn keyword nasmStdInstruction not or out outs pop popaw popa popad popaq popfw popf popfd popfq push pushaw
syn keyword nasmStdInstruction pusha pushad pushaq pushfw pushf pushfd pushfq rcl rcr rol ror retn retf sahf
syn keyword nasmStdInstruction sal sar shl shr sbb scas seta setae setb setbe setc sete setg setge setl
syn keyword nasmStdInstruction setle setna setnae setnb setnbe setnc setne setng setnge setnl setnle setno
syn keyword nasmStdInstruction setnp setns setnz seto setp setpe setpo sets setz sgdt sidt shld shrd sldt
syn keyword nasmStdInstruction smsw stc std sti stos str sub test verr verw wait xchg xlat xor cmpxchg bswap
syn keyword nasmStdInstruction xadd invd wbinvd invlpg rdmsr wrmsr cpuid cmpxchg8b rdtsc rsm cmova cmovb
syn keyword nasmStdInstruction cmovbe cmovg cmovge cmovl cmovle cmovnb cmovno cmovnp cmovns cmovnz cmovo
syn keyword nasmStdInstruction cmovp cmovs cmovz fcmovb fcmove fcmovbe fcmovu fcmovnb fcmovne fcmovnbe
syn keyword nasmStdInstruction fcmovnu fcomi fucomi fcomip fucomip rdpmc fld fst fstp fxch fild fist fistp
syn keyword nasmStdInstruction fbld fbstp fadd faddp fiadd fsub fsubp fisub fsubr fsubrp fisubr fmul fmulp
syn keyword nasmStdInstruction fimul fdiv fdivp fidiv fdivr fdivrp fidivr fsqrt fscale fprem frndint fxtract
syn keyword nasmStdInstruction fabs fchs fcom fcomp fcompp ficom ficomp ftst fxam fptan fpatan f2xm1 fyl2x
syn keyword nasmStdInstruction fyl2xp1 fldz fld1 fldpi fldl2t fldl2e fldlg2 fldln2 finit fninit fsetpm fldcw
syn keyword nasmStdInstruction fstcw fnstcw fstsw fnstsw fclex fnclex fstenv fnstenv fldenv fsave fnsave
syn keyword nasmStdInstruction frstor fincstp fdecstp ffree fnop feni fneni fdisi fndisi fprem1 fsincos fsin
syn keyword nasmStdInstruction fcos fucom fucomp fucompp setalc svdc rsdc svldt rsldt svts rsts icebp
syn keyword nasmStdInstruction loadall emms movd movq packsswb packssdw packuswb paddb paddw paddd paddsb
syn keyword nasmStdInstruction paddsw paddusb paddusw pand pandn pcmpeqb pcmpeqw pcmpeqd pcmpgtb pcmpgtw
syn keyword nasmStdInstruction pcmpgtd pmaddwd pmulhw pmullw por psllw pslld psllq psraw psrad psrlw psrld
syn keyword nasmStdInstruction psrlq psubb psubw psubd psubsb psubsw psubusb psubusw punpckhbw punpckhwd
syn keyword nasmStdInstruction punpckhdq punpcklbw punpcklwd punpckldq pxor fxsave fxrstor sysenter sysexit
syn keyword nasmStdInstruction pavgusb pfadd pfsub pfsubr pfacc pfcmpge pfcmpgt pfcmpeq pfmin pfmax pi2fd
syn keyword nasmStdInstruction pf2id pfrcp pfrsqrt pfmul pfrcpit1 pfrsqit1 pfrcpit2 pmulhrw femms prefetch
syn keyword nasmStdInstruction prefetchw addps addss andnps andps cmpps cmpss comiss cvtpi2ps cvtps2pi
syn keyword nasmStdInstruction cvtsi2ss cvtss2si cvttps2pi cvttss2si divps divss ldmxcsr maxps maxss minps
syn keyword nasmStdInstruction minss movaps movhlps movhps movlhps movlps movmskps movss movups mulps mulss
syn keyword nasmStdInstruction orps rcpps rcpss rsqrtps rsqrtss shufps sqrtps sqrtss stmxcsr subps subss
syn keyword nasmStdInstruction ucomiss unpckhps unpcklps xorps pavgb pavgw pextrw pinsrw pmaxsw pmaxub
syn keyword nasmStdInstruction pminsw pminub pmovmskb pmulhuw psadbw pshufw maskmovq movntps movntq
syn keyword nasmStdInstruction prefetcht0 prefetcht1 prefetcht2 prefetchnta sfence cmpeqps cmpltps cmpleps
syn keyword nasmStdInstruction cmpunordps cmpneqps cmpnltps cmpnleps cmpordps cmpeqss cmpltss cmpless
syn keyword nasmStdInstruction cmpunordss cmpneqss cmpnltss cmpnless cmpordss pf2iw pfnacc pfpnacc pi2fw
syn keyword nasmStdInstruction pswapd fstp1 fcom2 fcomp3 fxch4 fcomp5 ffreep fxch7 fstp8 fstp9 addpd addsd
syn keyword nasmStdInstruction andnpd andpd clflush cmppd cmpsd comisd cvtdq2pd cvtdq2ps cvtpd2dq cvtpd2pi
syn keyword nasmStdInstruction cvtpd2ps cvtpi2pd cvtps2dq cvtps2pd cvtsd2si cvtsd2ss cvtsi2sd cvtss2sd
syn keyword nasmStdInstruction cvttpd2dq cvttpd2pi cvttps2dq cvttsd2si divpd divsd lfence maskmovdqu maxpd
syn keyword nasmStdInstruction maxsd mfence minpd minsd movapd movdq2q movdqa movdqu movhpd movlpd movmskpd
syn keyword nasmStdInstruction movntdq movnti movntpd movq2dq movsd movupd mulpd mulsd orpd paddq pause
syn keyword nasmStdInstruction pmuludq pshufd pshufhw pshuflw pslldq psrldq psubq punpckhqdq punpcklqdq
syn keyword nasmStdInstruction shufpd sqrtpd sqrtsd subpd subsd ucomisd unpckhpd unpcklpd xorpd syscall
syn keyword nasmStdInstruction sysret swapgs movddup movshdup movsldup movsxd cmpxchg16b addsubpd addsubps
syn keyword nasmStdInstruction haddpd haddps hsubpd hsubps monitor mwait fisttp lddqu psignb psignw psignd
syn keyword nasmStdInstruction pshufb pmulhrsw pmaddubsw phsubsw phaddsw phaddw phaddd phsubw phsubd palignr
syn keyword nasmStdInstruction pabsb pabsw pabsd vmcall vmclear vmlaunch vmresume vmptrld vmptrst vmread
syn keyword nasmStdInstruction vmwrite vmxoff vmxon ud2 rdtscp pfrcpv pfrsqrtv cmpeqpd cmpltpd cmplepd
syn keyword nasmStdInstruction cmpunordpd cmpneqpd cmpnltpd cmpnlepd cmpordpd cmpeqsd cmpltsd cmplesd
syn keyword nasmStdInstruction cmpunordsd cmpneqsd cmpnltsd cmpnlesd cmpordsd blendpd blendps blendvpd
syn keyword nasmStdInstruction blendvps dppd dpps extractps insertps movntdqa mpsadbw packusdw pblendvb
syn keyword nasmStdInstruction pblendw pcmpeqq pextrb pextrd pextrq phminposuw pinsrb pinsrd pinsrq pmaxsb
syn keyword nasmStdInstruction pmaxsd pmaxud pmaxuw pminsb pminsd pminud pminuw pmovsxbw pmovsxbd pmovsxbq
syn keyword nasmStdInstruction pmovsxwd pmovsxwq pmovsxdq pmovzxbw pmovzxbd pmovzxbq pmovzxwd pmovzxwq
syn keyword nasmStdInstruction pmovzxdq pmuldq pmulld ptest roundpd roundps roundsd roundss crc32 pcmpestri
syn keyword nasmStdInstruction pcmpestrm pcmpistri pcmpistrm pcmpgtq popcnt extrq insertq movntsd movntss
syn keyword nasmStdInstruction lzcnt xgetbv xrstor xsave xsetbv getsec clgi invlpga skinit stgi vmexit
syn keyword nasmStdInstruction vmload vmmcall vmrun vmsave invept invvpid movbe aesenc aesenclast aesdec
syn keyword nasmStdInstruction aesdeclast aesimc aeskeygenassist pclmulqdq retnw retnd retnq retfw retfd
syn keyword nasmStdInstruction retfq rdrand adcx adox andn bextr blsi blsmsk blsr bzhi clac mulx pdep pext
syn keyword nasmStdInstruction rorx sarx shlx shrx stac tzcnt xsaveopt invpcid rdseed rdfsbase rdgsbase
syn keyword nasmStdInstruction wrfsbase wrgsbase vaddpd vaddps vaddsd vaddss vaddsubpd vaddsubps vaesdec
syn keyword nasmStdInstruction vaesdeclast vaesenc vaesenclast vaesimc vaeskeygenassist vandnpd vandnps
syn keyword nasmStdInstruction vandpd vandps vblendpd vblendps vblendvpd vblendvps vbroadcastf128
syn keyword nasmStdInstruction vbroadcasti128 vbroadcastsd vbroadcastss vcmppd vcmpps vcmpsd vcmpss vcomisd
syn keyword nasmStdInstruction vcomiss vcvtdq2pd vcvtdq2ps vcvtpd2dq vcvtpd2ps vcvtph2ps vcvtps2dq vcvtps2pd
syn keyword nasmStdInstruction vcvtps2ph vcvtsd2si vcvtsd2ss vcvtsi2sd vcvtsi2ss vcvtss2sd vcvtss2si
syn keyword nasmStdInstruction vcvttpd2dq vcvttps2dq vcvttsd2si vcvttss2si vdivpd vdivps vdivsd vdivss vdppd
syn keyword nasmStdInstruction vdpps vextractf128 vextracti128 vextractps vfmadd132pd vfmadd132ps
syn keyword nasmStdInstruction vfmadd132sd vfmadd132ss vfmadd213pd vfmadd213ps vfmadd213sd vfmadd213ss
syn keyword nasmStdInstruction vfmadd231pd vfmadd231ps vfmadd231sd vfmadd231ss vfmaddsub132pd vfmaddsub132ps
syn keyword nasmStdInstruction vfmaddsub213pd vfmaddsub213ps vfmaddsub231pd vfmaddsub231ps vfmsub132pd
syn keyword nasmStdInstruction vfmsub132ps vfmsub132sd vfmsub132ss vfmsub213pd vfmsub213ps vfmsub213sd
syn keyword nasmStdInstruction vfmsub213ss vfmsub231pd vfmsub231ps vfmsub231sd vfmsub231ss vfmsubadd132pd
syn keyword nasmStdInstruction vfmsubadd132ps vfmsubadd213pd vfmsubadd213ps vfmsubadd231pd vfmsubadd231ps
syn keyword nasmStdInstruction vfnmadd132pd vfnmadd132ps vfnmadd132sd vfnmadd132ss vfnmadd213pd vfnmadd213ps
syn keyword nasmStdInstruction vfnmadd213sd vfnmadd213ss vfnmadd231pd vfnmadd231ps vfnmadd231sd vfnmadd231ss
syn keyword nasmStdInstruction vfnmsub132pd vfnmsub132ps vfnmsub132sd vfnmsub132ss vfnmsub213pd vfnmsub213ps
syn keyword nasmStdInstruction vfnmsub213sd vfnmsub213ss vfnmsub231pd vfnmsub231ps vfnmsub231sd vfnmsub231ss
syn keyword nasmStdInstruction vgatherdps vgatherdpd vgatherqps vgatherqpd vhaddpd vhaddps vhsubpd vhsubps
syn keyword nasmStdInstruction vinsertf128 vinserti128 vinsertps vlddqu vldmxcsr vmaskmovdqu vmaskmovpd
syn keyword nasmStdInstruction vmaskmovps vmaxpd vmaxps vmaxsd vmaxss vminpd vminps vminsd vminss vmovapd
syn keyword nasmStdInstruction vmovaps vmovd vmovddup vmovdqa vmovdqu vmovhlps vmovhpd vmovhps vmovlhps
syn keyword nasmStdInstruction vmovlpd vmovlps vmovmskpd vmovmskps vmovntdq vmovntdqa vmovntpd vmovntps
syn keyword nasmStdInstruction vmovntsd vmovntss vmovq vmovsd vmovshdup vmovsldup vmovss vmovupd vmovups
syn keyword nasmStdInstruction vmpsadbw vmulpd vmulps vmulsd vmulss vorpd vorps vpabsb vpabsd vpabsw
syn keyword nasmStdInstruction vpackssdw vpacksswb vpackusdw vpackuswb vpaddb vpaddd vpaddq vpaddsb vpaddsw
syn keyword nasmStdInstruction vpaddusb vpaddusw vpaddw vpalignr vpand vpandn vpavgb vpavgw vpblendd
syn keyword nasmStdInstruction vpblendvb vpblendw vpbroadcastb vpbroadcastd vpbroadcastq vpbroadcastw
syn keyword nasmStdInstruction vpclmulqdq vpcmpeqb vpcmpeqd vpcmpeqq vpcmpeqw vpcmpestri vpcmpestrm vpcmpgtb
syn keyword nasmStdInstruction vpcmpgtd vpcmpgtq vpcmpgtw vpcmpistri vpcmpistrm vperm2f128 vperm2i128 vpermd
syn keyword nasmStdInstruction vpermilpd vpermilps vpermpd vpermps vpermq vpextrb vpextrd vpextrq vpextrw
syn keyword nasmStdInstruction vpgatherdd vpgatherdq vpgatherqd vpgatherqq vphaddd vphaddsw vphaddw
syn keyword nasmStdInstruction vphminposuw vphsubd vphsubsw vphsubw vpinsrb vpinsrd vpinsrq vpinsrw
syn keyword nasmStdInstruction vpmaddubsw vpmaddwd vpmaskmovd vpmaskmovq vpmaxsb vpmaxsd vpmaxsw vpmaxub
syn keyword nasmStdInstruction vpmaxud vpmaxuw vpminsb vpminsd vpminsw vpminub vpminud vpminuw vpmovmskb
syn keyword nasmStdInstruction vpmovsxbd vpmovsxbq vpmovsxbw vpmovsxdq vpmovsxwd vpmovsxwq vpmovzxbd
syn keyword nasmStdInstruction vpmovzxbq vpmovzxbw vpmovzxdq vpmovzxwd vpmovzxwq vpmuldq vpmulhrsw vpmulhuw
syn keyword nasmStdInstruction vpmulhw vpmulld vpmullw vpmuludq vpor vpsadbw vpshufb vpshufd vpshufhw
syn keyword nasmStdInstruction vpshuflw vpsignb vpsignd vpsignw vpslld vpslldq vpsllq vpsllvd vpsllvq vpsllw
syn keyword nasmStdInstruction vpsrad vpsravd vpsraw vpsrld vpsrldq vpsrlq vpsrlvd vpsrlvq vpsrlw vpsubb
syn keyword nasmStdInstruction vpsubd vpsubq vpsubsb vpsubsw vpsubusb vpsubusw vpsubw vptest vpunpckhbw
syn keyword nasmStdInstruction vpunpckhdq vpunpckhqdq vpunpckhwd vpunpcklbw vpunpckldq vpunpcklqdq
syn keyword nasmStdInstruction vpunpcklwd vpxor vrcpps vrcpss vroundpd vroundps vroundsd vroundss vrsqrtps
syn keyword nasmStdInstruction vrsqrtss vshufpd vshufps vsqrtpd vsqrtps vsqrtsd vsqrtss vstmxcsr vsubpd
syn keyword nasmStdInstruction vsubps vsubsd vsubss vtestpd vtestps vucomisd vucomiss vunpckhpd vunpckhps
syn keyword nasmStdInstruction vunpcklpd vunpcklps vxorpd vxorps vzeroall vzeroupper xabort xbegin xend
syn keyword nasmStdInstruction xtest vmgetinfo vmsetinfo vmdxdsbl vmdxenbl vmcpuid vmhlt vmsplaf vmpushfd
syn keyword nasmStdInstruction vmpopfd vmcli vmsti vmiretd vmsgdt vmsidt vmsldt vmstr vmsdte vpcext
syn keyword nasmStdInstruction vfmaddsubps vfmaddsubpd vfmsubaddps vfmsubaddpd vfmaddps vfmaddpd vfmaddss
syn keyword nasmStdInstruction vfmaddsd vfmsubps vfmsubpd vfmsubss vfmsubsd vfnmaddps vfnmaddpd vfnmaddss
syn keyword nasmStdInstruction vfnmaddsd vfnmsubps vfnmsubpd vfnmsubss vfnmsubsd

syn keyword nasmType		far near short
syn keyword nasmType		byte word dword qword dqword hword dhword tword
syn keyword nasmType		cdecl fastcall none pascal stdcall

syn keyword cMixRegister rax eax ax al rbx ebx bx bl rcx ecx cx cl rdx edx dx dl rsi esi si sil rdi edi
syn keyword cMixRegister di dil rbp ebp bp bpl rsp esp sp spl r8 r8d r8w r8b r9 r9d r9w r9b r10 r10d
syn keyword cMixRegister r10w r10b r11 r11d r11w r11b r12 r12d r12w r12b r13 r13d r13w r13b r14 r14d
syn keyword cMixRegister r14w r14b r15 r15d r15w r15b ax cx dx bx sp bp si di r8 r9 r10 r11 r12 r13 r14
syn keyword cMixRegister r15 al cl dl bl ah ch dh bh spl bpl sil dil rip ip es cs ss ds fs gs cf zf sf of
syn keyword cMixRegister pf af tf if df efl st0 st1 st2 st3 st4 st5 st6 st7 fpctrl fpstat fptags mm0
syn keyword cMixRegister mm1 mm2 mm3 mm4 mm5 mm6 mm7 xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9
syn keyword cMixRegister xmm10 xmm11 xmm12 xmm13 xmm14 xmm15 mxcsr ymm0 ymm1 ymm2 ymm3 ymm4 ymm5 ymm6
syn keyword cMixRegister ymm7 ymm8 ymm9 ymm10 ymm11 ymm12 ymm13 ymm14 ymm15

syn keyword cMixRegister8 al cl dl bl ah spl ch bpl dh sil bh dil r8b r9b r10b r11b r12b r13b r14b r15b
syn keyword cMixRegisterIP r8w r9w r10w r11w r12w r13w r14w r15w ax cx dx bx sp bp si di
syn keyword cMixRegister32 eax ecx edx ebx esp ebp esi edi r8d r9d r10d r11d r12d r13d r14d r15d ip
syn keyword cMixRegister64 rax rcx rdx rbx rsp rbp rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 rip

" syn keyword cMixRegisterSP rsp esp

" REXR Bit: 0
" Mnem    /0    /1    /2    /3    /4     /5     /6      /7
" reg8    AL    CL    DL    BL    AH/SPL CH/BPL DH/SIL  BH/DIL
" reg16   AX    CX    DX    BX    SP     BP     SI      DI
" reg32   EAX   ECX   EDX   EBX   ESP    EBP    ESI     EDI
" reg64   RAX   RCX   RDX   RBX   RSP    RBP    RSI     RDI
" mmx     MMX0  MMX1  MMX2  MMX3  MMX4   MMX5   MMX6    MMX7
" xmm     XMM0  XMM1  XMM2  XMM3  XMM4   XMM5   XMM6    XMM7
" ymm     YMM0  YMM1  YMM2  YMM3  YMM4   YMM5   YMM6    YMM7
" sReg    ES    CS    SS    DS    FS     GS
" cReg    CR0   CR1   CR2   CR3   CR4    CR5    CR6     CR7
" dReg    DR0   DR1   DR2   DR3   DR4    DR5    DR6     DR7

" REXR Bit: 1
" reg8    R8B   R9B   R10B  R11B  R12B   R13B   R14B    R15B
" reg16   R8W   R9W   R10W  R11W  R12W   R13W   R14W    R15W
" reg32   R8D   R9D   R10D  R11D  R12D   R13D   R14D    R15D
" reg64   R8    R9    R10   R11   R12    R13    R14     R15
" mmx     MMX0  MMX1  MMX2  MMX3  MMX4   MMX5   MMX6    MMX7
" xmm     XMM8  XMM9  XMM10 XMM11 XMM12  XMM13  XMM14   XMM15
" ymm     YMM8  YMM9  YMM10 YMM11 YMM12  YMM13  YMM14   YMM15
" sReg    ES    CS    SS    DS    FS     GS
" cReg    CR8   CR9   CR10  CR11  CR12   CR13   CR14    CR15
" dReg    DR8   DR9   DR10  DR11  DR12   DR13   DR14    DR15
"
" 64-bit register Lower 32 bits Lower 16 bits Lower 8 bits
" 64-bit register Lower 32 bits Lower 16 bits Lower 8 bits
" rax
"
"                          64-bit Lower-32-bits Lower-16-bits Lower-8-bits
syn keyword cMixRegisterAX rax    eax           ax            al ah
syn keyword cMixRegisterBX rbx    ebx           bx            bl bh
syn keyword cMixRegisterCX rcx    ecx           cx            cl ch
syn keyword cMixRegisterDX rdx    edx           dx            dl dh
syn keyword cMixRegisterBP rbp    ebp           bp            bpl
syn keyword cMixRegisterSP rsp    esp           sp            spl
syn keyword cMixRegisterDI rdi    edi           di            dil
syn keyword cMixRegisterSI rsi    esi           si            sil
syn keyword cMixRegister8  r8     r8d           r8w           r8b
syn keyword cMixRegister9  r9     r9d           r9w           r9b
syn keyword cMixRegister10 r10    r10d          r10w          r10b
syn keyword cMixRegister11 r11    r11d          r11w          r11b
syn keyword cMixRegister12 r12    r12d          r12w          r12b
syn keyword cMixRegister13 r13    r13d          r13w          r13b
syn keyword cMixRegister14 r14    r14d          r14w          r14b
syn keyword cMixRegister15 r15    r15d          r15w          r15b
syn keyword cMixRegisterIP rip    ip          

syn match cUpperCamelCase "\C\<\([A-Z][a-z]\+\)\+\w*"
syn match win32api containedin=cBracket "\C\<\(Get\|Set\|File\|Crypt\|Create\|Info\|Window\|Enum\|Cert\|Key\|Printer\|Name\|To\|Reg\|Console\|Message\|Card\|Is\|System\|Add\|S\|Win\|Open\|Delete\|Context\|Find\|String\|Query\|Text\|Menu\|Store\|Cred\|Snmp\|Process\|Object\|Char\|W\|Net\|Certificate\|Service\|From\|Write\|Event\|Windows\|Resource\|Rect\|User\|Register\|Meta\|Load\|Evt\|Data\|Transacted\|Default\|Change\|Time\|Font\|Profile\|Thread\|Status\|Free\|Device\|Config\|Rgn\|Input\|Display\|Close\|UI\|Verify\|Pointer\|Item\|Http\|Dlg\|Comm\|Value\|Read\|Dns\|Notification\|Information\|Format\|Directory\|Point\|Path\|Msg\|In\|Global\|Color\|Class\|Mode\|Log\|Driver\|Copy\|Usb\|State\|Private\|List\|Handle\|Clipboard\|Wlx\|DC\|Cursor\|Box\|Type\|Processor\|Print\|Pipe\|Id\|For\|CTL\|Connection\|wgl\|Size\|Remove\|OID\|Indirect\|Volume\|Update\|Memory\|Long\|Hash\|Enh\|Cache\|Buffer\|Unregister\|Provider\|Param\|Palette\|Notify\|Map\|Dialog\|CRL\|Atom\|Virtual\|Lookup\|Local\|Job\|Icon\|Draw\|Current\|Send\|Raw\|Ptr\|Property\|Output\|Next\|Locale\|End\|Cancel\|By\|Url\|Shutdown\|Section\|Scroll\|Reader\|Pos\|Language\|Group\|Function\|Desktop\|Credentials\|Check\|Valid\|Touch\|Start\|Properties\|Proc\|Physical\|Numa\|First\|Fill\|Ext\|Ctx\|Chain\|And\|Act\|Version\|Timer\|Str\|Select\|Record\|Policy\|Named\|Monitor\|Layout\|Gdi\|Frame\|Duplicate\|Brush\|Bits\|Bitmap\|Alloc\|Wait\|Sign\|Settings\|Screen\|Move\|Keyboard\|Hook\|Formats\|Firmware\|Error\|Count\|Computer\|Compare\|Wow64\|Signature\|Security\|Power\|Poly\|Page\|Org\|Of\|Lock\|Languages\|Extent\|Clip\|Character\|Calendar\|Table\|Safer\|Response\|Request\|Replace\|Public\|Port\|Pen\|Out\|Oem\|Mount\|Mask\|Length\|Initialize\|ID\|ICM\|Export\|Environment\|Encrypted\|Encoded\|Destroy\|Def\|Ctrl\|Callback\|Blt\|Bad\|Audit\|Application\|Alarm\|Wintrust\|Ver\|Variable\|Use\|Usage\|Tape\|Station\|Server\|Pixel\|Number\|Node\|Module\|IME\|History\|Form\|Ex\|Entry\|Enable\|Dir\|Credential\|Control\|Connect\|Caret\|Call\|Buff\|Alias\|Account\|Working\|With\|View\|Unicode\|Translate\|Title\|Space\|Session\|Save\|Router\|Restore\|Release\|Prov\|Privilege\|Pages\|Mouse\|Mem\|Mapping\|Link\|Level\|Last\|Image\|Flush\|Fiber\|Doc\|Date\|CP\|Client\|Child\|Backup\|Async\|App\|Active\|Accelerator\|32\|Abort\)\+\(A\|W\|Ex\|s\)*\>"

syn case ignore
syn match       cNumbers        display transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctalError,cOctal
" Same, but without octal error (for comments)
syn match       cNumbersCom     display contained transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctal
syn match       cNumber         display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match       cNumber         display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match       cOctal          display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cOctalZero
syn match       cOctalZero      display contained "\<0"
syn match       cFloat          display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match       cFloat          display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match       cFloat          display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match       cFloat          display contained "\d\+e[-+]\=\d\+[fl]\=\>"
"hexadecimal floating point number, optional leading digits, with dot, with exponent
syn match       cFloat          display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
"hexadecimal floating point number, with leading digits, optional dot, with exponent
syn match       cFloat          display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
" Match the labels and Assembly lines
syn match       cMixLabel                "^\x\+\s\+<.*>:$"
syn match       cMixAsm                  "^\s*\x\+:\s\+\x\+.*$"
" syn match       cMixIdaAsm               "^\S\+:\x\+\s\+\([0-9A-Z-]\x\x\s\)\?\(\x\x\s\)\{1,\}" contains=cIdaStack,cIdaHexDump
" syn match       cMixIdaAsm               "^\S\+:\x\+\s\{5,\}"
syn match       cNumber         display contained "\x\+\(u\=l\{0,2}\|ll\=u\)h\>"
syn match       cMixUserLabel            "\C \<[A-Z0-9_]\+\>"
" In IDA's case, there will be a space before the label
syn match       cMixAutoLabel            "\C\<[a-z]\+_[A-F0-9]\+\>"
syn match cStackVar "\C\<\(var_\x\+\)"
" syn match       cComment                 ";.*$"

syn match       cPatch                "\$((\(.\{-}\)))"

syn match cMixIdaAsmStart  "^\S\+\x\+"                       nextgroup=cIdaStack        skipwhite
syn match cIdaStack        "\(\s-\?\x\+\>\)"                   nextgroup=cIdaStackDiff    skipwhite contained
syn match cIdaStackDiff    "\(\s\+[-]\x\+\>\)\?"               nextgroup=cIdaStackDiffPos skipwhite contained
syn match cIdaStackDiffPos "\(\s\+[+]\?\x\+\>\)\?"             nextgroup=cIdaStackDiffEx  skipwhite contained
syn match cIdaStackDiffEx  "\(\s*([+-]\?\x\+\>)\)\?"           nextgroup=cIdaSub          skipwhite contained
syn match cIdaSub          "\([a-zA-Z_]\w\+\>\)"               nextgroup=cIdaHexDump      skipwhite skipempty contained
syn match cIdaHexDump      "\(\<\x\x\>\s\)\+"                nextgroup=cIdaSpacing      skipwhite contained
syn match cIdaSpacing      "\s\{5,\}"                        contained
syn case match

" See :syn-skipempty (interesting also to see :syn-pattern-offset)
" Example: >
"   :syn match ifstart "\<if.*"   nextgroup=ifline skipwhite skipempty
"   :syn match ifline  "[^ \t].*" nextgroup=ifline skipwhite skipempty contained
"   :syn match ifline  "endif"  contained
" Note that the "[^ \t].*" match matches all non-white text.  Thus it would also

" .text:00007FF79D5DF749 008 48 89 2C 24                             mov    [rsp], rbp      ; push rbp
"------------------------------------------------------------------
"   GUIDE
"
"  First Token breakdown
"  00000084 <_main>:
"
"       ^       Beginning of line
"       \x\+    one or more hex
"       \s\+    one or more space
"       <.*>    zero or more characters enclosed within < >
"       :       literally :
"       $       End of Line.
"
"  Second Token breakdown
"  75:  69 64 0a 00 49 6e 76    imul   $0x61766e49,0x0(%edx,%ecx,1),%esp
"
"       ^       Beginning of line
"       \s*     zero or more spaces
"       \x\+    one or more hex digit
"       :       literally ":"
"       \s\+    one or more space
"       \x\+    one or more hex
"       $       EOL
"-------------------------------------------------------------------

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_cmix_syn_inits")
  if version < 508
    let did_cmix_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cStackVar               cMixAsm
  HiLink cUpperCamelCase         cMixLabel
  HiLink cMixLabel               DiffDelete
  HiLink cPatch                  DiffDelete
  HiLink cMixAsm                 Special
  HiLink nasmStdInstruction      Statement
  HiLink cMixRegister            cType
  HiLink cMixAutoLabel              Constant
  HiLink cMixUserLabel              Function
  " HiLink cIdaStack               Todo
  HiLink cIdaHexDump             Function
  " HiLink cIdaSub             DiffDelete

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link cFormat             cSpecial
hi def link cCppString          cString
hi def link cCommentL           cComment
hi def link cCommentStart       cComment
hi def link cLabel              Label
hi def link cUserLabel          Label
hi def link cConditional        Conditional
hi def link cRepeat             Repeat
hi def link cCharacter          Character
hi def link cSpecialCharacter   cSpecial
hi def link cNumber             Number
hi def link cOctal              Number
hi def link cOctalZero          PreProc  " link this to Error if you want
hi def link cFloat              Float
hi def link cOctalError         cError
hi def link cParenError         cError
hi def link cErrInParen         cError
hi def link cErrInBracket       cError
hi def link cCommentError       cError
hi def link cCommentStartError  cError
hi def link cSpaceError         cError
hi def link cSpecialError       cError
hi def link cCurlyError         cError
hi def link cOperator           Operator
hi def link cStructure          Structure
hi def link cStorageClass       StorageClass
hi def link cInclude            Include
hi def link cPreProc            PreProc
hi def link cDefine             Macro
hi def link cIncluded           cString
hi def link cError              Error
hi def link cStatement          Statement
hi def link cCppInWrapper       cCppOutWrapper
hi def link cCppOutWrapper      cPreCondit
hi def link cPreConditMatch     cPreCondit
hi def link cPreCondit          PreCondit
hi def link cType               Type
hi def link cConstant           Constant
hi def link cCommentString      cString
hi def link cComment2String     cString
hi def link cCommentSkip        cComment
hi def link cString             String
hi def link cComment            Comment
hi def link cSpecial            SpecialChar
hi def link cTodo               Todo
hi def link cBadContinuation    Error
hi def link cCppOutSkip         cCppOutIf2
hi def link cCppInElse2         cCppOutIf2
hi def link cCppOutIf2          cCppOut2  " Old syntax group for #if 0 body
hi def link cCppOut2            cCppOut  " Old syntax group for #if of #if 0
hi def link cCppOut             Comment
hi def link win32api            Todo
  delcommand HiLink
endif


let s:base03      = "#002b36"
let s:base02      = "#073642"
let s:base03      = "#002b36"
let s:base02      = "#073642"
let s:base01      = "#586e75"
let s:base00      = "#657b83"
let s:base0       = "#839496"
let s:base1       = "#93a1a1"
let s:base2       = "#eee8d5"
let s:base3       = "#fdf6e3"
let s:yellow      = "#b58900"
let s:orange      = "#cb4b16"
let s:red         = "#dc322f"
let s:magenta     = "#d33682"
let s:violet      = "#6c71c4"
let s:blue        = "#268bd2"
let s:cyan        = "#2aa198"
"let s:green       = "#859900" "original
let s:green       = "#719e07" "experimental

command -nargs=* SynColor hi def <args>
" 214 226 154 46  49  51  39  131 137 107 71  72  67  61  97 147 
" ax - 29 then 147
" SynColor cMixRegisterAX       term=none cterm=none ctermfg=29 guifg=#00875f  ctermbg=NONE gui=none  guibg=NONE guifg=#268b00
" SynColor cMixRegisterBX       term=none cterm=none ctermfg=208 guifg=#ff8700 ctermbg=NONE gui=none  guibg=NONE guifg=#cb4b16
" SynColor cMixRegisterCX       term=none cterm=none ctermfg=39 guifg=#00afff  ctermbg=NONE gui=none  guibg=NONE guifg=#2680ff
" SynColor cMixRegisterDX       term=none cterm=none ctermfg=176 guifg=#d787d7 ctermbg=NONE gui=none  guibg=NONE guifg=#d33682
" SynColor cMixRegisterSP       term=none cterm=none ctermfg=63 guifg=#5f5fff  ctermbg=NONE gui=none  guibg=NONE guifg=#6c71c4
SynColor cIdaStack        term=none cterm=none ctermfg=yellow ctermbg=NONE gui=none   guibg=NONE guifg=#dddd00 
SynColor cIdaStackDiff    term=none cterm=none ctermfg=46     ctermbg=NONE gui=none   guibg=NONE guifg=#00ff00 
SynColor cIdaStackDiffPos term=none cterm=none ctermfg=226    ctermbg=NONE gui=none   guibg=NONE guifg=#ffff00 
SynColor cIdaStackDiffEx  term=none cterm=none ctermfg=137    ctermbg=NONE gui=none   guibg=NONE guifg=#af875f 
SynColor cIdaSub          term=none cterm=none ctermfg=29     ctermbg=NONE gui=none   guibg=NONE guifg=#00875f 
SynColor cMixRegisterAX   term=none cterm=none ctermfg=147    ctermbg=NONE gui=none   guibg=NONE guifg=#afafff 
SynColor cMixRegisterBX   term=none cterm=none ctermfg=208    ctermbg=NONE gui=none   guibg=NONE guifg=#ff8700 
SynColor cMixRegisterCX   term=none cterm=none ctermfg=214    ctermbg=NONE gui=none   guibg=NONE guifg=#ffaf00 
SynColor cMixRegisterDX   term=none cterm=none ctermfg=226    ctermbg=NONE gui=none   guibg=NONE guifg=#ffff00 
SynColor cMixRegisterBP   term=none cterm=none ctermfg=154    ctermbg=NONE gui=none   guibg=NONE guifg=#afff00 
SynColor cMixRegisterSP   term=none cterm=none ctermfg=46     ctermbg=NONE gui=none   guibg=NONE guifg=#00ff00 
SynColor cMixRegisterDI   term=none cterm=none ctermfg=49     ctermbg=NONE gui=none   guibg=NONE guifg=#00ffaf 
SynColor cMixRegisterSI   term=none cterm=none ctermfg=51     ctermbg=NONE gui=none   guibg=NONE guifg=#00ffff 
SynColor cMixRegister8    term=none cterm=none ctermfg=39     ctermbg=NONE gui=none   guibg=NONE guifg=#00afff 
SynColor cMixRegister9    term=none cterm=none ctermfg=131    ctermbg=NONE gui=none   guibg=NONE guifg=#af5f5f 
SynColor cMixRegister10   term=none cterm=none ctermfg=137    ctermbg=NONE gui=none   guibg=NONE guifg=#af875f 
SynColor cMixRegister11   term=none cterm=none ctermfg=107    ctermbg=NONE gui=none   guibg=NONE guifg=#87af5f 
SynColor cMixRegister12   term=none cterm=none ctermfg=71     ctermbg=NONE gui=none   guibg=NONE guifg=#5faf5f 
SynColor cMixRegister13   term=none cterm=none ctermfg=72     ctermbg=NONE gui=none   guibg=NONE guifg=#5faf87 
SynColor cMixRegister14   term=none cterm=none ctermfg=67     ctermbg=NONE gui=none   guibg=NONE guifg=#5f87af 
SynColor cMixRegister15   term=none cterm=none ctermfg=61     ctermbg=NONE gui=none   guibg=NONE guifg=#5f5faf 
SynColor cMixRegisterIP   term=none cterm=none ctermfg=97     ctermbg=NONE gui=none   guibg=NONE guifg=#875faf 
SynColor Function         term=none cterm=none ctermfg=248    ctermbg=NONE gui=none   guibg=NONE guifg=#a8a8a8 

" SynColor cMixRegisterRAX term=none cterm=none ctermfg=32 guifg=#0087d7 ctermbg=NONE gui=none guibg=none guifg=#839496
" SynColor cMixRegisterRBX term=none cterm=none ctermfg=48 guifg=#00ff87 ctermbg=NONE gui=none guibg=none guifg=#839496
" SynColor cMixRegisterRCX term=none cterm=none ctermfg=64 guifg=#5f8700 ctermbg=NONE gui=none guibg=none guifg=#839496
" SynColor cMixRegisterRDX term=none cterm=none ctermfg=72 guifg=#5faf87   ctermbg=NONE gui=none guibg=none guifg=#839496
" SynColor cMixRegisterRSI term=none cterm=none ctermfg=96 guifg=#875f87  ctermbg=NONE gui=none guibg=none guifg=#839496
" " SynColor cMixRegisterRDI term=none cterm=none ctermfg=0x70 ctermbg=NONE gui=none guibg=none guifg=#839496
" SynColor cMixRegisterRBP term=none cterm=none ctermfg=128 guifg=#af00d7 ctermbg=NONE gui=none guibg=none guifg=#839496
" " SynColor cMixRegisterRSP term=none cterm=none ctermfg=0x90 ctermbg=NONE gui=none guibg=none guifg=#839496



delcommand SynColor
" vim: ts=8
"
"
