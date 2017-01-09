0000000000401a5f <add_xy>:
  401a5f:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401a63:	c3                   	retq   

////401a2b
////58
////popq %rax
000000000000000d <addval_172>:
   d:	8d 87 58 90 90 90    	lea    -0x6f6f6fa8(%rdi),%eax
  13:	c3                   	retq   

////401ab3
////48 89 e0 c3
////movq %rsp,%rax
0000000000000095 <setval_457>:
  95:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  9b:	c3                   	retq   

////401a40
////48 89 c7 c3
////movq %rax,%rdi
0000000000000022 <setval_180>:
  22:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  28:	c3                   	retq   

////401a90
////48 89 d1 c3
////movq %rdx,%rcx
0000000000000072 <addval_349>:
  72:	8d 87 48 89 d1 c3    	lea    -0x3c2e76b8(%rdi),%eax
  78:	c3                   	retq   

////89 e0 c3
////movl %esp,%eax
000000000000006b <addval_230>:
  6b:	8d 87 4a 89 e0 c3    	lea    -0x3c1f76b6(%rdi),%eax
  71:	c3                   	retq   

////401b06
////89 c2
////movl %eax,%edx
00000000000000e9 <getval_421>:
  e9:	b8 89 c2 90 90       	mov    $0x9090c289,%eax
  ee:	c3                   	retq   

////401a9f
////89 ce c3
////movl %ecx,%esi
0000000000000080 <setval_403>:
  80:	c7 07 83 89 ce c3    	movl   $0xc3ce8983,(%rdi)
  86:	c3                   	retq   

////401aba
////89 d1 84 c9 c3
////movl %edx,%ecx
////testb %cl,%cl
000000000000009c <setval_490>:
  9c:	c7 07 89 d1 84 c9    	movl   $0xc984d189,(%rdi)
  a2:	c3                   	retq   







////08 c9
////orb %cl,%cl
0000000000000048 <addval_213>:
  48:	8d 87 c9 d1 08 c9    	lea    -0x36f72e37(%rdi),%eax
  4e:	c3                   	retq   

////08 c0
////orb %al,%al
0000000000000056 <addval_212>:
  56:	8d 87 8d c2 08 c0    	lea    -0x3ff73d73(%rdi),%eax
  5c:	c3                   	retq   

////38 db
////cmpb %bl,%bl
0000000000000079 <addval_211>:
  79:	8d 87 88 c2 38 db    	lea    -0x24c73d78(%rdi),%eax
  7f:	c3                   	retq   


////84 c0
////testb %al,%al
00000000000000b1 <setval_384>:
  b1:	c7 07 81 ce 84 c0    	movl   $0xc084ce81,(%rdi)
  b7:	c3                   	retq   

////20 c0
////andb %al,%al
0000000000000103 <addval_379>:
 103:	8d 87 8b d1 20 c0    	lea    -0x3fdf2e75(%rdi),%eax
 109:	c3                   	retq   

////20 c9
////andb %cl,%cl
00000000000000b8 <setval_303>:
  b8:	c7 07 c9 ce 20 c9    	movl   $0xc920cec9,(%rdi)
  be:	c3                   	retq   

////84 c9
////testb %cl,%cl
00000000000000cd <setval_135>:
  cd:	c7 07 99 c2 84 c9    	movl   $0xc984c299,(%rdi)
  d3:	c3                   	retq   

////38 c0
////cmpb %al,%al
00000000000000e2 <addval_309>:
  e2:	8d 87 a9 c2 38 c0    	lea    -0x3fc73d57(%rdi),%eax
  e8:	c3                   	retq   










////89 ce 38 db c3
////movl %ecx,%esi
////cmpb %bl,%bl
0000000000000064 <setval_225>:
  64:	c7 07 89 ce 38 db    	movl   $0xdb38ce89,(%rdi)
  6a:	c3                   	retq   

////89 ce 38 db c3
////movl %ecx,%esi
////cmpb %bl,%bl
0000000000000064 <setval_225>:
  64:	c7 07 89 ce 38 db    	movl   $0xdb38ce89,(%rdi)
  6a:	c3                   	retq   