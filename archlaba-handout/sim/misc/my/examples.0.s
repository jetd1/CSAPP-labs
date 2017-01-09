
examples.o.0：     文件格式 elf32-i386


Disassembly of section .text:

00000000 <sum_list>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
   d:	eb 11                	jmp    20 <sum_list+0x20>
   f:	8b 45 08             	mov    0x8(%ebp),%eax
  12:	8b 00                	mov    (%eax),%eax
  14:	01 45 fc             	add    %eax,-0x4(%ebp)
  17:	8b 45 08             	mov    0x8(%ebp),%eax
  1a:	8b 40 04             	mov    0x4(%eax),%eax
  1d:	89 45 08             	mov    %eax,0x8(%ebp)
  20:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  24:	75 e9                	jne    f <sum_list+0xf>
  26:	8b 45 fc             	mov    -0x4(%ebp),%eax
  29:	c9                   	leave  
  2a:	c3                   	ret    

0000002b <rsum_list>:
  2b:	55                   	push   %ebp
  2c:	89 e5                	mov    %esp,%ebp
  2e:	83 ec 18             	sub    $0x18,%esp
  31:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  35:	75 07                	jne    3e <rsum_list+0x13>
  37:	b8 00 00 00 00       	mov    $0x0,%eax
  3c:	eb 25                	jmp    63 <rsum_list+0x38>
  3e:	8b 45 08             	mov    0x8(%ebp),%eax
  41:	8b 00                	mov    (%eax),%eax
  43:	89 45 f0             	mov    %eax,-0x10(%ebp)
  46:	8b 45 08             	mov    0x8(%ebp),%eax
  49:	8b 40 04             	mov    0x4(%eax),%eax
  4c:	83 ec 0c             	sub    $0xc,%esp
  4f:	50                   	push   %eax
  50:	e8 fc ff ff ff       	call   51 <rsum_list+0x26>
  55:	83 c4 10             	add    $0x10,%esp
  58:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  61:	01 d0                	add    %edx,%eax
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <copy_block>:
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	83 ec 10             	sub    $0x10,%esp
  6b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  72:	eb 26                	jmp    9a <copy_block+0x35>
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8d 50 04             	lea    0x4(%eax),%edx
  7a:	89 55 08             	mov    %edx,0x8(%ebp)
  7d:	8b 00                	mov    (%eax),%eax
  7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	8d 50 04             	lea    0x4(%eax),%edx
  88:	89 55 0c             	mov    %edx,0xc(%ebp)
  8b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  8e:	89 10                	mov    %edx,(%eax)
  90:	8b 45 fc             	mov    -0x4(%ebp),%eax
  93:	31 45 f8             	xor    %eax,-0x8(%ebp)
  96:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  9a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  9e:	7f d4                	jg     74 <copy_block+0xf>
  a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  a3:	c9                   	leave  
  a4:	c3                   	ret    
