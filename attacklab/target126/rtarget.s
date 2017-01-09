
rtarget：     文件格式 elf64-x86-64

Disassembly of section .text:

0000000000400ed0 <_start>:
  400ed0:	31 ed                	xor    %ebp,%ebp
  400ed2:	49 89 d1             	mov    %rdx,%r9
  400ed5:	5e                   	pop    %rsi
  400ed6:	48 89 e2             	mov    %rsp,%rdx
  400ed9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400edd:	50                   	push   %rax
  400ede:	54                   	push   %rsp
  400edf:	49 c7 c0 70 2f 40 00 	mov    $0x402f70,%r8
  400ee6:	48 c7 c1 00 2f 40 00 	mov    $0x402f00,%rcx
  400eed:	48 c7 c7 d5 11 40 00 	mov    $0x4011d5,%rdi
  400ef4:	e8 77 fe ff ff       	callq  400d70 <__libc_start_main@plt>
  400ef9:	f4                   	hlt    
  400efa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f00 <deregister_tm_clones>:
  400f00:	b8 b7 54 60 00       	mov    $0x6054b7,%eax
  400f05:	55                   	push   %rbp
  400f06:	48 2d b0 54 60 00    	sub    $0x6054b0,%rax
  400f0c:	48 83 f8 0e          	cmp    $0xe,%rax
  400f10:	48 89 e5             	mov    %rsp,%rbp
  400f13:	76 1b                	jbe    400f30 <deregister_tm_clones+0x30>
  400f15:	b8 00 00 00 00       	mov    $0x0,%eax
  400f1a:	48 85 c0             	test   %rax,%rax
  400f1d:	74 11                	je     400f30 <deregister_tm_clones+0x30>
  400f1f:	5d                   	pop    %rbp
  400f20:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f25:	ff e0                	jmpq   *%rax
  400f27:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400f2e:	00 00 
  400f30:	5d                   	pop    %rbp
  400f31:	c3                   	retq   
  400f32:	0f 1f 40 00          	nopl   0x0(%rax)
  400f36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400f3d:	00 00 00 

0000000000400f40 <register_tm_clones>:
  400f40:	be b0 54 60 00       	mov    $0x6054b0,%esi
  400f45:	55                   	push   %rbp
  400f46:	48 81 ee b0 54 60 00 	sub    $0x6054b0,%rsi
  400f4d:	48 c1 fe 03          	sar    $0x3,%rsi
  400f51:	48 89 e5             	mov    %rsp,%rbp
  400f54:	48 89 f0             	mov    %rsi,%rax
  400f57:	48 c1 e8 3f          	shr    $0x3f,%rax
  400f5b:	48 01 c6             	add    %rax,%rsi
  400f5e:	48 d1 fe             	sar    %rsi
  400f61:	74 15                	je     400f78 <register_tm_clones+0x38>
  400f63:	b8 00 00 00 00       	mov    $0x0,%eax
  400f68:	48 85 c0             	test   %rax,%rax
  400f6b:	74 0b                	je     400f78 <register_tm_clones+0x38>
  400f6d:	5d                   	pop    %rbp
  400f6e:	bf b0 54 60 00       	mov    $0x6054b0,%edi
  400f73:	ff e0                	jmpq   *%rax
  400f75:	0f 1f 00             	nopl   (%rax)
  400f78:	5d                   	pop    %rbp
  400f79:	c3                   	retq   
  400f7a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400f80 <__do_global_dtors_aux>:
  400f80:	80 3d 61 45 20 00 00 	cmpb   $0x0,0x204561(%rip)        # 6054e8 <completed.7585>
  400f87:	75 11                	jne    400f9a <__do_global_dtors_aux+0x1a>
  400f89:	55                   	push   %rbp
  400f8a:	48 89 e5             	mov    %rsp,%rbp
  400f8d:	e8 6e ff ff ff       	callq  400f00 <deregister_tm_clones>
  400f92:	5d                   	pop    %rbp
  400f93:	c6 05 4e 45 20 00 01 	movb   $0x1,0x20454e(%rip)        # 6054e8 <completed.7585>
  400f9a:	f3 c3                	repz retq 
  400f9c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400fa0 <frame_dummy>:
  400fa0:	bf 10 4e 60 00       	mov    $0x604e10,%edi
  400fa5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400fa9:	75 05                	jne    400fb0 <frame_dummy+0x10>
  400fab:	eb 93                	jmp    400f40 <register_tm_clones>
  400fad:	0f 1f 00             	nopl   (%rax)
  400fb0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb5:	48 85 c0             	test   %rax,%rax
  400fb8:	74 f1                	je     400fab <frame_dummy+0xb>
  400fba:	55                   	push   %rbp
  400fbb:	48 89 e5             	mov    %rsp,%rbp
  400fbe:	ff d0                	callq  *%rax
  400fc0:	5d                   	pop    %rbp
  400fc1:	e9 7a ff ff ff       	jmpq   400f40 <register_tm_clones>

0000000000400fc6 <usage>:
  400fc6:	48 83 ec 08          	sub    $0x8,%rsp
  400fca:	48 89 fa             	mov    %rdi,%rdx
  400fcd:	83 3d 54 45 20 00 00 	cmpl   $0x0,0x204554(%rip)        # 605528 <is_checker>
  400fd4:	74 3e                	je     401014 <usage+0x4e>
  400fd6:	be 88 2f 40 00       	mov    $0x402f88,%esi
  400fdb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fe0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fe5:	e8 36 fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fea:	bf c0 2f 40 00       	mov    $0x402fc0,%edi
  400fef:	e8 fc fc ff ff       	callq  400cf0 <puts@plt>
  400ff4:	bf 38 31 40 00       	mov    $0x403138,%edi
  400ff9:	e8 f2 fc ff ff       	callq  400cf0 <puts@plt>
  400ffe:	bf e8 2f 40 00       	mov    $0x402fe8,%edi
  401003:	e8 e8 fc ff ff       	callq  400cf0 <puts@plt>
  401008:	bf 52 31 40 00       	mov    $0x403152,%edi
  40100d:	e8 de fc ff ff       	callq  400cf0 <puts@plt>
  401012:	eb 32                	jmp    401046 <usage+0x80>
  401014:	be 6e 31 40 00       	mov    $0x40316e,%esi
  401019:	bf 01 00 00 00       	mov    $0x1,%edi
  40101e:	b8 00 00 00 00       	mov    $0x0,%eax
  401023:	e8 f8 fd ff ff       	callq  400e20 <__printf_chk@plt>
  401028:	bf 10 30 40 00       	mov    $0x403010,%edi
  40102d:	e8 be fc ff ff       	callq  400cf0 <puts@plt>
  401032:	bf 38 30 40 00       	mov    $0x403038,%edi
  401037:	e8 b4 fc ff ff       	callq  400cf0 <puts@plt>
  40103c:	bf 8c 31 40 00       	mov    $0x40318c,%edi
  401041:	e8 aa fc ff ff       	callq  400cf0 <puts@plt>
  401046:	bf 00 00 00 00       	mov    $0x0,%edi
  40104b:	e8 20 fe ff ff       	callq  400e70 <exit@plt>

0000000000401050 <initialize_target>:
  401050:	55                   	push   %rbp
  401051:	53                   	push   %rbx
  401052:	48 81 ec 18 21 00 00 	sub    $0x2118,%rsp
  401059:	89 f5                	mov    %esi,%ebp
  40105b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401062:	00 00 
  401064:	48 89 84 24 08 21 00 	mov    %rax,0x2108(%rsp)
  40106b:	00 
  40106c:	31 c0                	xor    %eax,%eax
  40106e:	89 3d a4 44 20 00    	mov    %edi,0x2044a4(%rip)        # 605518 <check_level>
  401074:	8b 3d ee 40 20 00    	mov    0x2040ee(%rip),%edi        # 605168 <target_id>
  40107a:	e8 5b 1e 00 00       	callq  402eda <gencookie>
  40107f:	89 05 9f 44 20 00    	mov    %eax,0x20449f(%rip)        # 605524 <cookie>
  401085:	89 c7                	mov    %eax,%edi
  401087:	e8 4e 1e 00 00       	callq  402eda <gencookie>
  40108c:	89 05 8e 44 20 00    	mov    %eax,0x20448e(%rip)        # 605520 <authkey>
  401092:	8b 05 d0 40 20 00    	mov    0x2040d0(%rip),%eax        # 605168 <target_id>
  401098:	8d 78 01             	lea    0x1(%rax),%edi
  40109b:	e8 20 fc ff ff       	callq  400cc0 <srandom@plt>
  4010a0:	e8 3b fd ff ff       	callq  400de0 <random@plt>
  4010a5:	89 c7                	mov    %eax,%edi
  4010a7:	e8 03 03 00 00       	callq  4013af <scramble>
  4010ac:	89 c3                	mov    %eax,%ebx
  4010ae:	85 ed                	test   %ebp,%ebp
  4010b0:	74 18                	je     4010ca <initialize_target+0x7a>
  4010b2:	bf 00 00 00 00       	mov    $0x0,%edi
  4010b7:	e8 14 fd ff ff       	callq  400dd0 <time@plt>
  4010bc:	89 c7                	mov    %eax,%edi
  4010be:	e8 fd fb ff ff       	callq  400cc0 <srandom@plt>
  4010c3:	e8 18 fd ff ff       	callq  400de0 <random@plt>
  4010c8:	eb 05                	jmp    4010cf <initialize_target+0x7f>
  4010ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4010cf:	01 c3                	add    %eax,%ebx
  4010d1:	0f b7 db             	movzwl %bx,%ebx
  4010d4:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  4010db:	89 c0                	mov    %eax,%eax
  4010dd:	48 89 05 bc 43 20 00 	mov    %rax,0x2043bc(%rip)        # 6054a0 <buf_offset>
  4010e4:	c6 05 5d 50 20 00 72 	movb   $0x72,0x20505d(%rip)        # 606148 <target_prefix>
  4010eb:	83 3d b6 43 20 00 00 	cmpl   $0x0,0x2043b6(%rip)        # 6054a8 <notify>
  4010f2:	0f 84 bb 00 00 00    	je     4011b3 <initialize_target+0x163>
  4010f8:	83 3d 29 44 20 00 00 	cmpl   $0x0,0x204429(%rip)        # 605528 <is_checker>
  4010ff:	0f 85 ae 00 00 00    	jne    4011b3 <initialize_target+0x163>
  401105:	be 00 01 00 00       	mov    $0x100,%esi
  40110a:	48 89 e7             	mov    %rsp,%rdi
  40110d:	e8 4e fd ff ff       	callq  400e60 <gethostname@plt>
  401112:	85 c0                	test   %eax,%eax
  401114:	74 25                	je     40113b <initialize_target+0xeb>
  401116:	bf 68 30 40 00       	mov    $0x403068,%edi
  40111b:	e8 d0 fb ff ff       	callq  400cf0 <puts@plt>
  401120:	bf 08 00 00 00       	mov    $0x8,%edi
  401125:	e8 46 fd ff ff       	callq  400e70 <exit@plt>
  40112a:	48 89 e6             	mov    %rsp,%rsi
  40112d:	e8 6e fb ff ff       	callq  400ca0 <strcasecmp@plt>
  401132:	85 c0                	test   %eax,%eax
  401134:	74 21                	je     401157 <initialize_target+0x107>
  401136:	83 c3 01             	add    $0x1,%ebx
  401139:	eb 05                	jmp    401140 <initialize_target+0xf0>
  40113b:	bb 00 00 00 00       	mov    $0x0,%ebx
  401140:	48 63 c3             	movslq %ebx,%rax
  401143:	48 8b 3c c5 80 51 60 	mov    0x605180(,%rax,8),%rdi
  40114a:	00 
  40114b:	48 85 ff             	test   %rdi,%rdi
  40114e:	75 da                	jne    40112a <initialize_target+0xda>
  401150:	b8 00 00 00 00       	mov    $0x0,%eax
  401155:	eb 05                	jmp    40115c <initialize_target+0x10c>
  401157:	b8 01 00 00 00       	mov    $0x1,%eax
  40115c:	85 c0                	test   %eax,%eax
  40115e:	75 1c                	jne    40117c <initialize_target+0x12c>
  401160:	48 89 e2             	mov    %rsp,%rdx
  401163:	be a0 30 40 00       	mov    $0x4030a0,%esi
  401168:	bf 01 00 00 00       	mov    $0x1,%edi
  40116d:	e8 ae fc ff ff       	callq  400e20 <__printf_chk@plt>
  401172:	bf 08 00 00 00       	mov    $0x8,%edi
  401177:	e8 f4 fc ff ff       	callq  400e70 <exit@plt>
  40117c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401183:	00 
  401184:	e8 bb 1a 00 00       	callq  402c44 <init_driver>
  401189:	85 c0                	test   %eax,%eax
  40118b:	79 26                	jns    4011b3 <initialize_target+0x163>
  40118d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401194:	00 
  401195:	be e0 30 40 00       	mov    $0x4030e0,%esi
  40119a:	bf 01 00 00 00       	mov    $0x1,%edi
  40119f:	b8 00 00 00 00       	mov    $0x0,%eax
  4011a4:	e8 77 fc ff ff       	callq  400e20 <__printf_chk@plt>
  4011a9:	bf 08 00 00 00       	mov    $0x8,%edi
  4011ae:	e8 bd fc ff ff       	callq  400e70 <exit@plt>
  4011b3:	48 8b 84 24 08 21 00 	mov    0x2108(%rsp),%rax
  4011ba:	00 
  4011bb:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011c2:	00 00 
  4011c4:	74 05                	je     4011cb <initialize_target+0x17b>
  4011c6:	e8 45 fb ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4011cb:	48 81 c4 18 21 00 00 	add    $0x2118,%rsp
  4011d2:	5b                   	pop    %rbx
  4011d3:	5d                   	pop    %rbp
  4011d4:	c3                   	retq   

