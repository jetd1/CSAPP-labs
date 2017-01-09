
examples.1.o：     文件格式 elf64-x86-64


Disassembly of section .text:

0000000000000000 <sum_list>:
   0:	48 85 ff             	test   %rdi,%rdi
   3:	74 12                	je     17 <sum_list+0x17>
   5:	b8 00 00 00 00       	mov    $0x0,%eax
   a:	03 07                	add    (%rdi),%eax
   c:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  10:	48 85 ff             	test   %rdi,%rdi
  13:	75 f5                	jne    a <sum_list+0xa>
  15:	f3 c3                	repz retq 
  17:	b8 00 00 00 00       	mov    $0x0,%eax
  1c:	c3                   	retq   

000000000000001d <rsum_list>:
  1d:	b8 00 00 00 00       	mov    $0x0,%eax
  22:	48 85 ff             	test   %rdi,%rdi
  25:	74 10                	je     37 <rsum_list+0x1a>
  27:	53                   	push   %rbx
  28:	48 89 fb             	mov    %rdi,%rbx
  2b:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  2f:	e8 00 00 00 00       	callq  34 <rsum_list+0x17>
  34:	03 03                	add    (%rbx),%eax
  36:	5b                   	pop    %rbx
  37:	f3 c3                	repz retq 

0000000000000039 <copy_block>:
  39:	85 d2                	test   %edx,%edx
  3b:	7e 25                	jle    62 <copy_block+0x29>
  3d:	44 8d 42 ff          	lea    -0x1(%rdx),%r8d
  41:	49 83 c0 01          	add    $0x1,%r8
  45:	ba 00 00 00 00       	mov    $0x0,%edx
  4a:	b8 00 00 00 00       	mov    $0x0,%eax
  4f:	8b 0c 97             	mov    (%rdi,%rdx,4),%ecx
  52:	89 0c 96             	mov    %ecx,(%rsi,%rdx,4)
  55:	31 c8                	xor    %ecx,%eax
  57:	48 83 c2 01          	add    $0x1,%rdx
  5b:	4c 39 c2             	cmp    %r8,%rdx
  5e:	75 ef                	jne    4f <copy_block+0x16>
  60:	f3 c3                	repz retq 
  62:	b8 00 00 00 00       	mov    $0x0,%eax
  67:	c3                   	retq   
