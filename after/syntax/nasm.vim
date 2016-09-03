syn keyword nasmStdInstruction LFENCE MFENCE SFENCE
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
