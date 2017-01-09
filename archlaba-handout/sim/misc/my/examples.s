
examples.o：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <sum_list>:
   0:	8b 54 24 04          	mov    0x4(%esp),%edx
   4:	31 c0                	xor    %eax,%eax
   6:	85 d2                	test   %edx,%edx
   8:	74 11                	je     1b <sum_list+0x1b>
   a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10:	03 02                	add    (%edx),%eax
  12:	8b 52 04             	mov    0x4(%edx),%edx
  15:	85 d2                	test   %edx,%edx
  17:	75 f7                	jne    10 <sum_list+0x10>
  19:	f3 c3                	repz ret 
  1b:	f3 c3                	repz ret 
  1d:	8d 76 00             	lea    0x0(%esi),%esi

00000020 <rsum_list>:
  20:	8b 54 24 04          	mov    0x4(%esp),%edx
  24:	31 c0                	xor    %eax,%eax
  26:	85 d2                	test   %edx,%edx
  28:	74 13                	je     3d <rsum_list+0x1d>
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  30:	8b 0a                	mov    (%edx),%ecx
  32:	8b 52 04             	mov    0x4(%edx),%edx
  35:	01 c8                	add    %ecx,%eax
  37:	85 d2                	test   %edx,%edx
  39:	75 f5                	jne    30 <rsum_list+0x10>
  3b:	f3 c3                	repz ret 
  3d:	f3 c3                	repz ret 
  3f:	90                   	nop

00000040 <copy_block>:
  40:	56                   	push   %esi
  41:	53                   	push   %ebx
  42:	31 c0                	xor    %eax,%eax
  44:	8b 54 24 14          	mov    0x14(%esp),%edx
  48:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  4c:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  50:	85 d2                	test   %edx,%edx
  52:	7e 17                	jle    6b <copy_block+0x2b>
  54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  58:	83 c1 04             	add    $0x4,%ecx
  5b:	8b 71 fc             	mov    -0x4(%ecx),%esi
  5e:	83 c3 04             	add    $0x4,%ebx
  61:	31 f0                	xor    %esi,%eax
  63:	83 ea 01             	sub    $0x1,%edx
  66:	89 73 fc             	mov    %esi,-0x4(%ebx)
  69:	75 ed                	jne    58 <copy_block+0x18>
  6b:	5b                   	pop    %ebx
  6c:	5e                   	pop    %esi
  6d:	c3                   	ret    