00000000004011d5 <main>:
  4011d5:	41 56                	push   %r14
  4011d7:	41 55                	push   %r13
  4011d9:	41 54                	push   %r12
  4011db:	55                   	push   %rbp
  4011dc:	53                   	push   %rbx
  4011dd:	41 89 fc             	mov    %edi,%r12d
  4011e0:	48 89 f3             	mov    %rsi,%rbx
  4011e3:	be 64 1f 40 00       	mov    $0x401f64,%esi
  4011e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011ed:	e8 8e fb ff ff       	callq  400d80 <signal@plt>
  4011f2:	be 16 1f 40 00       	mov    $0x401f16,%esi
  4011f7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011fc:	e8 7f fb ff ff       	callq  400d80 <signal@plt>
  401201:	be b2 1f 40 00       	mov    $0x401fb2,%esi
  401206:	bf 04 00 00 00       	mov    $0x4,%edi
  40120b:	e8 70 fb ff ff       	callq  400d80 <signal@plt>
  401210:	83 3d 11 43 20 00 00 	cmpl   $0x0,0x204311(%rip)        # 605528 <is_checker>
  401217:	74 20                	je     401239 <main+0x64>
  401219:	be 00 20 40 00       	mov    $0x402000,%esi
  40121e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401223:	e8 58 fb ff ff       	callq  400d80 <signal@plt>
  401228:	bf 05 00 00 00       	mov    $0x5,%edi
  40122d:	e8 0e fb ff ff       	callq  400d40 <alarm@plt>
  401232:	bd aa 31 40 00       	mov    $0x4031aa,%ebp
  401237:	eb 05                	jmp    40123e <main+0x69>
  401239:	bd a5 31 40 00       	mov    $0x4031a5,%ebp
  40123e:	48 8b 05 7b 42 20 00 	mov    0x20427b(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401245:	48 89 05 c4 42 20 00 	mov    %rax,0x2042c4(%rip)        # 605510 <infile>
  40124c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401252:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401258:	e9 c6 00 00 00       	jmpq   401323 <main+0x14e>
  40125d:	83 e8 61             	sub    $0x61,%eax
  401260:	3c 10                	cmp    $0x10,%al
  401262:	0f 87 9c 00 00 00    	ja     401304 <main+0x12f>
  401268:	0f b6 c0             	movzbl %al,%eax
  40126b:	ff 24 c5 f0 31 40 00 	jmpq   *0x4031f0(,%rax,8)
  401272:	48 8b 3b             	mov    (%rbx),%rdi
  401275:	e8 4c fd ff ff       	callq  400fc6 <usage>
  40127a:	be fd 34 40 00       	mov    $0x4034fd,%esi
  40127f:	48 8b 3d 42 42 20 00 	mov    0x204242(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401286:	e8 a5 fb ff ff       	callq  400e30 <fopen@plt>
  40128b:	48 89 05 7e 42 20 00 	mov    %rax,0x20427e(%rip)        # 605510 <infile>
  401292:	48 85 c0             	test   %rax,%rax
  401295:	0f 85 88 00 00 00    	jne    401323 <main+0x14e>
  40129b:	48 8b 0d 26 42 20 00 	mov    0x204226(%rip),%rcx        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012a2:	ba b2 31 40 00       	mov    $0x4031b2,%edx
  4012a7:	be 01 00 00 00       	mov    $0x1,%esi
  4012ac:	48 8b 3d 2d 42 20 00 	mov    0x20422d(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4012b3:	e8 d8 fb ff ff       	callq  400e90 <__fprintf_chk@plt>
  4012b8:	b8 01 00 00 00       	mov    $0x1,%eax
  4012bd:	e9 e4 00 00 00       	jmpq   4013a6 <main+0x1d1>
  4012c2:	ba 10 00 00 00       	mov    $0x10,%edx
  4012c7:	be 00 00 00 00       	mov    $0x0,%esi
  4012cc:	48 8b 3d f5 41 20 00 	mov    0x2041f5(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012d3:	e8 78 fb ff ff       	callq  400e50 <strtoul@plt>
  4012d8:	41 89 c6             	mov    %eax,%r14d
  4012db:	eb 46                	jmp    401323 <main+0x14e>
  4012dd:	ba 0a 00 00 00       	mov    $0xa,%edx
  4012e2:	be 00 00 00 00       	mov    $0x0,%esi
  4012e7:	48 8b 3d da 41 20 00 	mov    0x2041da(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012ee:	e8 bd fa ff ff       	callq  400db0 <strtol@plt>
  4012f3:	41 89 c5             	mov    %eax,%r13d
  4012f6:	eb 2b                	jmp    401323 <main+0x14e>
  4012f8:	c7 05 a6 41 20 00 00 	movl   $0x0,0x2041a6(%rip)        # 6054a8 <notify>
  4012ff:	00 00 00 
  401302:	eb 1f                	jmp    401323 <main+0x14e>
  401304:	0f be d2             	movsbl %dl,%edx
  401307:	be cf 31 40 00       	mov    $0x4031cf,%esi
  40130c:	bf 01 00 00 00       	mov    $0x1,%edi
  401311:	b8 00 00 00 00       	mov    $0x0,%eax
  401316:	e8 05 fb ff ff       	callq  400e20 <__printf_chk@plt>
  40131b:	48 8b 3b             	mov    (%rbx),%rdi
  40131e:	e8 a3 fc ff ff       	callq  400fc6 <usage>
  401323:	48 89 ea             	mov    %rbp,%rdx
  401326:	48 89 de             	mov    %rbx,%rsi
  401329:	44 89 e7             	mov    %r12d,%edi
  40132c:	e8 0f fb ff ff       	callq  400e40 <getopt@plt>
  401331:	89 c2                	mov    %eax,%edx
  401333:	3c ff                	cmp    $0xff,%al
  401335:	0f 85 22 ff ff ff    	jne    40125d <main+0x88>
  40133b:	be 01 00 00 00       	mov    $0x1,%esi
  401340:	44 89 ef             	mov    %r13d,%edi
  401343:	e8 08 fd ff ff       	callq  401050 <initialize_target>
  401348:	83 3d d9 41 20 00 00 	cmpl   $0x0,0x2041d9(%rip)        # 605528 <is_checker>
  40134f:	74 2a                	je     40137b <main+0x1a6>
  401351:	44 3b 35 c8 41 20 00 	cmp    0x2041c8(%rip),%r14d        # 605520 <authkey>
  401358:	74 21                	je     40137b <main+0x1a6>
  40135a:	44 89 f2             	mov    %r14d,%edx
  40135d:	be 08 31 40 00       	mov    $0x403108,%esi
  401362:	bf 01 00 00 00       	mov    $0x1,%edi
  401367:	b8 00 00 00 00       	mov    $0x0,%eax
  40136c:	e8 af fa ff ff       	callq  400e20 <__printf_chk@plt>
  401371:	b8 00 00 00 00       	mov    $0x0,%eax
  401376:	e8 37 08 00 00       	callq  401bb2 <check_fail>
  40137b:	8b 15 a3 41 20 00    	mov    0x2041a3(%rip),%edx        # 605524 <cookie>
  401381:	be e2 31 40 00       	mov    $0x4031e2,%esi
  401386:	bf 01 00 00 00       	mov    $0x1,%edi
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	e8 8b fa ff ff       	callq  400e20 <__printf_chk@plt>
  401395:	48 8b 3d 04 41 20 00 	mov    0x204104(%rip),%rdi        # 6054a0 <buf_offset>
  40139c:	e8 b2 0c 00 00       	callq  402053 <launch>
  4013a1:	b8 00 00 00 00       	mov    $0x0,%eax
  4013a6:	5b                   	pop    %rbx
  4013a7:	5d                   	pop    %rbp
  4013a8:	41 5c                	pop    %r12
  4013aa:	41 5d                	pop    %r13
  4013ac:	41 5e                	pop    %r14
  4013ae:	c3                   	retq   

00000000004013af <scramble>:
  4013af:	48 83 ec 38          	sub    $0x38,%rsp
  4013b3:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4013ba:	00 00 
  4013bc:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
  4013c1:	31 c0                	xor    %eax,%eax
  4013c3:	eb 10                	jmp    4013d5 <scramble+0x26>
  4013c5:	69 d0 4c 7e 00 00    	imul   $0x7e4c,%eax,%edx
  4013cb:	01 fa                	add    %edi,%edx
  4013cd:	89 c1                	mov    %eax,%ecx
  4013cf:	89 14 8c             	mov    %edx,(%rsp,%rcx,4)
  4013d2:	83 c0 01             	add    $0x1,%eax
  4013d5:	83 f8 09             	cmp    $0x9,%eax
  4013d8:	76 eb                	jbe    4013c5 <scramble+0x16>
  4013da:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4013de:	69 c0 41 ae 00 00    	imul   $0xae41,%eax,%eax
  4013e4:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4013e8:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4013ec:	69 c0 c1 37 00 00    	imul   $0x37c1,%eax,%eax
  4013f2:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4013f6:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4013fa:	69 c0 0e 55 00 00    	imul   $0x550e,%eax,%eax
  401400:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401404:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401408:	69 c0 1a df 00 00    	imul   $0xdf1a,%eax,%eax
  40140e:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401412:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401416:	69 c0 89 8f 00 00    	imul   $0x8f89,%eax,%eax
  40141c:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401420:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401424:	69 c0 f6 c0 00 00    	imul   $0xc0f6,%eax,%eax
  40142a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40142e:	8b 04 24             	mov    (%rsp),%eax
  401431:	69 c0 2a dd 00 00    	imul   $0xdd2a,%eax,%eax
  401437:	89 04 24             	mov    %eax,(%rsp)
  40143a:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40143e:	69 c0 27 a1 00 00    	imul   $0xa127,%eax,%eax
  401444:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401448:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40144c:	69 c0 da ba 00 00    	imul   $0xbada,%eax,%eax
  401452:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401456:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40145a:	6b c0 47             	imul   $0x47,%eax,%eax
  40145d:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401461:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401465:	69 c0 87 e9 00 00    	imul   $0xe987,%eax,%eax
  40146b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40146f:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401473:	69 c0 32 5a 00 00    	imul   $0x5a32,%eax,%eax
  401479:	89 44 24 20          	mov    %eax,0x20(%rsp)
  40147d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401481:	69 c0 6c bd 00 00    	imul   $0xbd6c,%eax,%eax
  401487:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40148b:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40148f:	69 c0 ff a8 00 00    	imul   $0xa8ff,%eax,%eax
  401495:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401499:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  40149d:	69 c0 85 97 00 00    	imul   $0x9785,%eax,%eax
  4014a3:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4014a7:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4014ab:	69 c0 37 cc 00 00    	imul   $0xcc37,%eax,%eax
  4014b1:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4014b5:	8b 04 24             	mov    (%rsp),%eax
  4014b8:	69 c0 b6 23 00 00    	imul   $0x23b6,%eax,%eax
  4014be:	89 04 24             	mov    %eax,(%rsp)
  4014c1:	8b 04 24             	mov    (%rsp),%eax
  4014c4:	69 c0 dd d1 00 00    	imul   $0xd1dd,%eax,%eax
  4014ca:	89 04 24             	mov    %eax,(%rsp)
  4014cd:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4014d1:	69 c0 85 1b 00 00    	imul   $0x1b85,%eax,%eax
  4014d7:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4014db:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4014df:	69 c0 ac 4b 00 00    	imul   $0x4bac,%eax,%eax
  4014e5:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4014e9:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4014ed:	69 c0 bf 68 00 00    	imul   $0x68bf,%eax,%eax
  4014f3:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014f7:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4014fb:	69 c0 f5 9a 00 00    	imul   $0x9af5,%eax,%eax
  401501:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401505:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401509:	69 c0 e3 bf 00 00    	imul   $0xbfe3,%eax,%eax
  40150f:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401513:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401517:	69 c0 dd 4d 00 00    	imul   $0x4ddd,%eax,%eax
  40151d:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401521:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401525:	69 c0 99 93 00 00    	imul   $0x9399,%eax,%eax
  40152b:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40152f:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401533:	69 c0 25 09 00 00    	imul   $0x925,%eax,%eax
  401539:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40153d:	8b 04 24             	mov    (%rsp),%eax
  401540:	69 c0 71 ca 00 00    	imul   $0xca71,%eax,%eax
  401546:	89 04 24             	mov    %eax,(%rsp)
  401549:	8b 44 24 10          	mov    0x10(%rsp),%eax
  40154d:	69 c0 1b bb 00 00    	imul   $0xbb1b,%eax,%eax
  401553:	89 44 24 10          	mov    %eax,0x10(%rsp)
  401557:	8b 44 24 24          	mov    0x24(%rsp),%eax
  40155b:	69 c0 d7 54 00 00    	imul   $0x54d7,%eax,%eax
  401561:	89 44 24 24          	mov    %eax,0x24(%rsp)
  401565:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401569:	69 c0 c9 d5 00 00    	imul   $0xd5c9,%eax,%eax
  40156f:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401573:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401577:	69 c0 4c 4b 00 00    	imul   $0x4b4c,%eax,%eax
  40157d:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401581:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401585:	69 c0 22 32 00 00    	imul   $0x3222,%eax,%eax
  40158b:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40158f:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  401593:	69 c0 f9 a5 00 00    	imul   $0xa5f9,%eax,%eax
  401599:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  40159d:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4015a1:	69 c0 c7 e7 00 00    	imul   $0xe7c7,%eax,%eax
  4015a7:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4015ab:	8b 44 24 10          	mov    0x10(%rsp),%eax
  4015af:	69 c0 f6 b4 00 00    	imul   $0xb4f6,%eax,%eax
  4015b5:	89 44 24 10          	mov    %eax,0x10(%rsp)
  4015b9:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015bd:	69 c0 8c 6c 00 00    	imul   $0x6c8c,%eax,%eax
  4015c3:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015c7:	8b 44 24 14          	mov    0x14(%rsp),%eax
  4015cb:	69 c0 17 40 00 00    	imul   $0x4017,%eax,%eax
  4015d1:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4015d5:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015d9:	69 c0 9f 63 00 00    	imul   $0x639f,%eax,%eax
  4015df:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015e3:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4015e7:	69 c0 9d 43 00 00    	imul   $0x439d,%eax,%eax
  4015ed:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4015f1:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4015f5:	69 c0 b8 7a 00 00    	imul   $0x7ab8,%eax,%eax
  4015fb:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4015ff:	8b 44 24 10          	mov    0x10(%rsp),%eax
  401603:	69 c0 a1 ff 00 00    	imul   $0xffa1,%eax,%eax
  401609:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40160d:	8b 04 24             	mov    (%rsp),%eax
  401610:	69 c0 57 54 00 00    	imul   $0x5457,%eax,%eax
  401616:	89 04 24             	mov    %eax,(%rsp)
  401619:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40161d:	69 c0 36 e7 00 00    	imul   $0xe736,%eax,%eax
  401623:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401627:	8b 44 24 04          	mov    0x4(%rsp),%eax
  40162b:	69 c0 f0 51 00 00    	imul   $0x51f0,%eax,%eax
  401631:	89 44 24 04          	mov    %eax,0x4(%rsp)
  401635:	8b 44 24 14          	mov    0x14(%rsp),%eax
  401639:	69 c0 8e 73 00 00    	imul   $0x738e,%eax,%eax
  40163f:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401643:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401647:	69 c0 6a 28 00 00    	imul   $0x286a,%eax,%eax
  40164d:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401651:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401655:	69 c0 ba c9 00 00    	imul   $0xc9ba,%eax,%eax
  40165b:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40165f:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401663:	69 c0 dd 2d 00 00    	imul   $0x2ddd,%eax,%eax
  401669:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  40166d:	8b 44 24 04          	mov    0x4(%rsp),%eax
  401671:	69 c0 8c 5e 00 00    	imul   $0x5e8c,%eax,%eax
  401677:	89 44 24 04          	mov    %eax,0x4(%rsp)
  40167b:	8b 44 24 08          	mov    0x8(%rsp),%eax
  40167f:	69 c0 31 31 00 00    	imul   $0x3131,%eax,%eax
  401685:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401689:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40168d:	69 c0 19 49 00 00    	imul   $0x4919,%eax,%eax
  401693:	89 44 24 14          	mov    %eax,0x14(%rsp)
  401697:	8b 44 24 20          	mov    0x20(%rsp),%eax
  40169b:	69 c0 38 31 00 00    	imul   $0x3138,%eax,%eax
  4016a1:	89 44 24 20          	mov    %eax,0x20(%rsp)
  4016a5:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4016a9:	69 c0 3e a5 00 00    	imul   $0xa53e,%eax,%eax
  4016af:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4016b3:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4016b7:	69 c0 2a 89 00 00    	imul   $0x892a,%eax,%eax
  4016bd:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4016c1:	8b 44 24 24          	mov    0x24(%rsp),%eax
  4016c5:	69 c0 54 46 00 00    	imul   $0x4654,%eax,%eax
  4016cb:	89 44 24 24          	mov    %eax,0x24(%rsp)
  4016cf:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4016d3:	69 c0 11 c0 00 00    	imul   $0xc011,%eax,%eax
  4016d9:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4016dd:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  4016e1:	69 c0 c1 87 00 00    	imul   $0x87c1,%eax,%eax
  4016e7:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  4016eb:	8b 44 24 04          	mov    0x4(%rsp),%eax
  4016ef:	89 c2                	mov    %eax,%edx
  4016f1:	c1 e2 0c             	shl    $0xc,%edx
  4016f4:	8d 04 c2             	lea    (%rdx,%rax,8),%eax
  4016f7:	89 44 24 04          	mov    %eax,0x4(%rsp)
  4016fb:	8b 44 24 20          	mov    0x20(%rsp),%eax
  4016ff:	69 c0 dc 23 00 00    	imul   $0x23dc,%eax,%eax
  401705:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401709:	8b 04 24             	mov    (%rsp),%eax
  40170c:	69 c0 04 ab 00 00    	imul   $0xab04,%eax,%eax
  401712:	89 04 24             	mov    %eax,(%rsp)
  401715:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401719:	69 c0 b2 89 00 00    	imul   $0x89b2,%eax,%eax
  40171f:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401723:	8b 44 24 20          	mov    0x20(%rsp),%eax
  401727:	69 c0 44 56 00 00    	imul   $0x5644,%eax,%eax
  40172d:	89 44 24 20          	mov    %eax,0x20(%rsp)
  401731:	8b 44 24 18          	mov    0x18(%rsp),%eax
  401735:	69 c0 fb 2d 00 00    	imul   $0x2dfb,%eax,%eax
  40173b:	89 44 24 18          	mov    %eax,0x18(%rsp)
  40173f:	8b 44 24 24          	mov    0x24(%rsp),%eax
  401743:	69 c0 1f c3 00 00    	imul   $0xc31f,%eax,%eax
  401749:	89 44 24 24          	mov    %eax,0x24(%rsp)
  40174d:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401751:	69 c0 c7 99 00 00    	imul   $0x99c7,%eax,%eax
  401757:	89 44 24 08          	mov    %eax,0x8(%rsp)
  40175b:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40175f:	69 c0 09 a0 00 00    	imul   $0xa009,%eax,%eax
  401765:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401769:	8b 44 24 18          	mov    0x18(%rsp),%eax
  40176d:	69 c0 0d 92 00 00    	imul   $0x920d,%eax,%eax
  401773:	89 44 24 18          	mov    %eax,0x18(%rsp)
  401777:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  40177b:	69 c0 10 6c 00 00    	imul   $0x6c10,%eax,%eax
  401781:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  401785:	8b 44 24 08          	mov    0x8(%rsp),%eax
  401789:	69 c0 1a 66 00 00    	imul   $0x661a,%eax,%eax
  40178f:	89 44 24 08          	mov    %eax,0x8(%rsp)
  401793:	8b 04 24             	mov    (%rsp),%eax
  401796:	69 c0 26 20 00 00    	imul   $0x2026,%eax,%eax
  40179c:	89 04 24             	mov    %eax,(%rsp)
  40179f:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4017a3:	69 c0 1d f9 00 00    	imul   $0xf91d,%eax,%eax
  4017a9:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4017ad:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4017b1:	69 c0 64 f2 00 00    	imul   $0xf264,%eax,%eax
  4017b7:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4017bb:	8b 04 24             	mov    (%rsp),%eax
  4017be:	69 c0 a0 f4 00 00    	imul   $0xf4a0,%eax,%eax
  4017c4:	89 04 24             	mov    %eax,(%rsp)
  4017c7:	8b 44 24 08          	mov    0x8(%rsp),%eax
  4017cb:	69 c0 d5 ef 00 00    	imul   $0xefd5,%eax,%eax
  4017d1:	89 44 24 08          	mov    %eax,0x8(%rsp)
  4017d5:	8b 04 24             	mov    (%rsp),%eax
  4017d8:	69 c0 64 64 00 00    	imul   $0x6464,%eax,%eax
  4017de:	89 04 24             	mov    %eax,(%rsp)
  4017e1:	8b 44 24 18          	mov    0x18(%rsp),%eax
  4017e5:	69 c0 e6 af 00 00    	imul   $0xafe6,%eax,%eax
  4017eb:	89 44 24 18          	mov    %eax,0x18(%rsp)
  4017ef:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
  4017f3:	69 c0 48 6e 00 00    	imul   $0x6e48,%eax,%eax
  4017f9:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
  4017fd:	ba 00 00 00 00       	mov    $0x0,%edx
  401802:	b8 00 00 00 00       	mov    $0x0,%eax
  401807:	eb 0a                	jmp    401813 <scramble+0x464>
  401809:	89 d1                	mov    %edx,%ecx
  40180b:	8b 0c 8c             	mov    (%rsp,%rcx,4),%ecx
  40180e:	01 c8                	add    %ecx,%eax
  401810:	83 c2 01             	add    $0x1,%edx
  401813:	83 fa 09             	cmp    $0x9,%edx
  401816:	76 f1                	jbe    401809 <scramble+0x45a>
  401818:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
  40181d:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  401824:	00 00 
  401826:	74 05                	je     40182d <scramble+0x47e>
  401828:	e8 e3 f4 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  40182d:	48 83 c4 38          	add    $0x38,%rsp
  401831:	c3                   	retq   

0000000000401832 <getbuf>:
  401832:	48 83 ec 18          	sub    $0x18,%rsp
  401836:	48 89 e7             	mov    %rsp,%rdi
  401839:	e8 a9 03 00 00       	callq  401be7 <Gets>
  40183e:	b8 01 00 00 00       	mov    $0x1,%eax
  401843:	48 83 c4 18          	add    $0x18,%rsp
  401847:	c3                   	retq   

0000000000401848 <touch1>:
  401848:	48 83 ec 08          	sub    $0x8,%rsp
  40184c:	c7 05 c6 3c 20 00 01 	movl   $0x1,0x203cc6(%rip)        # 60551c <vlevel>
  401853:	00 00 00 
  401856:	bf 56 33 40 00       	mov    $0x403356,%edi
  40185b:	e8 90 f4 ff ff       	callq  400cf0 <puts@plt>
  401860:	bf 01 00 00 00       	mov    $0x1,%edi
  401865:	e8 c2 05 00 00       	callq  401e2c <validate>
  40186a:	bf 00 00 00 00       	mov    $0x0,%edi
  40186f:	e8 fc f5 ff ff       	callq  400e70 <exit@plt>

0000000000401874 <touch2>:
  401874:	48 83 ec 08          	sub    $0x8,%rsp
  401878:	89 fa                	mov    %edi,%edx
  40187a:	c7 05 98 3c 20 00 02 	movl   $0x2,0x203c98(%rip)        # 60551c <vlevel>
  401881:	00 00 00 
  401884:	39 3d 9a 3c 20 00    	cmp    %edi,0x203c9a(%rip)        # 605524 <cookie>
  40188a:	75 20                	jne    4018ac <touch2+0x38>
  40188c:	be 78 33 40 00       	mov    $0x403378,%esi
  401891:	bf 01 00 00 00       	mov    $0x1,%edi
  401896:	b8 00 00 00 00       	mov    $0x0,%eax
  40189b:	e8 80 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  4018a0:	bf 02 00 00 00       	mov    $0x2,%edi
  4018a5:	e8 82 05 00 00       	callq  401e2c <validate>
  4018aa:	eb 1e                	jmp    4018ca <touch2+0x56>
  4018ac:	be a0 33 40 00       	mov    $0x4033a0,%esi
  4018b1:	bf 01 00 00 00       	mov    $0x1,%edi
  4018b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4018bb:	e8 60 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  4018c0:	bf 02 00 00 00       	mov    $0x2,%edi
  4018c5:	e8 24 06 00 00       	callq  401eee <fail>
  4018ca:	bf 00 00 00 00       	mov    $0x0,%edi
  4018cf:	e8 9c f5 ff ff       	callq  400e70 <exit@plt>

00000000004018d4 <hexmatch>:
  4018d4:	41 54                	push   %r12
  4018d6:	55                   	push   %rbp
  4018d7:	53                   	push   %rbx
  4018d8:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  4018dc:	89 fd                	mov    %edi,%ebp
  4018de:	48 89 f3             	mov    %rsi,%rbx
  4018e1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4018e8:	00 00 
  4018ea:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  4018ef:	31 c0                	xor    %eax,%eax
  4018f1:	e8 ea f4 ff ff       	callq  400de0 <random@plt>
  4018f6:	48 89 c1             	mov    %rax,%rcx
  4018f9:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401900:	0a d7 a3 
  401903:	48 f7 ea             	imul   %rdx
  401906:	48 01 ca             	add    %rcx,%rdx
  401909:	48 c1 fa 06          	sar    $0x6,%rdx
  40190d:	48 89 c8             	mov    %rcx,%rax
  401910:	48 c1 f8 3f          	sar    $0x3f,%rax
  401914:	48 29 c2             	sub    %rax,%rdx
  401917:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40191b:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  40191f:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  401926:	00 
  401927:	48 29 c1             	sub    %rax,%rcx
  40192a:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  40192e:	41 89 e8             	mov    %ebp,%r8d
  401931:	b9 73 33 40 00       	mov    $0x403373,%ecx
  401936:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40193d:	be 01 00 00 00       	mov    $0x1,%esi
  401942:	4c 89 e7             	mov    %r12,%rdi
  401945:	b8 00 00 00 00       	mov    $0x0,%eax
  40194a:	e8 51 f5 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  40194f:	ba 09 00 00 00       	mov    $0x9,%edx
  401954:	4c 89 e6             	mov    %r12,%rsi
  401957:	48 89 df             	mov    %rbx,%rdi
  40195a:	e8 71 f3 ff ff       	callq  400cd0 <strncmp@plt>
  40195f:	85 c0                	test   %eax,%eax
  401961:	0f 94 c0             	sete   %al
  401964:	48 8b 5c 24 78       	mov    0x78(%rsp),%rbx
  401969:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  401970:	00 00 
  401972:	74 05                	je     401979 <hexmatch+0xa5>
  401974:	e8 97 f3 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401979:	0f b6 c0             	movzbl %al,%eax
  40197c:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  401980:	5b                   	pop    %rbx
  401981:	5d                   	pop    %rbp
  401982:	41 5c                	pop    %r12
  401984:	c3                   	retq   

0000000000401985 <touch3>:
  401985:	53                   	push   %rbx
  401986:	48 89 fb             	mov    %rdi,%rbx
  401989:	c7 05 89 3b 20 00 03 	movl   $0x3,0x203b89(%rip)        # 60551c <vlevel>
  401990:	00 00 00 
  401993:	48 89 fe             	mov    %rdi,%rsi
  401996:	8b 3d 88 3b 20 00    	mov    0x203b88(%rip),%edi        # 605524 <cookie>
  40199c:	e8 33 ff ff ff       	callq  4018d4 <hexmatch>
  4019a1:	85 c0                	test   %eax,%eax
  4019a3:	74 23                	je     4019c8 <touch3+0x43>
  4019a5:	48 89 da             	mov    %rbx,%rdx
  4019a8:	be c8 33 40 00       	mov    $0x4033c8,%esi
  4019ad:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b7:	e8 64 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  4019bc:	bf 03 00 00 00       	mov    $0x3,%edi
  4019c1:	e8 66 04 00 00       	callq  401e2c <validate>
  4019c6:	eb 21                	jmp    4019e9 <touch3+0x64>
  4019c8:	48 89 da             	mov    %rbx,%rdx
  4019cb:	be f0 33 40 00       	mov    $0x4033f0,%esi
  4019d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4019da:	e8 41 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  4019df:	bf 03 00 00 00       	mov    $0x3,%edi
  4019e4:	e8 05 05 00 00       	callq  401eee <fail>
  4019e9:	bf 00 00 00 00       	mov    $0x0,%edi
  4019ee:	e8 7d f4 ff ff       	callq  400e70 <exit@plt>

00000000004019f3 <test>:
  4019f3:	48 83 ec 08          	sub    $0x8,%rsp
  4019f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4019fc:	e8 31 fe ff ff       	callq  401832 <getbuf>
  401a01:	89 c2                	mov    %eax,%edx
  401a03:	be 18 34 40 00       	mov    $0x403418,%esi
  401a08:	bf 01 00 00 00       	mov    $0x1,%edi
  401a0d:	b8 00 00 00 00       	mov    $0x0,%eax
  401a12:	e8 09 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401a17:	48 83 c4 08          	add    $0x8,%rsp
  401a1b:	c3                   	retq   

0000000000401a1c <start_farm>:
  401a1c:	b8 01 00 00 00       	mov    $0x1,%eax
  401a21:	c3                   	retq   

0000000000401a22 <addval_461>:
  401a22:	8d 87 81 25 58 c2    	lea    -0x3da7da7f(%rdi),%eax
  401a28:	c3                   	retq   

0000000000401a29 <addval_172>:
  401a29:	8d 87 58 90 90 90    	lea    -0x6f6f6fa8(%rdi),%eax
  401a2f:	c3                   	retq   

0000000000401a30 <setval_136>:
  401a30:	c7 07 48 89 c7 91    	movl   $0x91c78948,(%rdi)
  401a36:	c3                   	retq   

0000000000401a37 <setval_366>:
  401a37:	c7 07 48 89 c7 94    	movl   $0x94c78948,(%rdi)
  401a3d:	c3                   	retq   

0000000000401a3e <setval_180>:
  401a3e:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  401a44:	c3                   	retq   

0000000000401a45 <getval_125>:
  401a45:	b8 58 90 90 90       	mov    $0x90909058,%eax
  401a4a:	c3                   	retq   

0000000000401a4b <setval_494>:
  401a4b:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  401a51:	c3                   	retq   

0000000000401a52 <addval_357>:
  401a52:	8d 87 18 90 90 90    	lea    -0x6f6f6fe8(%rdi),%eax
  401a58:	c3                   	retq   

0000000000401a59 <mid_farm>:
  401a59:	b8 01 00 00 00       	mov    $0x1,%eax
  401a5e:	c3                   	retq   

0000000000401a5f <add_xy>:
  401a5f:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  401a63:	c3                   	retq   

0000000000401a64 <addval_213>:
  401a64:	8d 87 c9 d1 08 c9    	lea    -0x36f72e37(%rdi),%eax
  401a6a:	c3                   	retq   

0000000000401a6b <setval_110>:
  401a6b:	c7 07 89 d1 c4 d2    	movl   $0xd2c4d189,(%rdi)
  401a71:	c3                   	retq   

0000000000401a72 <addval_212>:
  401a72:	8d 87 8d c2 08 c0    	lea    -0x3ff73d73(%rdi),%eax
  401a78:	c3                   	retq   

0000000000401a79 <setval_289>:
  401a79:	c7 07 48 89 e0 94    	movl   $0x94e08948,(%rdi)
  401a7f:	c3                   	retq   

0000000000401a80 <setval_225>:
  401a80:	c7 07 89 ce 38 db    	movl   $0xdb38ce89,(%rdi)
  401a86:	c3                   	retq   

0000000000401a87 <addval_230>:
  401a87:	8d 87 4a 89 e0 c3    	lea    -0x3c1f76b6(%rdi),%eax
  401a8d:	c3                   	retq   

0000000000401a8e <addval_349>:
  401a8e:	8d 87 48 89 d1 c3    	lea    -0x3c2e76b8(%rdi),%eax
  401a94:	c3                   	retq   

0000000000401a95 <addval_211>:
  401a95:	8d 87 88 c2 38 db    	lea    -0x24c73d78(%rdi),%eax
  401a9b:	c3                   	retq   

0000000000401a9c <setval_403>:
  401a9c:	c7 07 83 89 ce c3    	movl   $0xc3ce8983,(%rdi)
  401aa2:	c3                   	retq   

0000000000401aa3 <addval_178>:
  401aa3:	8d 87 89 ce 92 c3    	lea    -0x3c6d3177(%rdi),%eax
  401aa9:	c3                   	retq   

0000000000401aaa <setval_177>:
  401aaa:	c7 07 09 d1 08 c9    	movl   $0xc908d109,(%rdi)
  401ab0:	c3                   	retq   

0000000000401ab1 <setval_457>:
  401ab1:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401ab7:	c3                   	retq   

0000000000401ab8 <setval_490>:
  401ab8:	c7 07 89 d1 84 c9    	movl   $0xc984d189,(%rdi)
  401abe:	c3                   	retq   

0000000000401abf <setval_294>:
  401abf:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  401ac5:	c3                   	retq   

0000000000401ac6 <setval_101>:
  401ac6:	c7 07 48 09 e0 c3    	movl   $0xc3e00948,(%rdi)
  401acc:	c3                   	retq   

0000000000401acd <setval_384>:
  401acd:	c7 07 81 ce 84 c0    	movl   $0xc084ce81,(%rdi)
  401ad3:	c3                   	retq   

0000000000401ad4 <setval_303>:
  401ad4:	c7 07 c9 ce 20 c9    	movl   $0xc920cec9,(%rdi)
  401ada:	c3                   	retq   

0000000000401adb <setval_398>:
  401adb:	c7 07 48 99 e0 c3    	movl   $0xc3e09948,(%rdi)
  401ae1:	c3                   	retq   

0000000000401ae2 <setval_479>:
  401ae2:	c7 07 c8 89 e0 c3    	movl   $0xc3e089c8,(%rdi)
  401ae8:	c3                   	retq   

0000000000401ae9 <setval_135>:
  401ae9:	c7 07 99 c2 84 c9    	movl   $0xc984c299,(%rdi)
  401aef:	c3                   	retq   

0000000000401af0 <addval_424>:
  401af0:	8d 87 89 ce 18 c0    	lea    -0x3fe73177(%rdi),%eax
  401af6:	c3                   	retq   

0000000000401af7 <setval_187>:
  401af7:	c7 07 89 ce 18 c9    	movl   $0xc918ce89,(%rdi)
  401afd:	c3                   	retq   

0000000000401afe <addval_309>:
  401afe:	8d 87 a9 c2 38 c0    	lea    -0x3fc73d57(%rdi),%eax
  401b04:	c3                   	retq   

0000000000401b05 <getval_421>:
  401b05:	b8 89 c2 90 90       	mov    $0x9090c289,%eax
  401b0a:	c3                   	retq   

0000000000401b0b <addval_242>:
  401b0b:	8d 87 89 d1 28 db    	lea    -0x24d72e77(%rdi),%eax
  401b11:	c3                   	retq   

0000000000401b12 <setval_333>:
  401b12:	c7 07 89 c2 92 c3    	movl   $0xc392c289,(%rdi)
  401b18:	c3                   	retq   

0000000000401b19 <getval_114>:
  401b19:	b8 13 89 c2 90       	mov    $0x90c28913,%eax
  401b1e:	c3                   	retq   

0000000000401b1f <addval_379>:
  401b1f:	8d 87 8b d1 20 c0    	lea    -0x3fdf2e75(%rdi),%eax
  401b25:	c3                   	retq   

0000000000401b26 <getval_173>:
  401b26:	b8 89 c2 90 c1       	mov    $0xc190c289,%eax
  401b2b:	c3                   	retq   

0000000000401b2c <addval_430>:
  401b2c:	8d 87 89 ce c2 05    	lea    0x5c2ce89(%rdi),%eax
  401b32:	c3                   	retq   

0000000000401b33 <setval_169>:
  401b33:	c7 07 48 89 e0 c1    	movl   $0xc1e08948,(%rdi)
  401b39:	c3                   	retq   

0000000000401b3a <setval_210>:
  401b3a:	c7 07 89 d1 91 c3    	movl   $0xc391d189,(%rdi)
  401b40:	c3                   	retq   

0000000000401b41 <end_farm>:
  401b41:	b8 01 00 00 00       	mov    $0x1,%eax
  401b46:	c3                   	retq   

0000000000401b47 <save_char>:
  401b47:	8b 05 f7 45 20 00    	mov    0x2045f7(%rip),%eax        # 606144 <gets_cnt>
  401b4d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401b52:	7f 49                	jg     401b9d <save_char+0x56>
  401b54:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401b57:	89 f9                	mov    %edi,%ecx
  401b59:	c0 e9 04             	shr    $0x4,%cl
  401b5c:	83 e1 0f             	and    $0xf,%ecx
  401b5f:	0f b6 b1 40 37 40 00 	movzbl 0x403740(%rcx),%esi
  401b66:	48 63 ca             	movslq %edx,%rcx
  401b69:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401b70:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401b73:	83 e7 0f             	and    $0xf,%edi
  401b76:	0f b6 b7 40 37 40 00 	movzbl 0x403740(%rdi),%esi
  401b7d:	48 63 c9             	movslq %ecx,%rcx
  401b80:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401b87:	83 c2 02             	add    $0x2,%edx
  401b8a:	48 63 d2             	movslq %edx,%rdx
  401b8d:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401b94:	83 c0 01             	add    $0x1,%eax
  401b97:	89 05 a7 45 20 00    	mov    %eax,0x2045a7(%rip)        # 606144 <gets_cnt>
  401b9d:	f3 c3                	repz retq 

0000000000401b9f <save_term>:
  401b9f:	8b 05 9f 45 20 00    	mov    0x20459f(%rip),%eax        # 606144 <gets_cnt>
  401ba5:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401ba8:	48 98                	cltq   
  401baa:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401bb1:	c3                   	retq   

0000000000401bb2 <check_fail>:
  401bb2:	48 83 ec 08          	sub    $0x8,%rsp
  401bb6:	0f be 15 8b 45 20 00 	movsbl 0x20458b(%rip),%edx        # 606148 <target_prefix>
  401bbd:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401bc3:	8b 0d 4f 39 20 00    	mov    0x20394f(%rip),%ecx        # 605518 <check_level>
  401bc9:	be 3b 34 40 00       	mov    $0x40343b,%esi
  401bce:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd3:	b8 00 00 00 00       	mov    $0x0,%eax
  401bd8:	e8 43 f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401bdd:	bf 01 00 00 00       	mov    $0x1,%edi
  401be2:	e8 89 f2 ff ff       	callq  400e70 <exit@plt>

0000000000401be7 <Gets>:
  401be7:	41 54                	push   %r12
  401be9:	55                   	push   %rbp
  401bea:	53                   	push   %rbx
  401beb:	49 89 fc             	mov    %rdi,%r12
  401bee:	c7 05 4c 45 20 00 00 	movl   $0x0,0x20454c(%rip)        # 606144 <gets_cnt>
  401bf5:	00 00 00 
  401bf8:	48 89 fb             	mov    %rdi,%rbx
  401bfb:	eb 11                	jmp    401c0e <Gets+0x27>
  401bfd:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401c01:	88 03                	mov    %al,(%rbx)
  401c03:	0f b6 f8             	movzbl %al,%edi
  401c06:	e8 3c ff ff ff       	callq  401b47 <save_char>
  401c0b:	48 89 eb             	mov    %rbp,%rbx
  401c0e:	48 8b 3d fb 38 20 00 	mov    0x2038fb(%rip),%rdi        # 605510 <infile>
  401c15:	e8 d6 f1 ff ff       	callq  400df0 <_IO_getc@plt>
  401c1a:	83 f8 ff             	cmp    $0xffffffff,%eax
  401c1d:	74 05                	je     401c24 <Gets+0x3d>
  401c1f:	83 f8 0a             	cmp    $0xa,%eax
  401c22:	75 d9                	jne    401bfd <Gets+0x16>
  401c24:	c6 03 00             	movb   $0x0,(%rbx)
  401c27:	b8 00 00 00 00       	mov    $0x0,%eax
  401c2c:	e8 6e ff ff ff       	callq  401b9f <save_term>
  401c31:	4c 89 e0             	mov    %r12,%rax
  401c34:	5b                   	pop    %rbx
  401c35:	5d                   	pop    %rbp
  401c36:	41 5c                	pop    %r12
  401c38:	c3                   	retq   

0000000000401c39 <notify_server>:
  401c39:	53                   	push   %rbx
  401c3a:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401c41:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401c48:	00 00 
  401c4a:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401c51:	00 
  401c52:	31 c0                	xor    %eax,%eax
  401c54:	83 3d cd 38 20 00 00 	cmpl   $0x0,0x2038cd(%rip)        # 605528 <is_checker>
  401c5b:	0f 85 aa 01 00 00    	jne    401e0b <notify_server+0x1d2>
  401c61:	89 fb                	mov    %edi,%ebx
  401c63:	8b 05 db 44 20 00    	mov    0x2044db(%rip),%eax        # 606144 <gets_cnt>
  401c69:	83 c0 64             	add    $0x64,%eax
  401c6c:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401c71:	7e 1e                	jle    401c91 <notify_server+0x58>
  401c73:	be 70 35 40 00       	mov    $0x403570,%esi
  401c78:	bf 01 00 00 00       	mov    $0x1,%edi
  401c7d:	b8 00 00 00 00       	mov    $0x0,%eax
  401c82:	e8 99 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c87:	bf 01 00 00 00       	mov    $0x1,%edi
  401c8c:	e8 df f1 ff ff       	callq  400e70 <exit@plt>
  401c91:	0f be 05 b0 44 20 00 	movsbl 0x2044b0(%rip),%eax        # 606148 <target_prefix>
  401c98:	83 3d 09 38 20 00 00 	cmpl   $0x0,0x203809(%rip)        # 6054a8 <notify>
  401c9f:	74 08                	je     401ca9 <notify_server+0x70>
  401ca1:	8b 15 79 38 20 00    	mov    0x203879(%rip),%edx        # 605520 <authkey>
  401ca7:	eb 05                	jmp    401cae <notify_server+0x75>
  401ca9:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401cae:	85 db                	test   %ebx,%ebx
  401cb0:	74 08                	je     401cba <notify_server+0x81>
  401cb2:	41 b9 51 34 40 00    	mov    $0x403451,%r9d
  401cb8:	eb 06                	jmp    401cc0 <notify_server+0x87>
  401cba:	41 b9 56 34 40 00    	mov    $0x403456,%r9d
  401cc0:	68 40 55 60 00       	pushq  $0x605540
  401cc5:	56                   	push   %rsi
  401cc6:	50                   	push   %rax
  401cc7:	52                   	push   %rdx
  401cc8:	44 8b 05 99 34 20 00 	mov    0x203499(%rip),%r8d        # 605168 <target_id>
  401ccf:	b9 5b 34 40 00       	mov    $0x40345b,%ecx
  401cd4:	ba 00 20 00 00       	mov    $0x2000,%edx
  401cd9:	be 01 00 00 00       	mov    $0x1,%esi
  401cde:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401ce3:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce8:	e8 b3 f1 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401ced:	48 83 c4 20          	add    $0x20,%rsp
  401cf1:	83 3d b0 37 20 00 00 	cmpl   $0x0,0x2037b0(%rip)        # 6054a8 <notify>
  401cf8:	0f 84 81 00 00 00    	je     401d7f <notify_server+0x146>
  401cfe:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401d05:	00 
  401d06:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401d0c:	48 89 e1             	mov    %rsp,%rcx
  401d0f:	48 8b 15 5a 34 20 00 	mov    0x20345a(%rip),%rdx        # 605170 <lab>
  401d16:	48 8b 35 5b 34 20 00 	mov    0x20345b(%rip),%rsi        # 605178 <course>
  401d1d:	48 8b 3d 3c 34 20 00 	mov    0x20343c(%rip),%rdi        # 605160 <user_id>
  401d24:	e8 0e 11 00 00       	callq  402e37 <driver_post>
  401d29:	85 c0                	test   %eax,%eax
  401d2b:	79 26                	jns    401d53 <notify_server+0x11a>
  401d2d:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401d34:	00 
  401d35:	be 77 34 40 00       	mov    $0x403477,%esi
  401d3a:	bf 01 00 00 00       	mov    $0x1,%edi
  401d3f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d44:	e8 d7 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d49:	bf 01 00 00 00       	mov    $0x1,%edi
  401d4e:	e8 1d f1 ff ff       	callq  400e70 <exit@plt>
  401d53:	85 db                	test   %ebx,%ebx
  401d55:	74 19                	je     401d70 <notify_server+0x137>
  401d57:	bf a0 35 40 00       	mov    $0x4035a0,%edi
  401d5c:	e8 8f ef ff ff       	callq  400cf0 <puts@plt>
  401d61:	bf 83 34 40 00       	mov    $0x403483,%edi
  401d66:	e8 85 ef ff ff       	callq  400cf0 <puts@plt>
  401d6b:	e9 9b 00 00 00       	jmpq   401e0b <notify_server+0x1d2>
  401d70:	bf 8d 34 40 00       	mov    $0x40348d,%edi
  401d75:	e8 76 ef ff ff       	callq  400cf0 <puts@plt>
  401d7a:	e9 8c 00 00 00       	jmpq   401e0b <notify_server+0x1d2>
  401d7f:	85 db                	test   %ebx,%ebx
  401d81:	74 07                	je     401d8a <notify_server+0x151>
  401d83:	ba 51 34 40 00       	mov    $0x403451,%edx
  401d88:	eb 05                	jmp    401d8f <notify_server+0x156>
  401d8a:	ba 56 34 40 00       	mov    $0x403456,%edx
  401d8f:	be d8 35 40 00       	mov    $0x4035d8,%esi
  401d94:	bf 01 00 00 00       	mov    $0x1,%edi
  401d99:	b8 00 00 00 00       	mov    $0x0,%eax
  401d9e:	e8 7d f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401da3:	48 8b 15 b6 33 20 00 	mov    0x2033b6(%rip),%rdx        # 605160 <user_id>
  401daa:	be 94 34 40 00       	mov    $0x403494,%esi
  401daf:	bf 01 00 00 00       	mov    $0x1,%edi
  401db4:	b8 00 00 00 00       	mov    $0x0,%eax
  401db9:	e8 62 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401dbe:	48 8b 15 b3 33 20 00 	mov    0x2033b3(%rip),%rdx        # 605178 <course>
  401dc5:	be a1 34 40 00       	mov    $0x4034a1,%esi
  401dca:	bf 01 00 00 00       	mov    $0x1,%edi
  401dcf:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd4:	e8 47 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401dd9:	48 8b 15 90 33 20 00 	mov    0x203390(%rip),%rdx        # 605170 <lab>
  401de0:	be ad 34 40 00       	mov    $0x4034ad,%esi
  401de5:	bf 01 00 00 00       	mov    $0x1,%edi
  401dea:	b8 00 00 00 00       	mov    $0x0,%eax
  401def:	e8 2c f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401df4:	48 89 e2             	mov    %rsp,%rdx
  401df7:	be b6 34 40 00       	mov    $0x4034b6,%esi
  401dfc:	bf 01 00 00 00       	mov    $0x1,%edi
  401e01:	b8 00 00 00 00       	mov    $0x0,%eax
  401e06:	e8 15 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401e0b:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401e12:	00 
  401e13:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401e1a:	00 00 
  401e1c:	74 05                	je     401e23 <notify_server+0x1ea>
  401e1e:	e8 ed ee ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401e23:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401e2a:	5b                   	pop    %rbx
  401e2b:	c3                   	retq   

0000000000401e2c <validate>:
  401e2c:	53                   	push   %rbx
  401e2d:	89 fb                	mov    %edi,%ebx
  401e2f:	83 3d f2 36 20 00 00 	cmpl   $0x0,0x2036f2(%rip)        # 605528 <is_checker>
  401e36:	74 6b                	je     401ea3 <validate+0x77>
  401e38:	39 3d de 36 20 00    	cmp    %edi,0x2036de(%rip)        # 60551c <vlevel>
  401e3e:	74 14                	je     401e54 <validate+0x28>
  401e40:	bf c2 34 40 00       	mov    $0x4034c2,%edi
  401e45:	e8 a6 ee ff ff       	callq  400cf0 <puts@plt>
  401e4a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e4f:	e8 5e fd ff ff       	callq  401bb2 <check_fail>
  401e54:	8b 15 be 36 20 00    	mov    0x2036be(%rip),%edx        # 605518 <check_level>
  401e5a:	39 d7                	cmp    %edx,%edi
  401e5c:	74 20                	je     401e7e <validate+0x52>
  401e5e:	89 f9                	mov    %edi,%ecx
  401e60:	be 00 36 40 00       	mov    $0x403600,%esi
  401e65:	bf 01 00 00 00       	mov    $0x1,%edi
  401e6a:	b8 00 00 00 00       	mov    $0x0,%eax
  401e6f:	e8 ac ef ff ff       	callq  400e20 <__printf_chk@plt>
  401e74:	b8 00 00 00 00       	mov    $0x0,%eax
  401e79:	e8 34 fd ff ff       	callq  401bb2 <check_fail>
  401e7e:	0f be 15 c3 42 20 00 	movsbl 0x2042c3(%rip),%edx        # 606148 <target_prefix>
  401e85:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401e8b:	89 f9                	mov    %edi,%ecx
  401e8d:	be e0 34 40 00       	mov    $0x4034e0,%esi
  401e92:	bf 01 00 00 00       	mov    $0x1,%edi
  401e97:	b8 00 00 00 00       	mov    $0x0,%eax
  401e9c:	e8 7f ef ff ff       	callq  400e20 <__printf_chk@plt>
  401ea1:	eb 49                	jmp    401eec <validate+0xc0>
  401ea3:	3b 3d 73 36 20 00    	cmp    0x203673(%rip),%edi        # 60551c <vlevel>
  401ea9:	74 18                	je     401ec3 <validate+0x97>
  401eab:	bf c2 34 40 00       	mov    $0x4034c2,%edi
  401eb0:	e8 3b ee ff ff       	callq  400cf0 <puts@plt>
  401eb5:	89 de                	mov    %ebx,%esi
  401eb7:	bf 00 00 00 00       	mov    $0x0,%edi
  401ebc:	e8 78 fd ff ff       	callq  401c39 <notify_server>
  401ec1:	eb 29                	jmp    401eec <validate+0xc0>
  401ec3:	0f be 0d 7e 42 20 00 	movsbl 0x20427e(%rip),%ecx        # 606148 <target_prefix>
  401eca:	89 fa                	mov    %edi,%edx
  401ecc:	be 28 36 40 00       	mov    $0x403628,%esi
  401ed1:	bf 01 00 00 00       	mov    $0x1,%edi
  401ed6:	b8 00 00 00 00       	mov    $0x0,%eax
  401edb:	e8 40 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401ee0:	89 de                	mov    %ebx,%esi
  401ee2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ee7:	e8 4d fd ff ff       	callq  401c39 <notify_server>
  401eec:	5b                   	pop    %rbx
  401eed:	c3                   	retq   

0000000000401eee <fail>:
  401eee:	48 83 ec 08          	sub    $0x8,%rsp
  401ef2:	83 3d 2f 36 20 00 00 	cmpl   $0x0,0x20362f(%rip)        # 605528 <is_checker>
  401ef9:	74 0a                	je     401f05 <fail+0x17>
  401efb:	b8 00 00 00 00       	mov    $0x0,%eax
  401f00:	e8 ad fc ff ff       	callq  401bb2 <check_fail>
  401f05:	89 fe                	mov    %edi,%esi
  401f07:	bf 00 00 00 00       	mov    $0x0,%edi
  401f0c:	e8 28 fd ff ff       	callq  401c39 <notify_server>
  401f11:	48 83 c4 08          	add    $0x8,%rsp
  401f15:	c3                   	retq   

0000000000401f16 <bushandler>:
  401f16:	48 83 ec 08          	sub    $0x8,%rsp
  401f1a:	83 3d 07 36 20 00 00 	cmpl   $0x0,0x203607(%rip)        # 605528 <is_checker>
  401f21:	74 14                	je     401f37 <bushandler+0x21>
  401f23:	bf f5 34 40 00       	mov    $0x4034f5,%edi
  401f28:	e8 c3 ed ff ff       	callq  400cf0 <puts@plt>
  401f2d:	b8 00 00 00 00       	mov    $0x0,%eax
  401f32:	e8 7b fc ff ff       	callq  401bb2 <check_fail>
  401f37:	bf 60 36 40 00       	mov    $0x403660,%edi
  401f3c:	e8 af ed ff ff       	callq  400cf0 <puts@plt>
  401f41:	bf ff 34 40 00       	mov    $0x4034ff,%edi
  401f46:	e8 a5 ed ff ff       	callq  400cf0 <puts@plt>
  401f4b:	be 00 00 00 00       	mov    $0x0,%esi
  401f50:	bf 00 00 00 00       	mov    $0x0,%edi
  401f55:	e8 df fc ff ff       	callq  401c39 <notify_server>
  401f5a:	bf 01 00 00 00       	mov    $0x1,%edi
  401f5f:	e8 0c ef ff ff       	callq  400e70 <exit@plt>

0000000000401f64 <seghandler>:
  401f64:	48 83 ec 08          	sub    $0x8,%rsp
  401f68:	83 3d b9 35 20 00 00 	cmpl   $0x0,0x2035b9(%rip)        # 605528 <is_checker>
  401f6f:	74 14                	je     401f85 <seghandler+0x21>
  401f71:	bf 15 35 40 00       	mov    $0x403515,%edi
  401f76:	e8 75 ed ff ff       	callq  400cf0 <puts@plt>
  401f7b:	b8 00 00 00 00       	mov    $0x0,%eax
  401f80:	e8 2d fc ff ff       	callq  401bb2 <check_fail>
  401f85:	bf 80 36 40 00       	mov    $0x403680,%edi
  401f8a:	e8 61 ed ff ff       	callq  400cf0 <puts@plt>
  401f8f:	bf ff 34 40 00       	mov    $0x4034ff,%edi
  401f94:	e8 57 ed ff ff       	callq  400cf0 <puts@plt>
  401f99:	be 00 00 00 00       	mov    $0x0,%esi
  401f9e:	bf 00 00 00 00       	mov    $0x0,%edi
  401fa3:	e8 91 fc ff ff       	callq  401c39 <notify_server>
  401fa8:	bf 01 00 00 00       	mov    $0x1,%edi
  401fad:	e8 be ee ff ff       	callq  400e70 <exit@plt>

0000000000401fb2 <illegalhandler>:
  401fb2:	48 83 ec 08          	sub    $0x8,%rsp
  401fb6:	83 3d 6b 35 20 00 00 	cmpl   $0x0,0x20356b(%rip)        # 605528 <is_checker>
  401fbd:	74 14                	je     401fd3 <illegalhandler+0x21>
  401fbf:	bf 28 35 40 00       	mov    $0x403528,%edi
  401fc4:	e8 27 ed ff ff       	callq  400cf0 <puts@plt>
  401fc9:	b8 00 00 00 00       	mov    $0x0,%eax
  401fce:	e8 df fb ff ff       	callq  401bb2 <check_fail>
  401fd3:	bf a8 36 40 00       	mov    $0x4036a8,%edi
  401fd8:	e8 13 ed ff ff       	callq  400cf0 <puts@plt>
  401fdd:	bf ff 34 40 00       	mov    $0x4034ff,%edi
  401fe2:	e8 09 ed ff ff       	callq  400cf0 <puts@plt>
  401fe7:	be 00 00 00 00       	mov    $0x0,%esi
  401fec:	bf 00 00 00 00       	mov    $0x0,%edi
  401ff1:	e8 43 fc ff ff       	callq  401c39 <notify_server>
  401ff6:	bf 01 00 00 00       	mov    $0x1,%edi
  401ffb:	e8 70 ee ff ff       	callq  400e70 <exit@plt>

0000000000402000 <sigalrmhandler>:
  402000:	48 83 ec 08          	sub    $0x8,%rsp
  402004:	83 3d 1d 35 20 00 00 	cmpl   $0x0,0x20351d(%rip)        # 605528 <is_checker>
  40200b:	74 14                	je     402021 <sigalrmhandler+0x21>
  40200d:	bf 3c 35 40 00       	mov    $0x40353c,%edi
  402012:	e8 d9 ec ff ff       	callq  400cf0 <puts@plt>
  402017:	b8 00 00 00 00       	mov    $0x0,%eax
  40201c:	e8 91 fb ff ff       	callq  401bb2 <check_fail>
  402021:	ba 05 00 00 00       	mov    $0x5,%edx
  402026:	be d8 36 40 00       	mov    $0x4036d8,%esi
  40202b:	bf 01 00 00 00       	mov    $0x1,%edi
  402030:	b8 00 00 00 00       	mov    $0x0,%eax
  402035:	e8 e6 ed ff ff       	callq  400e20 <__printf_chk@plt>
  40203a:	be 00 00 00 00       	mov    $0x0,%esi
  40203f:	bf 00 00 00 00       	mov    $0x0,%edi
  402044:	e8 f0 fb ff ff       	callq  401c39 <notify_server>
  402049:	bf 01 00 00 00       	mov    $0x1,%edi
  40204e:	e8 1d ee ff ff       	callq  400e70 <exit@plt>

0000000000402053 <launch>:
  402053:	55                   	push   %rbp
  402054:	48 89 e5             	mov    %rsp,%rbp
  402057:	48 83 ec 10          	sub    $0x10,%rsp
  40205b:	48 89 fa             	mov    %rdi,%rdx
  40205e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402065:	00 00 
  402067:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  40206b:	31 c0                	xor    %eax,%eax
  40206d:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  402071:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  402075:	48 29 c4             	sub    %rax,%rsp
  402078:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  40207d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  402081:	be f4 00 00 00       	mov    $0xf4,%esi
  402086:	e8 a5 ec ff ff       	callq  400d30 <memset@plt>
  40208b:	48 8b 05 2e 34 20 00 	mov    0x20342e(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  402092:	48 39 05 77 34 20 00 	cmp    %rax,0x203477(%rip)        # 605510 <infile>
  402099:	75 14                	jne    4020af <launch+0x5c>
  40209b:	be 44 35 40 00       	mov    $0x403544,%esi
  4020a0:	bf 01 00 00 00       	mov    $0x1,%edi
  4020a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4020aa:	e8 71 ed ff ff       	callq  400e20 <__printf_chk@plt>
  4020af:	c7 05 63 34 20 00 00 	movl   $0x0,0x203463(%rip)        # 60551c <vlevel>
  4020b6:	00 00 00 
  4020b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4020be:	e8 30 f9 ff ff       	callq  4019f3 <test>
  4020c3:	83 3d 5e 34 20 00 00 	cmpl   $0x0,0x20345e(%rip)        # 605528 <is_checker>
  4020ca:	74 14                	je     4020e0 <launch+0x8d>
  4020cc:	bf 51 35 40 00       	mov    $0x403551,%edi
  4020d1:	e8 1a ec ff ff       	callq  400cf0 <puts@plt>
  4020d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4020db:	e8 d2 fa ff ff       	callq  401bb2 <check_fail>
  4020e0:	bf 5c 35 40 00       	mov    $0x40355c,%edi
  4020e5:	e8 06 ec ff ff       	callq  400cf0 <puts@plt>
  4020ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  4020ee:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4020f5:	00 00 
  4020f7:	74 05                	je     4020fe <launch+0xab>
  4020f9:	e8 12 ec ff ff       	callq  400d10 <__stack_chk_fail@plt>
  4020fe:	c9                   	leaveq 
  4020ff:	c3                   	retq   

0000000000402100 <stable_launch>:
  402100:	53                   	push   %rbx
  402101:	48 89 3d 00 34 20 00 	mov    %rdi,0x203400(%rip)        # 605508 <global_offset>
  402108:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  40210e:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  402114:	b9 32 01 00 00       	mov    $0x132,%ecx
  402119:	ba 07 00 00 00       	mov    $0x7,%edx
  40211e:	be 00 00 10 00       	mov    $0x100000,%esi
  402123:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402128:	e8 f3 eb ff ff       	callq  400d20 <mmap@plt>
  40212d:	48 89 c3             	mov    %rax,%rbx
  402130:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  402136:	74 37                	je     40216f <stable_launch+0x6f>
  402138:	be 00 00 10 00       	mov    $0x100000,%esi
  40213d:	48 89 c7             	mov    %rax,%rdi
  402140:	e8 cb ec ff ff       	callq  400e10 <munmap@plt>
  402145:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40214a:	ba 10 37 40 00       	mov    $0x403710,%edx
  40214f:	be 01 00 00 00       	mov    $0x1,%esi
  402154:	48 8b 3d 85 33 20 00 	mov    0x203385(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  40215b:	b8 00 00 00 00       	mov    $0x0,%eax
  402160:	e8 2b ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  402165:	bf 01 00 00 00       	mov    $0x1,%edi
  40216a:	e8 01 ed ff ff       	callq  400e70 <exit@plt>
  40216f:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  402176:	48 89 15 d3 3f 20 00 	mov    %rdx,0x203fd3(%rip)        # 606150 <stack_top>
  40217d:	48 89 e0             	mov    %rsp,%rax
  402180:	48 89 d4             	mov    %rdx,%rsp
  402183:	48 89 c2             	mov    %rax,%rdx
  402186:	48 89 15 73 33 20 00 	mov    %rdx,0x203373(%rip)        # 605500 <global_save_stack>
  40218d:	48 8b 3d 74 33 20 00 	mov    0x203374(%rip),%rdi        # 605508 <global_offset>
  402194:	e8 ba fe ff ff       	callq  402053 <launch>
  402199:	48 8b 05 60 33 20 00 	mov    0x203360(%rip),%rax        # 605500 <global_save_stack>
  4021a0:	48 89 c4             	mov    %rax,%rsp
  4021a3:	be 00 00 10 00       	mov    $0x100000,%esi
  4021a8:	48 89 df             	mov    %rbx,%rdi
  4021ab:	e8 60 ec ff ff       	callq  400e10 <munmap@plt>
  4021b0:	5b                   	pop    %rbx
  4021b1:	c3                   	retq   

00000000004021b2 <rio_readinitb>:
  4021b2:	89 37                	mov    %esi,(%rdi)
  4021b4:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4021bb:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4021bf:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4021c3:	c3                   	retq   

00000000004021c4 <sigalrm_handler>:
  4021c4:	48 83 ec 08          	sub    $0x8,%rsp
  4021c8:	b9 00 00 00 00       	mov    $0x0,%ecx
  4021cd:	ba 50 37 40 00       	mov    $0x403750,%edx
  4021d2:	be 01 00 00 00       	mov    $0x1,%esi
  4021d7:	48 8b 3d 02 33 20 00 	mov    0x203302(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4021de:	b8 00 00 00 00       	mov    $0x0,%eax
  4021e3:	e8 a8 ec ff ff       	callq  400e90 <__fprintf_chk@plt>
  4021e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4021ed:	e8 7e ec ff ff       	callq  400e70 <exit@plt>

00000000004021f2 <rio_writen>:
  4021f2:	41 55                	push   %r13
  4021f4:	41 54                	push   %r12
  4021f6:	55                   	push   %rbp
  4021f7:	53                   	push   %rbx
  4021f8:	48 83 ec 08          	sub    $0x8,%rsp
  4021fc:	41 89 fc             	mov    %edi,%r12d
  4021ff:	48 89 f5             	mov    %rsi,%rbp
  402202:	49 89 d5             	mov    %rdx,%r13
  402205:	48 89 d3             	mov    %rdx,%rbx
  402208:	eb 28                	jmp    402232 <rio_writen+0x40>
  40220a:	48 89 da             	mov    %rbx,%rdx
  40220d:	48 89 ee             	mov    %rbp,%rsi
  402210:	44 89 e7             	mov    %r12d,%edi
  402213:	e8 e8 ea ff ff       	callq  400d00 <write@plt>
  402218:	48 85 c0             	test   %rax,%rax
  40221b:	7f 0f                	jg     40222c <rio_writen+0x3a>
  40221d:	e8 8e ea ff ff       	callq  400cb0 <__errno_location@plt>
  402222:	83 38 04             	cmpl   $0x4,(%rax)
  402225:	75 15                	jne    40223c <rio_writen+0x4a>
  402227:	b8 00 00 00 00       	mov    $0x0,%eax
  40222c:	48 29 c3             	sub    %rax,%rbx
  40222f:	48 01 c5             	add    %rax,%rbp
  402232:	48 85 db             	test   %rbx,%rbx
  402235:	75 d3                	jne    40220a <rio_writen+0x18>
  402237:	4c 89 e8             	mov    %r13,%rax
  40223a:	eb 07                	jmp    402243 <rio_writen+0x51>
  40223c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402243:	48 83 c4 08          	add    $0x8,%rsp
  402247:	5b                   	pop    %rbx
  402248:	5d                   	pop    %rbp
  402249:	41 5c                	pop    %r12
  40224b:	41 5d                	pop    %r13
  40224d:	c3                   	retq   

000000000040224e <rio_read>:
  40224e:	41 55                	push   %r13
  402250:	41 54                	push   %r12
  402252:	55                   	push   %rbp
  402253:	53                   	push   %rbx
  402254:	48 83 ec 08          	sub    $0x8,%rsp
  402258:	48 89 fb             	mov    %rdi,%rbx
  40225b:	49 89 f5             	mov    %rsi,%r13
  40225e:	49 89 d4             	mov    %rdx,%r12
  402261:	eb 2e                	jmp    402291 <rio_read+0x43>
  402263:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  402267:	8b 3b                	mov    (%rbx),%edi
  402269:	ba 00 20 00 00       	mov    $0x2000,%edx
  40226e:	48 89 ee             	mov    %rbp,%rsi
  402271:	e8 ea ea ff ff       	callq  400d60 <read@plt>
  402276:	89 43 04             	mov    %eax,0x4(%rbx)
  402279:	85 c0                	test   %eax,%eax
  40227b:	79 0c                	jns    402289 <rio_read+0x3b>
  40227d:	e8 2e ea ff ff       	callq  400cb0 <__errno_location@plt>
  402282:	83 38 04             	cmpl   $0x4,(%rax)
  402285:	74 0a                	je     402291 <rio_read+0x43>
  402287:	eb 37                	jmp    4022c0 <rio_read+0x72>
  402289:	85 c0                	test   %eax,%eax
  40228b:	74 3c                	je     4022c9 <rio_read+0x7b>
  40228d:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402291:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402294:	85 ed                	test   %ebp,%ebp
  402296:	7e cb                	jle    402263 <rio_read+0x15>
  402298:	89 e8                	mov    %ebp,%eax
  40229a:	49 39 c4             	cmp    %rax,%r12
  40229d:	77 03                	ja     4022a2 <rio_read+0x54>
  40229f:	44 89 e5             	mov    %r12d,%ebp
  4022a2:	4c 63 e5             	movslq %ebp,%r12
  4022a5:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4022a9:	4c 89 e2             	mov    %r12,%rdx
  4022ac:	4c 89 ef             	mov    %r13,%rdi
  4022af:	e8 0c eb ff ff       	callq  400dc0 <memcpy@plt>
  4022b4:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4022b8:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4022bb:	4c 89 e0             	mov    %r12,%rax
  4022be:	eb 0e                	jmp    4022ce <rio_read+0x80>
  4022c0:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4022c7:	eb 05                	jmp    4022ce <rio_read+0x80>
  4022c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4022ce:	48 83 c4 08          	add    $0x8,%rsp
  4022d2:	5b                   	pop    %rbx
  4022d3:	5d                   	pop    %rbp
  4022d4:	41 5c                	pop    %r12
  4022d6:	41 5d                	pop    %r13
  4022d8:	c3                   	retq   

00000000004022d9 <rio_readlineb>:
  4022d9:	41 55                	push   %r13
  4022db:	41 54                	push   %r12
  4022dd:	55                   	push   %rbp
  4022de:	53                   	push   %rbx
  4022df:	48 83 ec 18          	sub    $0x18,%rsp
  4022e3:	49 89 fd             	mov    %rdi,%r13
  4022e6:	48 89 f5             	mov    %rsi,%rbp
  4022e9:	49 89 d4             	mov    %rdx,%r12
  4022ec:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022f3:	00 00 
  4022f5:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4022fa:	31 c0                	xor    %eax,%eax
  4022fc:	bb 01 00 00 00       	mov    $0x1,%ebx
  402301:	eb 3f                	jmp    402342 <rio_readlineb+0x69>
  402303:	ba 01 00 00 00       	mov    $0x1,%edx
  402308:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  40230d:	4c 89 ef             	mov    %r13,%rdi
  402310:	e8 39 ff ff ff       	callq  40224e <rio_read>
  402315:	83 f8 01             	cmp    $0x1,%eax
  402318:	75 15                	jne    40232f <rio_readlineb+0x56>
  40231a:	48 8d 45 01          	lea    0x1(%rbp),%rax
  40231e:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  402323:	88 55 00             	mov    %dl,0x0(%rbp)
  402326:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  40232b:	75 0e                	jne    40233b <rio_readlineb+0x62>
  40232d:	eb 1a                	jmp    402349 <rio_readlineb+0x70>
  40232f:	85 c0                	test   %eax,%eax
  402331:	75 22                	jne    402355 <rio_readlineb+0x7c>
  402333:	48 83 fb 01          	cmp    $0x1,%rbx
  402337:	75 13                	jne    40234c <rio_readlineb+0x73>
  402339:	eb 23                	jmp    40235e <rio_readlineb+0x85>
  40233b:	48 83 c3 01          	add    $0x1,%rbx
  40233f:	48 89 c5             	mov    %rax,%rbp
  402342:	4c 39 e3             	cmp    %r12,%rbx
  402345:	72 bc                	jb     402303 <rio_readlineb+0x2a>
  402347:	eb 03                	jmp    40234c <rio_readlineb+0x73>
  402349:	48 89 c5             	mov    %rax,%rbp
  40234c:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402350:	48 89 d8             	mov    %rbx,%rax
  402353:	eb 0e                	jmp    402363 <rio_readlineb+0x8a>
  402355:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40235c:	eb 05                	jmp    402363 <rio_readlineb+0x8a>
  40235e:	b8 00 00 00 00       	mov    $0x0,%eax
  402363:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  402368:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40236f:	00 00 
  402371:	74 05                	je     402378 <rio_readlineb+0x9f>
  402373:	e8 98 e9 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402378:	48 83 c4 18          	add    $0x18,%rsp
  40237c:	5b                   	pop    %rbx
  40237d:	5d                   	pop    %rbp
  40237e:	41 5c                	pop    %r12
  402380:	41 5d                	pop    %r13
  402382:	c3                   	retq   

0000000000402383 <urlencode>:
  402383:	41 54                	push   %r12
  402385:	55                   	push   %rbp
  402386:	53                   	push   %rbx
  402387:	48 83 ec 10          	sub    $0x10,%rsp
  40238b:	48 89 fb             	mov    %rdi,%rbx
  40238e:	48 89 f5             	mov    %rsi,%rbp
  402391:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402398:	00 00 
  40239a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40239f:	31 c0                	xor    %eax,%eax
  4023a1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4023a8:	f2 ae                	repnz scas %es:(%rdi),%al
  4023aa:	48 f7 d1             	not    %rcx
  4023ad:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4023b0:	e9 aa 00 00 00       	jmpq   40245f <urlencode+0xdc>
  4023b5:	44 0f b6 03          	movzbl (%rbx),%r8d
  4023b9:	41 80 f8 2a          	cmp    $0x2a,%r8b
  4023bd:	0f 94 c2             	sete   %dl
  4023c0:	41 80 f8 2d          	cmp    $0x2d,%r8b
  4023c4:	0f 94 c0             	sete   %al
  4023c7:	08 c2                	or     %al,%dl
  4023c9:	75 24                	jne    4023ef <urlencode+0x6c>
  4023cb:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4023cf:	74 1e                	je     4023ef <urlencode+0x6c>
  4023d1:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4023d5:	74 18                	je     4023ef <urlencode+0x6c>
  4023d7:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4023db:	3c 09                	cmp    $0x9,%al
  4023dd:	76 10                	jbe    4023ef <urlencode+0x6c>
  4023df:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4023e3:	3c 19                	cmp    $0x19,%al
  4023e5:	76 08                	jbe    4023ef <urlencode+0x6c>
  4023e7:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4023eb:	3c 19                	cmp    $0x19,%al
  4023ed:	77 0a                	ja     4023f9 <urlencode+0x76>
  4023ef:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4023f3:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4023f7:	eb 5f                	jmp    402458 <urlencode+0xd5>
  4023f9:	41 80 f8 20          	cmp    $0x20,%r8b
  4023fd:	75 0a                	jne    402409 <urlencode+0x86>
  4023ff:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  402403:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402407:	eb 4f                	jmp    402458 <urlencode+0xd5>
  402409:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  40240d:	3c 5f                	cmp    $0x5f,%al
  40240f:	0f 96 c2             	setbe  %dl
  402412:	41 80 f8 09          	cmp    $0x9,%r8b
  402416:	0f 94 c0             	sete   %al
  402419:	08 c2                	or     %al,%dl
  40241b:	74 50                	je     40246d <urlencode+0xea>
  40241d:	45 0f b6 c0          	movzbl %r8b,%r8d
  402421:	b9 08 38 40 00       	mov    $0x403808,%ecx
  402426:	ba 08 00 00 00       	mov    $0x8,%edx
  40242b:	be 01 00 00 00       	mov    $0x1,%esi
  402430:	48 89 e7             	mov    %rsp,%rdi
  402433:	b8 00 00 00 00       	mov    $0x0,%eax
  402438:	e8 63 ea ff ff       	callq  400ea0 <__sprintf_chk@plt>
  40243d:	0f b6 04 24          	movzbl (%rsp),%eax
  402441:	88 45 00             	mov    %al,0x0(%rbp)
  402444:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  402449:	88 45 01             	mov    %al,0x1(%rbp)
  40244c:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402451:	88 45 02             	mov    %al,0x2(%rbp)
  402454:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  402458:	48 83 c3 01          	add    $0x1,%rbx
  40245c:	44 89 e0             	mov    %r12d,%eax
  40245f:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402463:	85 c0                	test   %eax,%eax
  402465:	0f 85 4a ff ff ff    	jne    4023b5 <urlencode+0x32>
  40246b:	eb 05                	jmp    402472 <urlencode+0xef>
  40246d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402472:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  402477:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  40247e:	00 00 
  402480:	74 05                	je     402487 <urlencode+0x104>
  402482:	e8 89 e8 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402487:	48 83 c4 10          	add    $0x10,%rsp
  40248b:	5b                   	pop    %rbx
  40248c:	5d                   	pop    %rbp
  40248d:	41 5c                	pop    %r12
  40248f:	c3                   	retq   

0000000000402490 <submitr>:
  402490:	41 57                	push   %r15
  402492:	41 56                	push   %r14
  402494:	41 55                	push   %r13
  402496:	41 54                	push   %r12
  402498:	55                   	push   %rbp
  402499:	53                   	push   %rbx
  40249a:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  4024a1:	49 89 fd             	mov    %rdi,%r13
  4024a4:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  4024a8:	48 89 14 24          	mov    %rdx,(%rsp)
  4024ac:	49 89 ce             	mov    %rcx,%r14
  4024af:	4d 89 c7             	mov    %r8,%r15
  4024b2:	4d 89 cc             	mov    %r9,%r12
  4024b5:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  4024bc:	00 
  4024bd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4024c4:	00 00 
  4024c6:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4024cd:	00 
  4024ce:	31 c0                	xor    %eax,%eax
  4024d0:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4024d7:	00 
  4024d8:	ba 00 00 00 00       	mov    $0x0,%edx
  4024dd:	be 01 00 00 00       	mov    $0x1,%esi
  4024e2:	bf 02 00 00 00       	mov    $0x2,%edi
  4024e7:	e8 c4 e9 ff ff       	callq  400eb0 <socket@plt>
  4024ec:	85 c0                	test   %eax,%eax
  4024ee:	79 4e                	jns    40253e <submitr+0xae>
  4024f0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4024f7:	3a 20 43 
  4024fa:	48 89 03             	mov    %rax,(%rbx)
  4024fd:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402504:	20 75 6e 
  402507:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40250b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402512:	74 6f 20 
  402515:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402519:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402520:	65 20 73 
  402523:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402527:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  40252e:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402534:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402539:	e9 b3 06 00 00       	jmpq   402bf1 <submitr+0x761>
  40253e:	89 c5                	mov    %eax,%ebp
  402540:	4c 89 ef             	mov    %r13,%rdi
  402543:	e8 48 e8 ff ff       	callq  400d90 <gethostbyname@plt>
  402548:	48 85 c0             	test   %rax,%rax
  40254b:	75 75                	jne    4025c2 <submitr+0x132>
  40254d:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402554:	3a 20 44 
  402557:	48 89 03             	mov    %rax,(%rbx)
  40255a:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402561:	20 75 6e 
  402564:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402568:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40256f:	74 6f 20 
  402572:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402576:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40257d:	76 65 20 
  402580:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402584:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  40258b:	61 62 20 
  40258e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402592:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402599:	72 20 61 
  40259c:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025a0:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  4025a7:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  4025ad:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  4025b1:	89 ef                	mov    %ebp,%edi
  4025b3:	e8 98 e7 ff ff       	callq  400d50 <close@plt>
  4025b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025bd:	e9 2f 06 00 00       	jmpq   402bf1 <submitr+0x761>
  4025c2:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  4025c9:	00 00 
  4025cb:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  4025d2:	00 00 
  4025d4:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4025db:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4025df:	48 8b 40 18          	mov    0x18(%rax),%rax
  4025e3:	48 8b 30             	mov    (%rax),%rsi
  4025e6:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4025eb:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4025f0:	e8 ab e7 ff ff       	callq  400da0 <__memmove_chk@plt>
  4025f5:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
  4025fa:	66 c1 c8 08          	ror    $0x8,%ax
  4025fe:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  402603:	ba 10 00 00 00       	mov    $0x10,%edx
  402608:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  40260d:	89 ef                	mov    %ebp,%edi
  40260f:	e8 6c e8 ff ff       	callq  400e80 <connect@plt>
  402614:	85 c0                	test   %eax,%eax
  402616:	79 67                	jns    40267f <submitr+0x1ef>
  402618:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40261f:	3a 20 55 
  402622:	48 89 03             	mov    %rax,(%rbx)
  402625:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  40262c:	20 74 6f 
  40262f:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402633:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40263a:	65 63 74 
  40263d:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402641:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402648:	68 65 20 
  40264b:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40264f:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  402656:	61 62 20 
  402659:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40265d:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  402664:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  40266a:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  40266e:	89 ef                	mov    %ebp,%edi
  402670:	e8 db e6 ff ff       	callq  400d50 <close@plt>
  402675:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40267a:	e9 72 05 00 00       	jmpq   402bf1 <submitr+0x761>
  40267f:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402686:	b8 00 00 00 00       	mov    $0x0,%eax
  40268b:	48 89 f1             	mov    %rsi,%rcx
  40268e:	4c 89 e7             	mov    %r12,%rdi
  402691:	f2 ae                	repnz scas %es:(%rdi),%al
  402693:	48 f7 d1             	not    %rcx
  402696:	48 89 ca             	mov    %rcx,%rdx
  402699:	48 89 f1             	mov    %rsi,%rcx
  40269c:	48 8b 3c 24          	mov    (%rsp),%rdi
  4026a0:	f2 ae                	repnz scas %es:(%rdi),%al
  4026a2:	48 f7 d1             	not    %rcx
  4026a5:	49 89 c8             	mov    %rcx,%r8
  4026a8:	48 89 f1             	mov    %rsi,%rcx
  4026ab:	4c 89 f7             	mov    %r14,%rdi
  4026ae:	f2 ae                	repnz scas %es:(%rdi),%al
  4026b0:	48 f7 d1             	not    %rcx
  4026b3:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  4026b8:	48 89 f1             	mov    %rsi,%rcx
  4026bb:	4c 89 ff             	mov    %r15,%rdi
  4026be:	f2 ae                	repnz scas %es:(%rdi),%al
  4026c0:	48 89 c8             	mov    %rcx,%rax
  4026c3:	48 f7 d0             	not    %rax
  4026c6:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4026cb:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4026d0:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4026d7:	00 
  4026d8:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4026de:	76 72                	jbe    402752 <submitr+0x2c2>
  4026e0:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4026e7:	3a 20 52 
  4026ea:	48 89 03             	mov    %rax,(%rbx)
  4026ed:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4026f4:	20 73 74 
  4026f7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026fb:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402702:	74 6f 6f 
  402705:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402709:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  402710:	65 2e 20 
  402713:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402717:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  40271e:	61 73 65 
  402721:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402725:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  40272c:	49 54 52 
  40272f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402733:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  40273a:	55 46 00 
  40273d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402741:	89 ef                	mov    %ebp,%edi
  402743:	e8 08 e6 ff ff       	callq  400d50 <close@plt>
  402748:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40274d:	e9 9f 04 00 00       	jmpq   402bf1 <submitr+0x761>
  402752:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  402759:	00 
  40275a:	b9 00 04 00 00       	mov    $0x400,%ecx
  40275f:	b8 00 00 00 00       	mov    $0x0,%eax
  402764:	48 89 f7             	mov    %rsi,%rdi
  402767:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40276a:	4c 89 e7             	mov    %r12,%rdi
  40276d:	e8 11 fc ff ff       	callq  402383 <urlencode>
  402772:	85 c0                	test   %eax,%eax
  402774:	0f 89 8a 00 00 00    	jns    402804 <submitr+0x374>
  40277a:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402781:	3a 20 52 
  402784:	48 89 03             	mov    %rax,(%rbx)
  402787:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40278e:	20 73 74 
  402791:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402795:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  40279c:	63 6f 6e 
  40279f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027a3:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4027aa:	20 61 6e 
  4027ad:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027b1:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4027b8:	67 61 6c 
  4027bb:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027bf:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4027c6:	6e 70 72 
  4027c9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027cd:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4027d4:	6c 65 20 
  4027d7:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027db:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4027e2:	63 74 65 
  4027e5:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4027e9:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4027ef:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4027f3:	89 ef                	mov    %ebp,%edi
  4027f5:	e8 56 e5 ff ff       	callq  400d50 <close@plt>
  4027fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027ff:	e9 ed 03 00 00       	jmpq   402bf1 <submitr+0x761>
  402804:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  40280b:	00 
  40280c:	48 83 ec 08          	sub    $0x8,%rsp
  402810:	41 55                	push   %r13
  402812:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
  402819:	00 
  40281a:	50                   	push   %rax
  40281b:	41 56                	push   %r14
  40281d:	4d 89 f9             	mov    %r15,%r9
  402820:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  402825:	b9 78 37 40 00       	mov    $0x403778,%ecx
  40282a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40282f:	be 01 00 00 00       	mov    $0x1,%esi
  402834:	4c 89 e7             	mov    %r12,%rdi
  402837:	b8 00 00 00 00       	mov    $0x0,%eax
  40283c:	e8 5f e6 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402841:	b8 00 00 00 00       	mov    $0x0,%eax
  402846:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40284d:	4c 89 e7             	mov    %r12,%rdi
  402850:	f2 ae                	repnz scas %es:(%rdi),%al
  402852:	48 f7 d1             	not    %rcx
  402855:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402859:	48 83 c4 20          	add    $0x20,%rsp
  40285d:	4c 89 e6             	mov    %r12,%rsi
  402860:	89 ef                	mov    %ebp,%edi
  402862:	e8 8b f9 ff ff       	callq  4021f2 <rio_writen>
  402867:	48 85 c0             	test   %rax,%rax
  40286a:	79 6b                	jns    4028d7 <submitr+0x447>
  40286c:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402873:	3a 20 43 
  402876:	48 89 03             	mov    %rax,(%rbx)
  402879:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402880:	20 75 6e 
  402883:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402887:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40288e:	74 6f 20 
  402891:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402895:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  40289c:	20 74 6f 
  40289f:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028a3:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  4028aa:	41 75 74 
  4028ad:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028b1:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  4028b8:	73 65 72 
  4028bb:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028bf:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  4028c6:	89 ef                	mov    %ebp,%edi
  4028c8:	e8 83 e4 ff ff       	callq  400d50 <close@plt>
  4028cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028d2:	e9 1a 03 00 00       	jmpq   402bf1 <submitr+0x761>
  4028d7:	89 ee                	mov    %ebp,%esi
  4028d9:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4028de:	e8 cf f8 ff ff       	callq  4021b2 <rio_readinitb>
  4028e3:	ba 00 20 00 00       	mov    $0x2000,%edx
  4028e8:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4028ef:	00 
  4028f0:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4028f5:	e8 df f9 ff ff       	callq  4022d9 <rio_readlineb>
  4028fa:	48 85 c0             	test   %rax,%rax
  4028fd:	7f 7f                	jg     40297e <submitr+0x4ee>
  4028ff:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402906:	3a 20 43 
  402909:	48 89 03             	mov    %rax,(%rbx)
  40290c:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402913:	20 75 6e 
  402916:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40291a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402921:	74 6f 20 
  402924:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402928:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  40292f:	66 69 72 
  402932:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402936:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  40293d:	61 64 65 
  402940:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402944:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  40294b:	6d 20 41 
  40294e:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402952:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  402959:	62 20 73 
  40295c:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402960:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  402967:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  40296d:	89 ef                	mov    %ebp,%edi
  40296f:	e8 dc e3 ff ff       	callq  400d50 <close@plt>
  402974:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402979:	e9 73 02 00 00       	jmpq   402bf1 <submitr+0x761>
  40297e:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  402985:	00 
  402986:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  40298b:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402992:	00 
  402993:	be 0f 38 40 00       	mov    $0x40380f,%esi
  402998:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  40299f:	00 
  4029a0:	b8 00 00 00 00       	mov    $0x0,%eax
  4029a5:	e8 56 e4 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  4029aa:	e9 92 00 00 00       	jmpq   402a41 <submitr+0x5b1>
  4029af:	ba 00 20 00 00       	mov    $0x2000,%edx
  4029b4:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4029bb:	00 
  4029bc:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4029c1:	e8 13 f9 ff ff       	callq  4022d9 <rio_readlineb>
  4029c6:	48 85 c0             	test   %rax,%rax
  4029c9:	7f 76                	jg     402a41 <submitr+0x5b1>
  4029cb:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4029d2:	3a 20 43 
  4029d5:	48 89 03             	mov    %rax,(%rbx)
  4029d8:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4029df:	20 75 6e 
  4029e2:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4029e6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029ed:	74 6f 20 
  4029f0:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4029f4:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4029fb:	68 65 61 
  4029fe:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402a02:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402a09:	66 72 6f 
  402a0c:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402a10:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  402a17:	6f 6c 61 
  402a1a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402a1e:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  402a25:	76 65 72 
  402a28:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402a2c:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  402a30:	89 ef                	mov    %ebp,%edi
  402a32:	e8 19 e3 ff ff       	callq  400d50 <close@plt>
  402a37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a3c:	e9 b0 01 00 00       	jmpq   402bf1 <submitr+0x761>
  402a41:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  402a48:	00 
  402a49:	b8 0d 00 00 00       	mov    $0xd,%eax
  402a4e:	29 d0                	sub    %edx,%eax
  402a50:	75 1b                	jne    402a6d <submitr+0x5dd>
  402a52:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  402a59:	00 
  402a5a:	b8 0a 00 00 00       	mov    $0xa,%eax
  402a5f:	29 d0                	sub    %edx,%eax
  402a61:	75 0a                	jne    402a6d <submitr+0x5dd>
  402a63:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  402a6a:	00 
  402a6b:	f7 d8                	neg    %eax
  402a6d:	85 c0                	test   %eax,%eax
  402a6f:	0f 85 3a ff ff ff    	jne    4029af <submitr+0x51f>
  402a75:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a7a:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a81:	00 
  402a82:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402a87:	e8 4d f8 ff ff       	callq  4022d9 <rio_readlineb>
  402a8c:	48 85 c0             	test   %rax,%rax
  402a8f:	0f 8f 80 00 00 00    	jg     402b15 <submitr+0x685>
  402a95:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a9c:	3a 20 43 
  402a9f:	48 89 03             	mov    %rax,(%rbx)
  402aa2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402aa9:	20 75 6e 
  402aac:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402ab0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402ab7:	74 6f 20 
  402aba:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402abe:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  402ac5:	73 74 61 
  402ac8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402acc:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402ad3:	65 73 73 
  402ad6:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402ada:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  402ae1:	72 6f 6d 
  402ae4:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402ae8:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  402aef:	6c 61 62 
  402af2:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402af6:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  402afd:	65 72 00 
  402b00:	48 89 43 38          	mov    %rax,0x38(%rbx)
  402b04:	89 ef                	mov    %ebp,%edi
  402b06:	e8 45 e2 ff ff       	callq  400d50 <close@plt>
  402b0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b10:	e9 dc 00 00 00       	jmpq   402bf1 <submitr+0x761>
  402b15:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  402b1a:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  402b21:	74 37                	je     402b5a <submitr+0x6ca>
  402b23:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  402b2a:	00 
  402b2b:	b9 d8 37 40 00       	mov    $0x4037d8,%ecx
  402b30:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402b37:	be 01 00 00 00       	mov    $0x1,%esi
  402b3c:	48 89 df             	mov    %rbx,%rdi
  402b3f:	b8 00 00 00 00       	mov    $0x0,%eax
  402b44:	e8 57 e3 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402b49:	89 ef                	mov    %ebp,%edi
  402b4b:	e8 00 e2 ff ff       	callq  400d50 <close@plt>
  402b50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b55:	e9 97 00 00 00       	jmpq   402bf1 <submitr+0x761>
  402b5a:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402b61:	00 
  402b62:	48 89 df             	mov    %rbx,%rdi
  402b65:	e8 76 e1 ff ff       	callq  400ce0 <strcpy@plt>
  402b6a:	89 ef                	mov    %ebp,%edi
  402b6c:	e8 df e1 ff ff       	callq  400d50 <close@plt>
  402b71:	0f b6 03             	movzbl (%rbx),%eax
  402b74:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402b79:	29 c2                	sub    %eax,%edx
  402b7b:	75 22                	jne    402b9f <submitr+0x70f>
  402b7d:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402b81:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402b86:	29 c8                	sub    %ecx,%eax
  402b88:	75 17                	jne    402ba1 <submitr+0x711>
  402b8a:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402b8e:	b8 0a 00 00 00       	mov    $0xa,%eax
  402b93:	29 c8                	sub    %ecx,%eax
  402b95:	75 0a                	jne    402ba1 <submitr+0x711>
  402b97:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402b9b:	f7 d8                	neg    %eax
  402b9d:	eb 02                	jmp    402ba1 <submitr+0x711>
  402b9f:	89 d0                	mov    %edx,%eax
  402ba1:	85 c0                	test   %eax,%eax
  402ba3:	74 40                	je     402be5 <submitr+0x755>
  402ba5:	bf 20 38 40 00       	mov    $0x403820,%edi
  402baa:	b9 05 00 00 00       	mov    $0x5,%ecx
  402baf:	48 89 de             	mov    %rbx,%rsi
  402bb2:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402bb4:	0f 97 c0             	seta   %al
  402bb7:	0f 92 c1             	setb   %cl
  402bba:	29 c8                	sub    %ecx,%eax
  402bbc:	0f be c0             	movsbl %al,%eax
  402bbf:	85 c0                	test   %eax,%eax
  402bc1:	74 2e                	je     402bf1 <submitr+0x761>
  402bc3:	85 d2                	test   %edx,%edx
  402bc5:	75 13                	jne    402bda <submitr+0x74a>
  402bc7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402bcb:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402bd0:	29 c2                	sub    %eax,%edx
  402bd2:	75 06                	jne    402bda <submitr+0x74a>
  402bd4:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402bd8:	f7 da                	neg    %edx
  402bda:	85 d2                	test   %edx,%edx
  402bdc:	75 0e                	jne    402bec <submitr+0x75c>
  402bde:	b8 00 00 00 00       	mov    $0x0,%eax
  402be3:	eb 0c                	jmp    402bf1 <submitr+0x761>
  402be5:	b8 00 00 00 00       	mov    $0x0,%eax
  402bea:	eb 05                	jmp    402bf1 <submitr+0x761>
  402bec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bf1:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402bf8:	00 
  402bf9:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402c00:	00 00 
  402c02:	74 05                	je     402c09 <submitr+0x779>
  402c04:	e8 07 e1 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402c09:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402c10:	5b                   	pop    %rbx
  402c11:	5d                   	pop    %rbp
  402c12:	41 5c                	pop    %r12
  402c14:	41 5d                	pop    %r13
  402c16:	41 5e                	pop    %r14
  402c18:	41 5f                	pop    %r15
  402c1a:	c3                   	retq   

0000000000402c1b <init_timeout>:
  402c1b:	85 ff                	test   %edi,%edi
  402c1d:	74 23                	je     402c42 <init_timeout+0x27>
  402c1f:	53                   	push   %rbx
  402c20:	89 fb                	mov    %edi,%ebx
  402c22:	85 ff                	test   %edi,%edi
  402c24:	79 05                	jns    402c2b <init_timeout+0x10>
  402c26:	bb 00 00 00 00       	mov    $0x0,%ebx
  402c2b:	be c4 21 40 00       	mov    $0x4021c4,%esi
  402c30:	bf 0e 00 00 00       	mov    $0xe,%edi
  402c35:	e8 46 e1 ff ff       	callq  400d80 <signal@plt>
  402c3a:	89 df                	mov    %ebx,%edi
  402c3c:	e8 ff e0 ff ff       	callq  400d40 <alarm@plt>
  402c41:	5b                   	pop    %rbx
  402c42:	f3 c3                	repz retq 

0000000000402c44 <init_driver>:
  402c44:	55                   	push   %rbp
  402c45:	53                   	push   %rbx
  402c46:	48 83 ec 28          	sub    $0x28,%rsp
  402c4a:	48 89 fd             	mov    %rdi,%rbp
  402c4d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402c54:	00 00 
  402c56:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402c5b:	31 c0                	xor    %eax,%eax
  402c5d:	be 01 00 00 00       	mov    $0x1,%esi
  402c62:	bf 0d 00 00 00       	mov    $0xd,%edi
  402c67:	e8 14 e1 ff ff       	callq  400d80 <signal@plt>
  402c6c:	be 01 00 00 00       	mov    $0x1,%esi
  402c71:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402c76:	e8 05 e1 ff ff       	callq  400d80 <signal@plt>
  402c7b:	be 01 00 00 00       	mov    $0x1,%esi
  402c80:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402c85:	e8 f6 e0 ff ff       	callq  400d80 <signal@plt>
  402c8a:	ba 00 00 00 00       	mov    $0x0,%edx
  402c8f:	be 01 00 00 00       	mov    $0x1,%esi
  402c94:	bf 02 00 00 00       	mov    $0x2,%edi
  402c99:	e8 12 e2 ff ff       	callq  400eb0 <socket@plt>
  402c9e:	85 c0                	test   %eax,%eax
  402ca0:	79 4f                	jns    402cf1 <init_driver+0xad>
  402ca2:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ca9:	3a 20 43 
  402cac:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cb0:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402cb7:	20 75 6e 
  402cba:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402cbe:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402cc5:	74 6f 20 
  402cc8:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ccc:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402cd3:	65 20 73 
  402cd6:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402cda:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ce1:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ce7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cec:	e9 2a 01 00 00       	jmpq   402e1b <init_driver+0x1d7>
  402cf1:	89 c3                	mov    %eax,%ebx
  402cf3:	bf 45 33 40 00       	mov    $0x403345,%edi
  402cf8:	e8 93 e0 ff ff       	callq  400d90 <gethostbyname@plt>
  402cfd:	48 85 c0             	test   %rax,%rax
  402d00:	75 68                	jne    402d6a <init_driver+0x126>
  402d02:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402d09:	3a 20 44 
  402d0c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d10:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402d17:	20 75 6e 
  402d1a:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402d1e:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d25:	74 6f 20 
  402d28:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d2c:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402d33:	76 65 20 
  402d36:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402d3a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402d41:	72 20 61 
  402d44:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402d48:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402d4f:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402d55:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402d59:	89 df                	mov    %ebx,%edi
  402d5b:	e8 f0 df ff ff       	callq  400d50 <close@plt>
  402d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d65:	e9 b1 00 00 00       	jmpq   402e1b <init_driver+0x1d7>
  402d6a:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402d71:	00 
  402d72:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402d79:	00 00 
  402d7b:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402d81:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402d85:	48 8b 40 18          	mov    0x18(%rax),%rax
  402d89:	48 8b 30             	mov    (%rax),%rsi
  402d8c:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402d91:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402d96:	e8 05 e0 ff ff       	callq  400da0 <__memmove_chk@plt>
  402d9b:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  402da2:	ba 10 00 00 00       	mov    $0x10,%edx
  402da7:	48 89 e6             	mov    %rsp,%rsi
  402daa:	89 df                	mov    %ebx,%edi
  402dac:	e8 cf e0 ff ff       	callq  400e80 <connect@plt>
  402db1:	85 c0                	test   %eax,%eax
  402db3:	79 50                	jns    402e05 <init_driver+0x1c1>
  402db5:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402dbc:	3a 20 55 
  402dbf:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402dc3:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402dca:	20 74 6f 
  402dcd:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402dd1:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402dd8:	65 63 74 
  402ddb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ddf:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402de6:	65 72 76 
  402de9:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ded:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402df3:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402df7:	89 df                	mov    %ebx,%edi
  402df9:	e8 52 df ff ff       	callq  400d50 <close@plt>
  402dfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e03:	eb 16                	jmp    402e1b <init_driver+0x1d7>
  402e05:	89 df                	mov    %ebx,%edi
  402e07:	e8 44 df ff ff       	callq  400d50 <close@plt>
  402e0c:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402e12:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402e16:	b8 00 00 00 00       	mov    $0x0,%eax
  402e1b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402e20:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402e27:	00 00 
  402e29:	74 05                	je     402e30 <init_driver+0x1ec>
  402e2b:	e8 e0 de ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402e30:	48 83 c4 28          	add    $0x28,%rsp
  402e34:	5b                   	pop    %rbx
  402e35:	5d                   	pop    %rbp
  402e36:	c3                   	retq   

0000000000402e37 <driver_post>:
  402e37:	53                   	push   %rbx
  402e38:	4c 89 cb             	mov    %r9,%rbx
  402e3b:	45 85 c0             	test   %r8d,%r8d
  402e3e:	74 27                	je     402e67 <driver_post+0x30>
  402e40:	48 89 ca             	mov    %rcx,%rdx
  402e43:	be 25 38 40 00       	mov    $0x403825,%esi
  402e48:	bf 01 00 00 00       	mov    $0x1,%edi
  402e4d:	b8 00 00 00 00       	mov    $0x0,%eax
  402e52:	e8 c9 df ff ff       	callq  400e20 <__printf_chk@plt>
  402e57:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402e5c:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402e60:	b8 00 00 00 00       	mov    $0x0,%eax
  402e65:	eb 3f                	jmp    402ea6 <driver_post+0x6f>
  402e67:	48 85 ff             	test   %rdi,%rdi
  402e6a:	74 2c                	je     402e98 <driver_post+0x61>
  402e6c:	80 3f 00             	cmpb   $0x0,(%rdi)
  402e6f:	74 27                	je     402e98 <driver_post+0x61>
  402e71:	48 83 ec 08          	sub    $0x8,%rsp
  402e75:	41 51                	push   %r9
  402e77:	49 89 c9             	mov    %rcx,%r9
  402e7a:	49 89 d0             	mov    %rdx,%r8
  402e7d:	48 89 f9             	mov    %rdi,%rcx
  402e80:	48 89 f2             	mov    %rsi,%rdx
  402e83:	be 50 00 00 00       	mov    $0x50,%esi
  402e88:	bf 45 33 40 00       	mov    $0x403345,%edi
  402e8d:	e8 fe f5 ff ff       	callq  402490 <submitr>
  402e92:	48 83 c4 10          	add    $0x10,%rsp
  402e96:	eb 0e                	jmp    402ea6 <driver_post+0x6f>
  402e98:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402e9d:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ea1:	b8 00 00 00 00       	mov    $0x0,%eax
  402ea6:	5b                   	pop    %rbx
  402ea7:	c3                   	retq   

0000000000402ea8 <check>:
  402ea8:	89 f8                	mov    %edi,%eax
  402eaa:	c1 e8 1c             	shr    $0x1c,%eax
  402ead:	85 c0                	test   %eax,%eax
  402eaf:	74 1d                	je     402ece <check+0x26>
  402eb1:	b9 00 00 00 00       	mov    $0x0,%ecx
  402eb6:	eb 0b                	jmp    402ec3 <check+0x1b>
  402eb8:	89 f8                	mov    %edi,%eax
  402eba:	d3 e8                	shr    %cl,%eax
  402ebc:	3c 0a                	cmp    $0xa,%al
  402ebe:	74 14                	je     402ed4 <check+0x2c>
  402ec0:	83 c1 08             	add    $0x8,%ecx
  402ec3:	83 f9 1f             	cmp    $0x1f,%ecx
  402ec6:	7e f0                	jle    402eb8 <check+0x10>
  402ec8:	b8 01 00 00 00       	mov    $0x1,%eax
  402ecd:	c3                   	retq   
  402ece:	b8 00 00 00 00       	mov    $0x0,%eax
  402ed3:	c3                   	retq   
  402ed4:	b8 00 00 00 00       	mov    $0x0,%eax
  402ed9:	c3                   	retq   

0000000000402eda <gencookie>:
  402eda:	53                   	push   %rbx
  402edb:	83 c7 01             	add    $0x1,%edi
  402ede:	e8 dd dd ff ff       	callq  400cc0 <srandom@plt>
  402ee3:	e8 f8 de ff ff       	callq  400de0 <random@plt>
  402ee8:	89 c3                	mov    %eax,%ebx
  402eea:	89 c7                	mov    %eax,%edi
  402eec:	e8 b7 ff ff ff       	callq  402ea8 <check>
  402ef1:	85 c0                	test   %eax,%eax
  402ef3:	74 ee                	je     402ee3 <gencookie+0x9>
  402ef5:	89 d8                	mov    %ebx,%eax
  402ef7:	5b                   	pop    %rbx
  402ef8:	c3                   	retq   
  402ef9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)