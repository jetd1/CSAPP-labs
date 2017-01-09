
ctarget：     文件格式 elf64-x86-64

Disassembly of section .text:

0000000000400ed0 <_start>:
  400ed0:	31 ed                	xor    %ebp,%ebp
  400ed2:	49 89 d1             	mov    %rdx,%r9
  400ed5:	5e                   	pop    %rsi
  400ed6:	48 89 e2             	mov    %rsp,%rdx
  400ed9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400edd:	50                   	push   %rax
  400ede:	54                   	push   %rsp
  400edf:	49 c7 c0 40 2e 40 00 	mov    $0x402e40,%r8
  400ee6:	48 c7 c1 d0 2d 40 00 	mov    $0x402dd0,%rcx
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
  400fd6:	be 58 2e 40 00       	mov    $0x402e58,%esi
  400fdb:	bf 01 00 00 00       	mov    $0x1,%edi
  400fe0:	b8 00 00 00 00       	mov    $0x0,%eax
  400fe5:	e8 36 fe ff ff       	callq  400e20 <__printf_chk@plt>
  400fea:	bf 90 2e 40 00       	mov    $0x402e90,%edi
  400fef:	e8 fc fc ff ff       	callq  400cf0 <puts@plt>
  400ff4:	bf 08 30 40 00       	mov    $0x403008,%edi
  400ff9:	e8 f2 fc ff ff       	callq  400cf0 <puts@plt>
  400ffe:	bf b8 2e 40 00       	mov    $0x402eb8,%edi
  401003:	e8 e8 fc ff ff       	callq  400cf0 <puts@plt>
  401008:	bf 22 30 40 00       	mov    $0x403022,%edi
  40100d:	e8 de fc ff ff       	callq  400cf0 <puts@plt>
  401012:	eb 32                	jmp    401046 <usage+0x80>
  401014:	be 3e 30 40 00       	mov    $0x40303e,%esi
  401019:	bf 01 00 00 00       	mov    $0x1,%edi
  40101e:	b8 00 00 00 00       	mov    $0x0,%eax
  401023:	e8 f8 fd ff ff       	callq  400e20 <__printf_chk@plt>
  401028:	bf e0 2e 40 00       	mov    $0x402ee0,%edi
  40102d:	e8 be fc ff ff       	callq  400cf0 <puts@plt>
  401032:	bf 08 2f 40 00       	mov    $0x402f08,%edi
  401037:	e8 b4 fc ff ff       	callq  400cf0 <puts@plt>
  40103c:	bf 5c 30 40 00       	mov    $0x40305c,%edi
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
  40107a:	e8 30 1d 00 00       	callq  402daf <gencookie>
  40107f:	89 05 9f 44 20 00    	mov    %eax,0x20449f(%rip)        # 605524 <cookie>
  401085:	89 c7                	mov    %eax,%edi
  401087:	e8 23 1d 00 00       	callq  402daf <gencookie>
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
  4010e4:	c6 05 5d 50 20 00 63 	movb   $0x63,0x20505d(%rip)        # 606148 <target_prefix>
  4010eb:	83 3d b6 43 20 00 00 	cmpl   $0x0,0x2043b6(%rip)        # 6054a8 <notify>
  4010f2:	0f 84 bb 00 00 00    	je     4011b3 <initialize_target+0x163>
  4010f8:	83 3d 29 44 20 00 00 	cmpl   $0x0,0x204429(%rip)        # 605528 <is_checker>
  4010ff:	0f 85 ae 00 00 00    	jne    4011b3 <initialize_target+0x163>
  401105:	be 00 01 00 00       	mov    $0x100,%esi
  40110a:	48 89 e7             	mov    %rsp,%rdi
  40110d:	e8 4e fd ff ff       	callq  400e60 <gethostname@plt>
  401112:	85 c0                	test   %eax,%eax
  401114:	74 25                	je     40113b <initialize_target+0xeb>
  401116:	bf 38 2f 40 00       	mov    $0x402f38,%edi
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
  401163:	be 70 2f 40 00       	mov    $0x402f70,%esi
  401168:	bf 01 00 00 00       	mov    $0x1,%edi
  40116d:	e8 ae fc ff ff       	callq  400e20 <__printf_chk@plt>
  401172:	bf 08 00 00 00       	mov    $0x8,%edi
  401177:	e8 f4 fc ff ff       	callq  400e70 <exit@plt>
  40117c:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401183:	00 
  401184:	e8 90 19 00 00       	callq  402b19 <init_driver>
  401189:	85 c0                	test   %eax,%eax
  40118b:	79 26                	jns    4011b3 <initialize_target+0x163>
  40118d:	48 8d 94 24 00 01 00 	lea    0x100(%rsp),%rdx
  401194:	00 
  401195:	be b0 2f 40 00       	mov    $0x402fb0,%esi
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
  4011e3:	be 39 1e 40 00       	mov    $0x401e39,%esi
  4011e8:	bf 0b 00 00 00       	mov    $0xb,%edi
  4011ed:	e8 8e fb ff ff       	callq  400d80 <signal@plt>
  4011f2:	be eb 1d 40 00       	mov    $0x401deb,%esi
  4011f7:	bf 07 00 00 00       	mov    $0x7,%edi
  4011fc:	e8 7f fb ff ff       	callq  400d80 <signal@plt>
  401201:	be 87 1e 40 00       	mov    $0x401e87,%esi
  401206:	bf 04 00 00 00       	mov    $0x4,%edi
  40120b:	e8 70 fb ff ff       	callq  400d80 <signal@plt>
  401210:	83 3d 11 43 20 00 00 	cmpl   $0x0,0x204311(%rip)        # 605528 <is_checker>
  401217:	74 20                	je     401239 <main+0x64>
  401219:	be d5 1e 40 00       	mov    $0x401ed5,%esi
  40121e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401223:	e8 58 fb ff ff       	callq  400d80 <signal@plt>
  401228:	bf 05 00 00 00       	mov    $0x5,%edi
  40122d:	e8 0e fb ff ff       	callq  400d40 <alarm@plt>
  401232:	bd 7a 30 40 00       	mov    $0x40307a,%ebp
  401237:	eb 05                	jmp    40123e <main+0x69>
  401239:	bd 75 30 40 00       	mov    $0x403075,%ebp
  40123e:	48 8b 05 7b 42 20 00 	mov    0x20427b(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401245:	48 89 05 c4 42 20 00 	mov    %rax,0x2042c4(%rip)        # 605510 <infile>
  40124c:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401252:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401258:	e9 c6 00 00 00       	jmpq   401323 <main+0x14e>
  40125d:	83 e8 61             	sub    $0x61,%eax
  401260:	3c 10                	cmp    $0x10,%al
  401262:	0f 87 9c 00 00 00    	ja     401304 <main+0x12f>
  401268:	0f b6 c0             	movzbl %al,%eax
  40126b:	ff 24 c5 c0 30 40 00 	jmpq   *0x4030c0(,%rax,8)
  401272:	48 8b 3b             	mov    (%rbx),%rdi
  401275:	e8 4c fd ff ff       	callq  400fc6 <usage>
  40127a:	be cd 33 40 00       	mov    $0x4033cd,%esi
  40127f:	48 8b 3d 42 42 20 00 	mov    0x204242(%rip),%rdi        # 6054c8 <optarg@@GLIBC_2.2.5>
  401286:	e8 a5 fb ff ff       	callq  400e30 <fopen@plt>
  40128b:	48 89 05 7e 42 20 00 	mov    %rax,0x20427e(%rip)        # 605510 <infile>
  401292:	48 85 c0             	test   %rax,%rax
  401295:	0f 85 88 00 00 00    	jne    401323 <main+0x14e>
  40129b:	48 8b 0d 26 42 20 00 	mov    0x204226(%rip),%rcx        # 6054c8 <optarg@@GLIBC_2.2.5>
  4012a2:	ba 82 30 40 00       	mov    $0x403082,%edx
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
  401307:	be 9f 30 40 00       	mov    $0x40309f,%esi
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
  40133b:	be 00 00 00 00       	mov    $0x0,%esi
  401340:	44 89 ef             	mov    %r13d,%edi
  401343:	e8 08 fd ff ff       	callq  401050 <initialize_target>
  401348:	83 3d d9 41 20 00 00 	cmpl   $0x0,0x2041d9(%rip)        # 605528 <is_checker>
  40134f:	74 2a                	je     40137b <main+0x1a6>
  401351:	44 3b 35 c8 41 20 00 	cmp    0x2041c8(%rip),%r14d        # 605520 <authkey>
  401358:	74 21                	je     40137b <main+0x1a6>
  40135a:	44 89 f2             	mov    %r14d,%edx
  40135d:	be d8 2f 40 00       	mov    $0x402fd8,%esi
  401362:	bf 01 00 00 00       	mov    $0x1,%edi
  401367:	b8 00 00 00 00       	mov    $0x0,%eax
  40136c:	e8 af fa ff ff       	callq  400e20 <__printf_chk@plt>
  401371:	b8 00 00 00 00       	mov    $0x0,%eax
  401376:	e8 0c 07 00 00       	callq  401a87 <check_fail>
  40137b:	8b 15 a3 41 20 00    	mov    0x2041a3(%rip),%edx        # 605524 <cookie>
  401381:	be b2 30 40 00       	mov    $0x4030b2,%esi
  401386:	bf 01 00 00 00       	mov    $0x1,%edi
  40138b:	b8 00 00 00 00       	mov    $0x0,%eax
  401390:	e8 8b fa ff ff       	callq  400e20 <__printf_chk@plt>
  401395:	48 8b 3d 04 41 20 00 	mov    0x204104(%rip),%rdi        # 6054a0 <buf_offset>
  40139c:	e8 34 0c 00 00       	callq  401fd5 <stable_launch>
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
  401839:	e8 7e 02 00 00       	callq  401abc <Gets>
  40183e:	b8 01 00 00 00       	mov    $0x1,%eax
  401843:	48 83 c4 18          	add    $0x18,%rsp
  401847:	c3                   	retq   

0000000000401848 <touch1>:
  401848:	48 83 ec 08          	sub    $0x8,%rsp
  40184c:	c7 05 c6 3c 20 00 01 	movl   $0x1,0x203cc6(%rip)        # 60551c <vlevel>
  401853:	00 00 00 
  401856:	bf 26 32 40 00       	mov    $0x403226,%edi
  40185b:	e8 90 f4 ff ff       	callq  400cf0 <puts@plt>
  401860:	bf 01 00 00 00       	mov    $0x1,%edi
  401865:	e8 97 04 00 00       	callq  401d01 <validate>
  40186a:	bf 00 00 00 00       	mov    $0x0,%edi
  40186f:	e8 fc f5 ff ff       	callq  400e70 <exit@plt>

0000000000401874 <touch2>:
  401874:	48 83 ec 08          	sub    $0x8,%rsp
  401878:	89 fa                	mov    %edi,%edx
  40187a:	c7 05 98 3c 20 00 02 	movl   $0x2,0x203c98(%rip)        # 60551c <vlevel>
  401881:	00 00 00 
  401884:	39 3d 9a 3c 20 00    	cmp    %edi,0x203c9a(%rip)        # 605524 <cookie>
  40188a:	75 20                	jne    4018ac <touch2+0x38>
  40188c:	be 48 32 40 00       	mov    $0x403248,%esi
  401891:	bf 01 00 00 00       	mov    $0x1,%edi
  401896:	b8 00 00 00 00       	mov    $0x0,%eax
  40189b:	e8 80 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  4018a0:	bf 02 00 00 00       	mov    $0x2,%edi
  4018a5:	e8 57 04 00 00       	callq  401d01 <validate>
  4018aa:	eb 1e                	jmp    4018ca <touch2+0x56>
  4018ac:	be 70 32 40 00       	mov    $0x403270,%esi
  4018b1:	bf 01 00 00 00       	mov    $0x1,%edi
  4018b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4018bb:	e8 60 f5 ff ff       	callq  400e20 <__printf_chk@plt>
  4018c0:	bf 02 00 00 00       	mov    $0x2,%edi
  4018c5:	e8 f9 04 00 00       	callq  401dc3 <fail>
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
  401931:	b9 43 32 40 00       	mov    $0x403243,%ecx
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
  4019a8:	be 98 32 40 00       	mov    $0x403298,%esi
  4019ad:	bf 01 00 00 00       	mov    $0x1,%edi
  4019b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b7:	e8 64 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  4019bc:	bf 03 00 00 00       	mov    $0x3,%edi
  4019c1:	e8 3b 03 00 00       	callq  401d01 <validate>
  4019c6:	eb 21                	jmp    4019e9 <touch3+0x64>
  4019c8:	48 89 da             	mov    %rbx,%rdx
  4019cb:	be c0 32 40 00       	mov    $0x4032c0,%esi
  4019d0:	bf 01 00 00 00       	mov    $0x1,%edi
  4019d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4019da:	e8 41 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  4019df:	bf 03 00 00 00       	mov    $0x3,%edi
  4019e4:	e8 da 03 00 00       	callq  401dc3 <fail>
  4019e9:	bf 00 00 00 00       	mov    $0x0,%edi
  4019ee:	e8 7d f4 ff ff       	callq  400e70 <exit@plt>

00000000004019f3 <test>:
  4019f3:	48 83 ec 08          	sub    $0x8,%rsp
  4019f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4019fc:	e8 31 fe ff ff       	callq  401832 <getbuf>
  401a01:	89 c2                	mov    %eax,%edx
  401a03:	be e8 32 40 00       	mov    $0x4032e8,%esi
  401a08:	bf 01 00 00 00       	mov    $0x1,%edi
  401a0d:	b8 00 00 00 00       	mov    $0x0,%eax
  401a12:	e8 09 f4 ff ff       	callq  400e20 <__printf_chk@plt>
  401a17:	48 83 c4 08          	add    $0x8,%rsp
  401a1b:	c3                   	retq   

0000000000401a1c <save_char>:
  401a1c:	8b 05 22 47 20 00    	mov    0x204722(%rip),%eax        # 606144 <gets_cnt>
  401a22:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401a27:	7f 49                	jg     401a72 <save_char+0x56>
  401a29:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401a2c:	89 f9                	mov    %edi,%ecx
  401a2e:	c0 e9 04             	shr    $0x4,%cl
  401a31:	83 e1 0f             	and    $0xf,%ecx
  401a34:	0f b6 b1 10 36 40 00 	movzbl 0x403610(%rcx),%esi
  401a3b:	48 63 ca             	movslq %edx,%rcx
  401a3e:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401a45:	8d 4a 01             	lea    0x1(%rdx),%ecx
  401a48:	83 e7 0f             	and    $0xf,%edi
  401a4b:	0f b6 b7 10 36 40 00 	movzbl 0x403610(%rdi),%esi
  401a52:	48 63 c9             	movslq %ecx,%rcx
  401a55:	40 88 b1 40 55 60 00 	mov    %sil,0x605540(%rcx)
  401a5c:	83 c2 02             	add    $0x2,%edx
  401a5f:	48 63 d2             	movslq %edx,%rdx
  401a62:	c6 82 40 55 60 00 20 	movb   $0x20,0x605540(%rdx)
  401a69:	83 c0 01             	add    $0x1,%eax
  401a6c:	89 05 d2 46 20 00    	mov    %eax,0x2046d2(%rip)        # 606144 <gets_cnt>
  401a72:	f3 c3                	repz retq 

0000000000401a74 <save_term>:
  401a74:	8b 05 ca 46 20 00    	mov    0x2046ca(%rip),%eax        # 606144 <gets_cnt>
  401a7a:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401a7d:	48 98                	cltq   
  401a7f:	c6 80 40 55 60 00 00 	movb   $0x0,0x605540(%rax)
  401a86:	c3                   	retq   

0000000000401a87 <check_fail>:
  401a87:	48 83 ec 08          	sub    $0x8,%rsp
  401a8b:	0f be 15 b6 46 20 00 	movsbl 0x2046b6(%rip),%edx        # 606148 <target_prefix>
  401a92:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401a98:	8b 0d 7a 3a 20 00    	mov    0x203a7a(%rip),%ecx        # 605518 <check_level>
  401a9e:	be 0b 33 40 00       	mov    $0x40330b,%esi
  401aa3:	bf 01 00 00 00       	mov    $0x1,%edi
  401aa8:	b8 00 00 00 00       	mov    $0x0,%eax
  401aad:	e8 6e f3 ff ff       	callq  400e20 <__printf_chk@plt>
  401ab2:	bf 01 00 00 00       	mov    $0x1,%edi
  401ab7:	e8 b4 f3 ff ff       	callq  400e70 <exit@plt>

0000000000401abc <Gets>:
  401abc:	41 54                	push   %r12
  401abe:	55                   	push   %rbp
  401abf:	53                   	push   %rbx
  401ac0:	49 89 fc             	mov    %rdi,%r12
  401ac3:	c7 05 77 46 20 00 00 	movl   $0x0,0x204677(%rip)        # 606144 <gets_cnt>
  401aca:	00 00 00 
  401acd:	48 89 fb             	mov    %rdi,%rbx
  401ad0:	eb 11                	jmp    401ae3 <Gets+0x27>
  401ad2:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401ad6:	88 03                	mov    %al,(%rbx)
  401ad8:	0f b6 f8             	movzbl %al,%edi
  401adb:	e8 3c ff ff ff       	callq  401a1c <save_char>
  401ae0:	48 89 eb             	mov    %rbp,%rbx
  401ae3:	48 8b 3d 26 3a 20 00 	mov    0x203a26(%rip),%rdi        # 605510 <infile>
  401aea:	e8 01 f3 ff ff       	callq  400df0 <_IO_getc@plt>
  401aef:	83 f8 ff             	cmp    $0xffffffff,%eax
  401af2:	74 05                	je     401af9 <Gets+0x3d>
  401af4:	83 f8 0a             	cmp    $0xa,%eax
  401af7:	75 d9                	jne    401ad2 <Gets+0x16>
  401af9:	c6 03 00             	movb   $0x0,(%rbx)
  401afc:	b8 00 00 00 00       	mov    $0x0,%eax
  401b01:	e8 6e ff ff ff       	callq  401a74 <save_term>
  401b06:	4c 89 e0             	mov    %r12,%rax
  401b09:	5b                   	pop    %rbx
  401b0a:	5d                   	pop    %rbp
  401b0b:	41 5c                	pop    %r12
  401b0d:	c3                   	retq   

0000000000401b0e <notify_server>:
  401b0e:	53                   	push   %rbx
  401b0f:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401b16:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401b1d:	00 00 
  401b1f:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401b26:	00 
  401b27:	31 c0                	xor    %eax,%eax
  401b29:	83 3d f8 39 20 00 00 	cmpl   $0x0,0x2039f8(%rip)        # 605528 <is_checker>
  401b30:	0f 85 aa 01 00 00    	jne    401ce0 <notify_server+0x1d2>
  401b36:	89 fb                	mov    %edi,%ebx
  401b38:	8b 05 06 46 20 00    	mov    0x204606(%rip),%eax        # 606144 <gets_cnt>
  401b3e:	83 c0 64             	add    $0x64,%eax
  401b41:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401b46:	7e 1e                	jle    401b66 <notify_server+0x58>
  401b48:	be 40 34 40 00       	mov    $0x403440,%esi
  401b4d:	bf 01 00 00 00       	mov    $0x1,%edi
  401b52:	b8 00 00 00 00       	mov    $0x0,%eax
  401b57:	e8 c4 f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401b5c:	bf 01 00 00 00       	mov    $0x1,%edi
  401b61:	e8 0a f3 ff ff       	callq  400e70 <exit@plt>
  401b66:	0f be 05 db 45 20 00 	movsbl 0x2045db(%rip),%eax        # 606148 <target_prefix>
  401b6d:	83 3d 34 39 20 00 00 	cmpl   $0x0,0x203934(%rip)        # 6054a8 <notify>
  401b74:	74 08                	je     401b7e <notify_server+0x70>
  401b76:	8b 15 a4 39 20 00    	mov    0x2039a4(%rip),%edx        # 605520 <authkey>
  401b7c:	eb 05                	jmp    401b83 <notify_server+0x75>
  401b7e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  401b83:	85 db                	test   %ebx,%ebx
  401b85:	74 08                	je     401b8f <notify_server+0x81>
  401b87:	41 b9 21 33 40 00    	mov    $0x403321,%r9d
  401b8d:	eb 06                	jmp    401b95 <notify_server+0x87>
  401b8f:	41 b9 26 33 40 00    	mov    $0x403326,%r9d
  401b95:	68 40 55 60 00       	pushq  $0x605540
  401b9a:	56                   	push   %rsi
  401b9b:	50                   	push   %rax
  401b9c:	52                   	push   %rdx
  401b9d:	44 8b 05 c4 35 20 00 	mov    0x2035c4(%rip),%r8d        # 605168 <target_id>
  401ba4:	b9 2b 33 40 00       	mov    $0x40332b,%ecx
  401ba9:	ba 00 20 00 00       	mov    $0x2000,%edx
  401bae:	be 01 00 00 00       	mov    $0x1,%esi
  401bb3:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  401bb8:	b8 00 00 00 00       	mov    $0x0,%eax
  401bbd:	e8 de f2 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  401bc2:	48 83 c4 20          	add    $0x20,%rsp
  401bc6:	83 3d db 38 20 00 00 	cmpl   $0x0,0x2038db(%rip)        # 6054a8 <notify>
  401bcd:	0f 84 81 00 00 00    	je     401c54 <notify_server+0x146>
  401bd3:	4c 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%r9
  401bda:	00 
  401bdb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401be1:	48 89 e1             	mov    %rsp,%rcx
  401be4:	48 8b 15 85 35 20 00 	mov    0x203585(%rip),%rdx        # 605170 <lab>
  401beb:	48 8b 35 86 35 20 00 	mov    0x203586(%rip),%rsi        # 605178 <course>
  401bf2:	48 8b 3d 67 35 20 00 	mov    0x203567(%rip),%rdi        # 605160 <user_id>
  401bf9:	e8 0e 11 00 00       	callq  402d0c <driver_post>
  401bfe:	85 c0                	test   %eax,%eax
  401c00:	79 26                	jns    401c28 <notify_server+0x11a>
  401c02:	48 8d 94 24 00 20 00 	lea    0x2000(%rsp),%rdx
  401c09:	00 
  401c0a:	be 47 33 40 00       	mov    $0x403347,%esi
  401c0f:	bf 01 00 00 00       	mov    $0x1,%edi
  401c14:	b8 00 00 00 00       	mov    $0x0,%eax
  401c19:	e8 02 f2 ff ff       	callq  400e20 <__printf_chk@plt>
  401c1e:	bf 01 00 00 00       	mov    $0x1,%edi
  401c23:	e8 48 f2 ff ff       	callq  400e70 <exit@plt>
  401c28:	85 db                	test   %ebx,%ebx
  401c2a:	74 19                	je     401c45 <notify_server+0x137>
  401c2c:	bf 70 34 40 00       	mov    $0x403470,%edi
  401c31:	e8 ba f0 ff ff       	callq  400cf0 <puts@plt>
  401c36:	bf 53 33 40 00       	mov    $0x403353,%edi
  401c3b:	e8 b0 f0 ff ff       	callq  400cf0 <puts@plt>
  401c40:	e9 9b 00 00 00       	jmpq   401ce0 <notify_server+0x1d2>
  401c45:	bf 5d 33 40 00       	mov    $0x40335d,%edi
  401c4a:	e8 a1 f0 ff ff       	callq  400cf0 <puts@plt>
  401c4f:	e9 8c 00 00 00       	jmpq   401ce0 <notify_server+0x1d2>
  401c54:	85 db                	test   %ebx,%ebx
  401c56:	74 07                	je     401c5f <notify_server+0x151>
  401c58:	ba 21 33 40 00       	mov    $0x403321,%edx
  401c5d:	eb 05                	jmp    401c64 <notify_server+0x156>
  401c5f:	ba 26 33 40 00       	mov    $0x403326,%edx
  401c64:	be a8 34 40 00       	mov    $0x4034a8,%esi
  401c69:	bf 01 00 00 00       	mov    $0x1,%edi
  401c6e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c73:	e8 a8 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c78:	48 8b 15 e1 34 20 00 	mov    0x2034e1(%rip),%rdx        # 605160 <user_id>
  401c7f:	be 64 33 40 00       	mov    $0x403364,%esi
  401c84:	bf 01 00 00 00       	mov    $0x1,%edi
  401c89:	b8 00 00 00 00       	mov    $0x0,%eax
  401c8e:	e8 8d f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401c93:	48 8b 15 de 34 20 00 	mov    0x2034de(%rip),%rdx        # 605178 <course>
  401c9a:	be 71 33 40 00       	mov    $0x403371,%esi
  401c9f:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca9:	e8 72 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401cae:	48 8b 15 bb 34 20 00 	mov    0x2034bb(%rip),%rdx        # 605170 <lab>
  401cb5:	be 7d 33 40 00       	mov    $0x40337d,%esi
  401cba:	bf 01 00 00 00       	mov    $0x1,%edi
  401cbf:	b8 00 00 00 00       	mov    $0x0,%eax
  401cc4:	e8 57 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401cc9:	48 89 e2             	mov    %rsp,%rdx
  401ccc:	be 86 33 40 00       	mov    $0x403386,%esi
  401cd1:	bf 01 00 00 00       	mov    $0x1,%edi
  401cd6:	b8 00 00 00 00       	mov    $0x0,%eax
  401cdb:	e8 40 f1 ff ff       	callq  400e20 <__printf_chk@plt>
  401ce0:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  401ce7:	00 
  401ce8:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401cef:	00 00 
  401cf1:	74 05                	je     401cf8 <notify_server+0x1ea>
  401cf3:	e8 18 f0 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401cf8:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401cff:	5b                   	pop    %rbx
  401d00:	c3                   	retq   

0000000000401d01 <validate>:
  401d01:	53                   	push   %rbx
  401d02:	89 fb                	mov    %edi,%ebx
  401d04:	83 3d 1d 38 20 00 00 	cmpl   $0x0,0x20381d(%rip)        # 605528 <is_checker>
  401d0b:	74 6b                	je     401d78 <validate+0x77>
  401d0d:	39 3d 09 38 20 00    	cmp    %edi,0x203809(%rip)        # 60551c <vlevel>
  401d13:	74 14                	je     401d29 <validate+0x28>
  401d15:	bf 92 33 40 00       	mov    $0x403392,%edi
  401d1a:	e8 d1 ef ff ff       	callq  400cf0 <puts@plt>
  401d1f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d24:	e8 5e fd ff ff       	callq  401a87 <check_fail>
  401d29:	8b 15 e9 37 20 00    	mov    0x2037e9(%rip),%edx        # 605518 <check_level>
  401d2f:	39 d7                	cmp    %edx,%edi
  401d31:	74 20                	je     401d53 <validate+0x52>
  401d33:	89 f9                	mov    %edi,%ecx
  401d35:	be d0 34 40 00       	mov    $0x4034d0,%esi
  401d3a:	bf 01 00 00 00       	mov    $0x1,%edi
  401d3f:	b8 00 00 00 00       	mov    $0x0,%eax
  401d44:	e8 d7 f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d49:	b8 00 00 00 00       	mov    $0x0,%eax
  401d4e:	e8 34 fd ff ff       	callq  401a87 <check_fail>
  401d53:	0f be 15 ee 43 20 00 	movsbl 0x2043ee(%rip),%edx        # 606148 <target_prefix>
  401d5a:	41 b8 40 55 60 00    	mov    $0x605540,%r8d
  401d60:	89 f9                	mov    %edi,%ecx
  401d62:	be b0 33 40 00       	mov    $0x4033b0,%esi
  401d67:	bf 01 00 00 00       	mov    $0x1,%edi
  401d6c:	b8 00 00 00 00       	mov    $0x0,%eax
  401d71:	e8 aa f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401d76:	eb 49                	jmp    401dc1 <validate+0xc0>
  401d78:	3b 3d 9e 37 20 00    	cmp    0x20379e(%rip),%edi        # 60551c <vlevel>
  401d7e:	74 18                	je     401d98 <validate+0x97>
  401d80:	bf 92 33 40 00       	mov    $0x403392,%edi
  401d85:	e8 66 ef ff ff       	callq  400cf0 <puts@plt>
  401d8a:	89 de                	mov    %ebx,%esi
  401d8c:	bf 00 00 00 00       	mov    $0x0,%edi
  401d91:	e8 78 fd ff ff       	callq  401b0e <notify_server>
  401d96:	eb 29                	jmp    401dc1 <validate+0xc0>
  401d98:	0f be 0d a9 43 20 00 	movsbl 0x2043a9(%rip),%ecx        # 606148 <target_prefix>
  401d9f:	89 fa                	mov    %edi,%edx
  401da1:	be f8 34 40 00       	mov    $0x4034f8,%esi
  401da6:	bf 01 00 00 00       	mov    $0x1,%edi
  401dab:	b8 00 00 00 00       	mov    $0x0,%eax
  401db0:	e8 6b f0 ff ff       	callq  400e20 <__printf_chk@plt>
  401db5:	89 de                	mov    %ebx,%esi
  401db7:	bf 01 00 00 00       	mov    $0x1,%edi
  401dbc:	e8 4d fd ff ff       	callq  401b0e <notify_server>
  401dc1:	5b                   	pop    %rbx
  401dc2:	c3                   	retq   

0000000000401dc3 <fail>:
  401dc3:	48 83 ec 08          	sub    $0x8,%rsp
  401dc7:	83 3d 5a 37 20 00 00 	cmpl   $0x0,0x20375a(%rip)        # 605528 <is_checker>
  401dce:	74 0a                	je     401dda <fail+0x17>
  401dd0:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd5:	e8 ad fc ff ff       	callq  401a87 <check_fail>
  401dda:	89 fe                	mov    %edi,%esi
  401ddc:	bf 00 00 00 00       	mov    $0x0,%edi
  401de1:	e8 28 fd ff ff       	callq  401b0e <notify_server>
  401de6:	48 83 c4 08          	add    $0x8,%rsp
  401dea:	c3                   	retq   

0000000000401deb <bushandler>:
  401deb:	48 83 ec 08          	sub    $0x8,%rsp
  401def:	83 3d 32 37 20 00 00 	cmpl   $0x0,0x203732(%rip)        # 605528 <is_checker>
  401df6:	74 14                	je     401e0c <bushandler+0x21>
  401df8:	bf c5 33 40 00       	mov    $0x4033c5,%edi
  401dfd:	e8 ee ee ff ff       	callq  400cf0 <puts@plt>
  401e02:	b8 00 00 00 00       	mov    $0x0,%eax
  401e07:	e8 7b fc ff ff       	callq  401a87 <check_fail>
  401e0c:	bf 30 35 40 00       	mov    $0x403530,%edi
  401e11:	e8 da ee ff ff       	callq  400cf0 <puts@plt>
  401e16:	bf cf 33 40 00       	mov    $0x4033cf,%edi
  401e1b:	e8 d0 ee ff ff       	callq  400cf0 <puts@plt>
  401e20:	be 00 00 00 00       	mov    $0x0,%esi
  401e25:	bf 00 00 00 00       	mov    $0x0,%edi
  401e2a:	e8 df fc ff ff       	callq  401b0e <notify_server>
  401e2f:	bf 01 00 00 00       	mov    $0x1,%edi
  401e34:	e8 37 f0 ff ff       	callq  400e70 <exit@plt>

0000000000401e39 <seghandler>:
  401e39:	48 83 ec 08          	sub    $0x8,%rsp
  401e3d:	83 3d e4 36 20 00 00 	cmpl   $0x0,0x2036e4(%rip)        # 605528 <is_checker>
  401e44:	74 14                	je     401e5a <seghandler+0x21>
  401e46:	bf e5 33 40 00       	mov    $0x4033e5,%edi
  401e4b:	e8 a0 ee ff ff       	callq  400cf0 <puts@plt>
  401e50:	b8 00 00 00 00       	mov    $0x0,%eax
  401e55:	e8 2d fc ff ff       	callq  401a87 <check_fail>
  401e5a:	bf 50 35 40 00       	mov    $0x403550,%edi
  401e5f:	e8 8c ee ff ff       	callq  400cf0 <puts@plt>
  401e64:	bf cf 33 40 00       	mov    $0x4033cf,%edi
  401e69:	e8 82 ee ff ff       	callq  400cf0 <puts@plt>
  401e6e:	be 00 00 00 00       	mov    $0x0,%esi
  401e73:	bf 00 00 00 00       	mov    $0x0,%edi
  401e78:	e8 91 fc ff ff       	callq  401b0e <notify_server>
  401e7d:	bf 01 00 00 00       	mov    $0x1,%edi
  401e82:	e8 e9 ef ff ff       	callq  400e70 <exit@plt>

0000000000401e87 <illegalhandler>:
  401e87:	48 83 ec 08          	sub    $0x8,%rsp
  401e8b:	83 3d 96 36 20 00 00 	cmpl   $0x0,0x203696(%rip)        # 605528 <is_checker>
  401e92:	74 14                	je     401ea8 <illegalhandler+0x21>
  401e94:	bf f8 33 40 00       	mov    $0x4033f8,%edi
  401e99:	e8 52 ee ff ff       	callq  400cf0 <puts@plt>
  401e9e:	b8 00 00 00 00       	mov    $0x0,%eax
  401ea3:	e8 df fb ff ff       	callq  401a87 <check_fail>
  401ea8:	bf 78 35 40 00       	mov    $0x403578,%edi
  401ead:	e8 3e ee ff ff       	callq  400cf0 <puts@plt>
  401eb2:	bf cf 33 40 00       	mov    $0x4033cf,%edi
  401eb7:	e8 34 ee ff ff       	callq  400cf0 <puts@plt>
  401ebc:	be 00 00 00 00       	mov    $0x0,%esi
  401ec1:	bf 00 00 00 00       	mov    $0x0,%edi
  401ec6:	e8 43 fc ff ff       	callq  401b0e <notify_server>
  401ecb:	bf 01 00 00 00       	mov    $0x1,%edi
  401ed0:	e8 9b ef ff ff       	callq  400e70 <exit@plt>

0000000000401ed5 <sigalrmhandler>:
  401ed5:	48 83 ec 08          	sub    $0x8,%rsp
  401ed9:	83 3d 48 36 20 00 00 	cmpl   $0x0,0x203648(%rip)        # 605528 <is_checker>
  401ee0:	74 14                	je     401ef6 <sigalrmhandler+0x21>
  401ee2:	bf 0c 34 40 00       	mov    $0x40340c,%edi
  401ee7:	e8 04 ee ff ff       	callq  400cf0 <puts@plt>
  401eec:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef1:	e8 91 fb ff ff       	callq  401a87 <check_fail>
  401ef6:	ba 05 00 00 00       	mov    $0x5,%edx
  401efb:	be a8 35 40 00       	mov    $0x4035a8,%esi
  401f00:	bf 01 00 00 00       	mov    $0x1,%edi
  401f05:	b8 00 00 00 00       	mov    $0x0,%eax
  401f0a:	e8 11 ef ff ff       	callq  400e20 <__printf_chk@plt>
  401f0f:	be 00 00 00 00       	mov    $0x0,%esi
  401f14:	bf 00 00 00 00       	mov    $0x0,%edi
  401f19:	e8 f0 fb ff ff       	callq  401b0e <notify_server>
  401f1e:	bf 01 00 00 00       	mov    $0x1,%edi
  401f23:	e8 48 ef ff ff       	callq  400e70 <exit@plt>

0000000000401f28 <launch>:
  401f28:	55                   	push   %rbp
  401f29:	48 89 e5             	mov    %rsp,%rbp
  401f2c:	48 83 ec 10          	sub    $0x10,%rsp
  401f30:	48 89 fa             	mov    %rdi,%rdx
  401f33:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401f3a:	00 00 
  401f3c:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  401f40:	31 c0                	xor    %eax,%eax
  401f42:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401f46:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401f4a:	48 29 c4             	sub    %rax,%rsp
  401f4d:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401f52:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401f56:	be f4 00 00 00       	mov    $0xf4,%esi
  401f5b:	e8 d0 ed ff ff       	callq  400d30 <memset@plt>
  401f60:	48 8b 05 59 35 20 00 	mov    0x203559(%rip),%rax        # 6054c0 <stdin@@GLIBC_2.2.5>
  401f67:	48 39 05 a2 35 20 00 	cmp    %rax,0x2035a2(%rip)        # 605510 <infile>
  401f6e:	75 14                	jne    401f84 <launch+0x5c>
  401f70:	be 14 34 40 00       	mov    $0x403414,%esi
  401f75:	bf 01 00 00 00       	mov    $0x1,%edi
  401f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7f:	e8 9c ee ff ff       	callq  400e20 <__printf_chk@plt>
  401f84:	c7 05 8e 35 20 00 00 	movl   $0x0,0x20358e(%rip)        # 60551c <vlevel>
  401f8b:	00 00 00 
  401f8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401f93:	e8 5b fa ff ff       	callq  4019f3 <test>
  401f98:	83 3d 89 35 20 00 00 	cmpl   $0x0,0x203589(%rip)        # 605528 <is_checker>
  401f9f:	74 14                	je     401fb5 <launch+0x8d>
  401fa1:	bf 21 34 40 00       	mov    $0x403421,%edi
  401fa6:	e8 45 ed ff ff       	callq  400cf0 <puts@plt>
  401fab:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb0:	e8 d2 fa ff ff       	callq  401a87 <check_fail>
  401fb5:	bf 2c 34 40 00       	mov    $0x40342c,%edi
  401fba:	e8 31 ed ff ff       	callq  400cf0 <puts@plt>
  401fbf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  401fc3:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401fca:	00 00 
  401fcc:	74 05                	je     401fd3 <launch+0xab>
  401fce:	e8 3d ed ff ff       	callq  400d10 <__stack_chk_fail@plt>
  401fd3:	c9                   	leaveq 
  401fd4:	c3                   	retq   

0000000000401fd5 <stable_launch>:
  401fd5:	53                   	push   %rbx
  401fd6:	48 89 3d 2b 35 20 00 	mov    %rdi,0x20352b(%rip)        # 605508 <global_offset>
  401fdd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401fe3:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401fe9:	b9 32 01 00 00       	mov    $0x132,%ecx
  401fee:	ba 07 00 00 00       	mov    $0x7,%edx
  401ff3:	be 00 00 10 00       	mov    $0x100000,%esi
  401ff8:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401ffd:	e8 1e ed ff ff       	callq  400d20 <mmap@plt>
  402002:	48 89 c3             	mov    %rax,%rbx
  402005:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  40200b:	74 37                	je     402044 <stable_launch+0x6f>
  40200d:	be 00 00 10 00       	mov    $0x100000,%esi
  402012:	48 89 c7             	mov    %rax,%rdi
  402015:	e8 f6 ed ff ff       	callq  400e10 <munmap@plt>
  40201a:	b9 00 60 58 55       	mov    $0x55586000,%ecx
  40201f:	ba e0 35 40 00       	mov    $0x4035e0,%edx
  402024:	be 01 00 00 00       	mov    $0x1,%esi
  402029:	48 8b 3d b0 34 20 00 	mov    0x2034b0(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  402030:	b8 00 00 00 00       	mov    $0x0,%eax
  402035:	e8 56 ee ff ff       	callq  400e90 <__fprintf_chk@plt>
  40203a:	bf 01 00 00 00       	mov    $0x1,%edi
  40203f:	e8 2c ee ff ff       	callq  400e70 <exit@plt>
  402044:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  40204b:	48 89 15 fe 40 20 00 	mov    %rdx,0x2040fe(%rip)        # 606150 <stack_top>
  402052:	48 89 e0             	mov    %rsp,%rax
  402055:	48 89 d4             	mov    %rdx,%rsp
  402058:	48 89 c2             	mov    %rax,%rdx
  40205b:	48 89 15 9e 34 20 00 	mov    %rdx,0x20349e(%rip)        # 605500 <global_save_stack>
  402062:	48 8b 3d 9f 34 20 00 	mov    0x20349f(%rip),%rdi        # 605508 <global_offset>
  402069:	e8 ba fe ff ff       	callq  401f28 <launch>
  40206e:	48 8b 05 8b 34 20 00 	mov    0x20348b(%rip),%rax        # 605500 <global_save_stack>
  402075:	48 89 c4             	mov    %rax,%rsp
  402078:	be 00 00 10 00       	mov    $0x100000,%esi
  40207d:	48 89 df             	mov    %rbx,%rdi
  402080:	e8 8b ed ff ff       	callq  400e10 <munmap@plt>
  402085:	5b                   	pop    %rbx
  402086:	c3                   	retq   

0000000000402087 <rio_readinitb>:
  402087:	89 37                	mov    %esi,(%rdi)
  402089:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  402090:	48 8d 47 10          	lea    0x10(%rdi),%rax
  402094:	48 89 47 08          	mov    %rax,0x8(%rdi)
  402098:	c3                   	retq   

0000000000402099 <sigalrm_handler>:
  402099:	48 83 ec 08          	sub    $0x8,%rsp
  40209d:	b9 00 00 00 00       	mov    $0x0,%ecx
  4020a2:	ba 20 36 40 00       	mov    $0x403620,%edx
  4020a7:	be 01 00 00 00       	mov    $0x1,%esi
  4020ac:	48 8b 3d 2d 34 20 00 	mov    0x20342d(%rip),%rdi        # 6054e0 <stderr@@GLIBC_2.2.5>
  4020b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4020b8:	e8 d3 ed ff ff       	callq  400e90 <__fprintf_chk@plt>
  4020bd:	bf 01 00 00 00       	mov    $0x1,%edi
  4020c2:	e8 a9 ed ff ff       	callq  400e70 <exit@plt>

00000000004020c7 <rio_writen>:
  4020c7:	41 55                	push   %r13
  4020c9:	41 54                	push   %r12
  4020cb:	55                   	push   %rbp
  4020cc:	53                   	push   %rbx
  4020cd:	48 83 ec 08          	sub    $0x8,%rsp
  4020d1:	41 89 fc             	mov    %edi,%r12d
  4020d4:	48 89 f5             	mov    %rsi,%rbp
  4020d7:	49 89 d5             	mov    %rdx,%r13
  4020da:	48 89 d3             	mov    %rdx,%rbx
  4020dd:	eb 28                	jmp    402107 <rio_writen+0x40>
  4020df:	48 89 da             	mov    %rbx,%rdx
  4020e2:	48 89 ee             	mov    %rbp,%rsi
  4020e5:	44 89 e7             	mov    %r12d,%edi
  4020e8:	e8 13 ec ff ff       	callq  400d00 <write@plt>
  4020ed:	48 85 c0             	test   %rax,%rax
  4020f0:	7f 0f                	jg     402101 <rio_writen+0x3a>
  4020f2:	e8 b9 eb ff ff       	callq  400cb0 <__errno_location@plt>
  4020f7:	83 38 04             	cmpl   $0x4,(%rax)
  4020fa:	75 15                	jne    402111 <rio_writen+0x4a>
  4020fc:	b8 00 00 00 00       	mov    $0x0,%eax
  402101:	48 29 c3             	sub    %rax,%rbx
  402104:	48 01 c5             	add    %rax,%rbp
  402107:	48 85 db             	test   %rbx,%rbx
  40210a:	75 d3                	jne    4020df <rio_writen+0x18>
  40210c:	4c 89 e8             	mov    %r13,%rax
  40210f:	eb 07                	jmp    402118 <rio_writen+0x51>
  402111:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402118:	48 83 c4 08          	add    $0x8,%rsp
  40211c:	5b                   	pop    %rbx
  40211d:	5d                   	pop    %rbp
  40211e:	41 5c                	pop    %r12
  402120:	41 5d                	pop    %r13
  402122:	c3                   	retq   

0000000000402123 <rio_read>:
  402123:	41 55                	push   %r13
  402125:	41 54                	push   %r12
  402127:	55                   	push   %rbp
  402128:	53                   	push   %rbx
  402129:	48 83 ec 08          	sub    $0x8,%rsp
  40212d:	48 89 fb             	mov    %rdi,%rbx
  402130:	49 89 f5             	mov    %rsi,%r13
  402133:	49 89 d4             	mov    %rdx,%r12
  402136:	eb 2e                	jmp    402166 <rio_read+0x43>
  402138:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40213c:	8b 3b                	mov    (%rbx),%edi
  40213e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402143:	48 89 ee             	mov    %rbp,%rsi
  402146:	e8 15 ec ff ff       	callq  400d60 <read@plt>
  40214b:	89 43 04             	mov    %eax,0x4(%rbx)
  40214e:	85 c0                	test   %eax,%eax
  402150:	79 0c                	jns    40215e <rio_read+0x3b>
  402152:	e8 59 eb ff ff       	callq  400cb0 <__errno_location@plt>
  402157:	83 38 04             	cmpl   $0x4,(%rax)
  40215a:	74 0a                	je     402166 <rio_read+0x43>
  40215c:	eb 37                	jmp    402195 <rio_read+0x72>
  40215e:	85 c0                	test   %eax,%eax
  402160:	74 3c                	je     40219e <rio_read+0x7b>
  402162:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402166:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402169:	85 ed                	test   %ebp,%ebp
  40216b:	7e cb                	jle    402138 <rio_read+0x15>
  40216d:	89 e8                	mov    %ebp,%eax
  40216f:	49 39 c4             	cmp    %rax,%r12
  402172:	77 03                	ja     402177 <rio_read+0x54>
  402174:	44 89 e5             	mov    %r12d,%ebp
  402177:	4c 63 e5             	movslq %ebp,%r12
  40217a:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40217e:	4c 89 e2             	mov    %r12,%rdx
  402181:	4c 89 ef             	mov    %r13,%rdi
  402184:	e8 37 ec ff ff       	callq  400dc0 <memcpy@plt>
  402189:	4c 01 63 08          	add    %r12,0x8(%rbx)
  40218d:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402190:	4c 89 e0             	mov    %r12,%rax
  402193:	eb 0e                	jmp    4021a3 <rio_read+0x80>
  402195:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40219c:	eb 05                	jmp    4021a3 <rio_read+0x80>
  40219e:	b8 00 00 00 00       	mov    $0x0,%eax
  4021a3:	48 83 c4 08          	add    $0x8,%rsp
  4021a7:	5b                   	pop    %rbx
  4021a8:	5d                   	pop    %rbp
  4021a9:	41 5c                	pop    %r12
  4021ab:	41 5d                	pop    %r13
  4021ad:	c3                   	retq   

00000000004021ae <rio_readlineb>:
  4021ae:	41 55                	push   %r13
  4021b0:	41 54                	push   %r12
  4021b2:	55                   	push   %rbp
  4021b3:	53                   	push   %rbx
  4021b4:	48 83 ec 18          	sub    $0x18,%rsp
  4021b8:	49 89 fd             	mov    %rdi,%r13
  4021bb:	48 89 f5             	mov    %rsi,%rbp
  4021be:	49 89 d4             	mov    %rdx,%r12
  4021c1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4021c8:	00 00 
  4021ca:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4021cf:	31 c0                	xor    %eax,%eax
  4021d1:	bb 01 00 00 00       	mov    $0x1,%ebx
  4021d6:	eb 3f                	jmp    402217 <rio_readlineb+0x69>
  4021d8:	ba 01 00 00 00       	mov    $0x1,%edx
  4021dd:	48 8d 74 24 07       	lea    0x7(%rsp),%rsi
  4021e2:	4c 89 ef             	mov    %r13,%rdi
  4021e5:	e8 39 ff ff ff       	callq  402123 <rio_read>
  4021ea:	83 f8 01             	cmp    $0x1,%eax
  4021ed:	75 15                	jne    402204 <rio_readlineb+0x56>
  4021ef:	48 8d 45 01          	lea    0x1(%rbp),%rax
  4021f3:	0f b6 54 24 07       	movzbl 0x7(%rsp),%edx
  4021f8:	88 55 00             	mov    %dl,0x0(%rbp)
  4021fb:	80 7c 24 07 0a       	cmpb   $0xa,0x7(%rsp)
  402200:	75 0e                	jne    402210 <rio_readlineb+0x62>
  402202:	eb 1a                	jmp    40221e <rio_readlineb+0x70>
  402204:	85 c0                	test   %eax,%eax
  402206:	75 22                	jne    40222a <rio_readlineb+0x7c>
  402208:	48 83 fb 01          	cmp    $0x1,%rbx
  40220c:	75 13                	jne    402221 <rio_readlineb+0x73>
  40220e:	eb 23                	jmp    402233 <rio_readlineb+0x85>
  402210:	48 83 c3 01          	add    $0x1,%rbx
  402214:	48 89 c5             	mov    %rax,%rbp
  402217:	4c 39 e3             	cmp    %r12,%rbx
  40221a:	72 bc                	jb     4021d8 <rio_readlineb+0x2a>
  40221c:	eb 03                	jmp    402221 <rio_readlineb+0x73>
  40221e:	48 89 c5             	mov    %rax,%rbp
  402221:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402225:	48 89 d8             	mov    %rbx,%rax
  402228:	eb 0e                	jmp    402238 <rio_readlineb+0x8a>
  40222a:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402231:	eb 05                	jmp    402238 <rio_readlineb+0x8a>
  402233:	b8 00 00 00 00       	mov    $0x0,%eax
  402238:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  40223d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402244:	00 00 
  402246:	74 05                	je     40224d <rio_readlineb+0x9f>
  402248:	e8 c3 ea ff ff       	callq  400d10 <__stack_chk_fail@plt>
  40224d:	48 83 c4 18          	add    $0x18,%rsp
  402251:	5b                   	pop    %rbx
  402252:	5d                   	pop    %rbp
  402253:	41 5c                	pop    %r12
  402255:	41 5d                	pop    %r13
  402257:	c3                   	retq   

0000000000402258 <urlencode>:
  402258:	41 54                	push   %r12
  40225a:	55                   	push   %rbp
  40225b:	53                   	push   %rbx
  40225c:	48 83 ec 10          	sub    $0x10,%rsp
  402260:	48 89 fb             	mov    %rdi,%rbx
  402263:	48 89 f5             	mov    %rsi,%rbp
  402266:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40226d:	00 00 
  40226f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402274:	31 c0                	xor    %eax,%eax
  402276:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40227d:	f2 ae                	repnz scas %es:(%rdi),%al
  40227f:	48 f7 d1             	not    %rcx
  402282:	8d 41 ff             	lea    -0x1(%rcx),%eax
  402285:	e9 aa 00 00 00       	jmpq   402334 <urlencode+0xdc>
  40228a:	44 0f b6 03          	movzbl (%rbx),%r8d
  40228e:	41 80 f8 2a          	cmp    $0x2a,%r8b
  402292:	0f 94 c2             	sete   %dl
  402295:	41 80 f8 2d          	cmp    $0x2d,%r8b
  402299:	0f 94 c0             	sete   %al
  40229c:	08 c2                	or     %al,%dl
  40229e:	75 24                	jne    4022c4 <urlencode+0x6c>
  4022a0:	41 80 f8 2e          	cmp    $0x2e,%r8b
  4022a4:	74 1e                	je     4022c4 <urlencode+0x6c>
  4022a6:	41 80 f8 5f          	cmp    $0x5f,%r8b
  4022aa:	74 18                	je     4022c4 <urlencode+0x6c>
  4022ac:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  4022b0:	3c 09                	cmp    $0x9,%al
  4022b2:	76 10                	jbe    4022c4 <urlencode+0x6c>
  4022b4:	41 8d 40 bf          	lea    -0x41(%r8),%eax
  4022b8:	3c 19                	cmp    $0x19,%al
  4022ba:	76 08                	jbe    4022c4 <urlencode+0x6c>
  4022bc:	41 8d 40 9f          	lea    -0x61(%r8),%eax
  4022c0:	3c 19                	cmp    $0x19,%al
  4022c2:	77 0a                	ja     4022ce <urlencode+0x76>
  4022c4:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  4022c8:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4022cc:	eb 5f                	jmp    40232d <urlencode+0xd5>
  4022ce:	41 80 f8 20          	cmp    $0x20,%r8b
  4022d2:	75 0a                	jne    4022de <urlencode+0x86>
  4022d4:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4022d8:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4022dc:	eb 4f                	jmp    40232d <urlencode+0xd5>
  4022de:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  4022e2:	3c 5f                	cmp    $0x5f,%al
  4022e4:	0f 96 c2             	setbe  %dl
  4022e7:	41 80 f8 09          	cmp    $0x9,%r8b
  4022eb:	0f 94 c0             	sete   %al
  4022ee:	08 c2                	or     %al,%dl
  4022f0:	74 50                	je     402342 <urlencode+0xea>
  4022f2:	45 0f b6 c0          	movzbl %r8b,%r8d
  4022f6:	b9 d8 36 40 00       	mov    $0x4036d8,%ecx
  4022fb:	ba 08 00 00 00       	mov    $0x8,%edx
  402300:	be 01 00 00 00       	mov    $0x1,%esi
  402305:	48 89 e7             	mov    %rsp,%rdi
  402308:	b8 00 00 00 00       	mov    $0x0,%eax
  40230d:	e8 8e eb ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402312:	0f b6 04 24          	movzbl (%rsp),%eax
  402316:	88 45 00             	mov    %al,0x0(%rbp)
  402319:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  40231e:	88 45 01             	mov    %al,0x1(%rbp)
  402321:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  402326:	88 45 02             	mov    %al,0x2(%rbp)
  402329:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  40232d:	48 83 c3 01          	add    $0x1,%rbx
  402331:	44 89 e0             	mov    %r12d,%eax
  402334:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402338:	85 c0                	test   %eax,%eax
  40233a:	0f 85 4a ff ff ff    	jne    40228a <urlencode+0x32>
  402340:	eb 05                	jmp    402347 <urlencode+0xef>
  402342:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402347:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  40234c:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  402353:	00 00 
  402355:	74 05                	je     40235c <urlencode+0x104>
  402357:	e8 b4 e9 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  40235c:	48 83 c4 10          	add    $0x10,%rsp
  402360:	5b                   	pop    %rbx
  402361:	5d                   	pop    %rbp
  402362:	41 5c                	pop    %r12
  402364:	c3                   	retq   

0000000000402365 <submitr>:
  402365:	41 57                	push   %r15
  402367:	41 56                	push   %r14
  402369:	41 55                	push   %r13
  40236b:	41 54                	push   %r12
  40236d:	55                   	push   %rbp
  40236e:	53                   	push   %rbx
  40236f:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402376:	49 89 fd             	mov    %rdi,%r13
  402379:	89 74 24 0c          	mov    %esi,0xc(%rsp)
  40237d:	48 89 14 24          	mov    %rdx,(%rsp)
  402381:	49 89 ce             	mov    %rcx,%r14
  402384:	4d 89 c7             	mov    %r8,%r15
  402387:	4d 89 cc             	mov    %r9,%r12
  40238a:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  402391:	00 
  402392:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402399:	00 00 
  40239b:	48 89 84 24 48 a0 00 	mov    %rax,0xa048(%rsp)
  4023a2:	00 
  4023a3:	31 c0                	xor    %eax,%eax
  4023a5:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%rsp)
  4023ac:	00 
  4023ad:	ba 00 00 00 00       	mov    $0x0,%edx
  4023b2:	be 01 00 00 00       	mov    $0x1,%esi
  4023b7:	bf 02 00 00 00       	mov    $0x2,%edi
  4023bc:	e8 ef ea ff ff       	callq  400eb0 <socket@plt>
  4023c1:	85 c0                	test   %eax,%eax
  4023c3:	79 4e                	jns    402413 <submitr+0xae>
  4023c5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4023cc:	3a 20 43 
  4023cf:	48 89 03             	mov    %rax,(%rbx)
  4023d2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4023d9:	20 75 6e 
  4023dc:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023e0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4023e7:	74 6f 20 
  4023ea:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023ee:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4023f5:	65 20 73 
  4023f8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023fc:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  402403:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402409:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40240e:	e9 b3 06 00 00       	jmpq   402ac6 <submitr+0x761>
  402413:	89 c5                	mov    %eax,%ebp
  402415:	4c 89 ef             	mov    %r13,%rdi
  402418:	e8 73 e9 ff ff       	callq  400d90 <gethostbyname@plt>
  40241d:	48 85 c0             	test   %rax,%rax
  402420:	75 75                	jne    402497 <submitr+0x132>
  402422:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402429:	3a 20 44 
  40242c:	48 89 03             	mov    %rax,(%rbx)
  40242f:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402436:	20 75 6e 
  402439:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40243d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402444:	74 6f 20 
  402447:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40244b:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402452:	76 65 20 
  402455:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402459:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  402460:	61 62 20 
  402463:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402467:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  40246e:	72 20 61 
  402471:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402475:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  40247c:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  402482:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  402486:	89 ef                	mov    %ebp,%edi
  402488:	e8 c3 e8 ff ff       	callq  400d50 <close@plt>
  40248d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402492:	e9 2f 06 00 00       	jmpq   402ac6 <submitr+0x761>
  402497:	48 c7 44 24 20 00 00 	movq   $0x0,0x20(%rsp)
  40249e:	00 00 
  4024a0:	48 c7 44 24 28 00 00 	movq   $0x0,0x28(%rsp)
  4024a7:	00 00 
  4024a9:	66 c7 44 24 20 02 00 	movw   $0x2,0x20(%rsp)
  4024b0:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4024b4:	48 8b 40 18          	mov    0x18(%rax),%rax
  4024b8:	48 8b 30             	mov    (%rax),%rsi
  4024bb:	48 8d 7c 24 24       	lea    0x24(%rsp),%rdi
  4024c0:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4024c5:	e8 d6 e8 ff ff       	callq  400da0 <__memmove_chk@plt>
  4024ca:	0f b7 44 24 0c       	movzwl 0xc(%rsp),%eax
  4024cf:	66 c1 c8 08          	ror    $0x8,%ax
  4024d3:	66 89 44 24 22       	mov    %ax,0x22(%rsp)
  4024d8:	ba 10 00 00 00       	mov    $0x10,%edx
  4024dd:	48 8d 74 24 20       	lea    0x20(%rsp),%rsi
  4024e2:	89 ef                	mov    %ebp,%edi
  4024e4:	e8 97 e9 ff ff       	callq  400e80 <connect@plt>
  4024e9:	85 c0                	test   %eax,%eax
  4024eb:	79 67                	jns    402554 <submitr+0x1ef>
  4024ed:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4024f4:	3a 20 55 
  4024f7:	48 89 03             	mov    %rax,(%rbx)
  4024fa:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402501:	20 74 6f 
  402504:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402508:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40250f:	65 63 74 
  402512:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402516:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40251d:	68 65 20 
  402520:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402524:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  40252b:	61 62 20 
  40252e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402532:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  402539:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  40253f:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  402543:	89 ef                	mov    %ebp,%edi
  402545:	e8 06 e8 ff ff       	callq  400d50 <close@plt>
  40254a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40254f:	e9 72 05 00 00       	jmpq   402ac6 <submitr+0x761>
  402554:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  40255b:	b8 00 00 00 00       	mov    $0x0,%eax
  402560:	48 89 f1             	mov    %rsi,%rcx
  402563:	4c 89 e7             	mov    %r12,%rdi
  402566:	f2 ae                	repnz scas %es:(%rdi),%al
  402568:	48 f7 d1             	not    %rcx
  40256b:	48 89 ca             	mov    %rcx,%rdx
  40256e:	48 89 f1             	mov    %rsi,%rcx
  402571:	48 8b 3c 24          	mov    (%rsp),%rdi
  402575:	f2 ae                	repnz scas %es:(%rdi),%al
  402577:	48 f7 d1             	not    %rcx
  40257a:	49 89 c8             	mov    %rcx,%r8
  40257d:	48 89 f1             	mov    %rsi,%rcx
  402580:	4c 89 f7             	mov    %r14,%rdi
  402583:	f2 ae                	repnz scas %es:(%rdi),%al
  402585:	48 f7 d1             	not    %rcx
  402588:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  40258d:	48 89 f1             	mov    %rsi,%rcx
  402590:	4c 89 ff             	mov    %r15,%rdi
  402593:	f2 ae                	repnz scas %es:(%rdi),%al
  402595:	48 89 c8             	mov    %rcx,%rax
  402598:	48 f7 d0             	not    %rax
  40259b:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  4025a0:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  4025a5:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  4025ac:	00 
  4025ad:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4025b3:	76 72                	jbe    402627 <submitr+0x2c2>
  4025b5:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4025bc:	3a 20 52 
  4025bf:	48 89 03             	mov    %rax,(%rbx)
  4025c2:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4025c9:	20 73 74 
  4025cc:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025d0:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  4025d7:	74 6f 6f 
  4025da:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025de:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  4025e5:	65 2e 20 
  4025e8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025ec:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  4025f3:	61 73 65 
  4025f6:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025fa:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402601:	49 54 52 
  402604:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402608:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  40260f:	55 46 00 
  402612:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402616:	89 ef                	mov    %ebp,%edi
  402618:	e8 33 e7 ff ff       	callq  400d50 <close@plt>
  40261d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402622:	e9 9f 04 00 00       	jmpq   402ac6 <submitr+0x761>
  402627:	48 8d b4 24 40 40 00 	lea    0x4040(%rsp),%rsi
  40262e:	00 
  40262f:	b9 00 04 00 00       	mov    $0x400,%ecx
  402634:	b8 00 00 00 00       	mov    $0x0,%eax
  402639:	48 89 f7             	mov    %rsi,%rdi
  40263c:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40263f:	4c 89 e7             	mov    %r12,%rdi
  402642:	e8 11 fc ff ff       	callq  402258 <urlencode>
  402647:	85 c0                	test   %eax,%eax
  402649:	0f 89 8a 00 00 00    	jns    4026d9 <submitr+0x374>
  40264f:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402656:	3a 20 52 
  402659:	48 89 03             	mov    %rax,(%rbx)
  40265c:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402663:	20 73 74 
  402666:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40266a:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402671:	63 6f 6e 
  402674:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402678:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  40267f:	20 61 6e 
  402682:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402686:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40268d:	67 61 6c 
  402690:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402694:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  40269b:	6e 70 72 
  40269e:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026a2:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4026a9:	6c 65 20 
  4026ac:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4026b0:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4026b7:	63 74 65 
  4026ba:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4026be:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  4026c4:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  4026c8:	89 ef                	mov    %ebp,%edi
  4026ca:	e8 81 e6 ff ff       	callq  400d50 <close@plt>
  4026cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026d4:	e9 ed 03 00 00       	jmpq   402ac6 <submitr+0x761>
  4026d9:	4c 8d a4 24 40 20 00 	lea    0x2040(%rsp),%r12
  4026e0:	00 
  4026e1:	48 83 ec 08          	sub    $0x8,%rsp
  4026e5:	41 55                	push   %r13
  4026e7:	48 8d 84 24 50 40 00 	lea    0x4050(%rsp),%rax
  4026ee:	00 
  4026ef:	50                   	push   %rax
  4026f0:	41 56                	push   %r14
  4026f2:	4d 89 f9             	mov    %r15,%r9
  4026f5:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  4026fa:	b9 48 36 40 00       	mov    $0x403648,%ecx
  4026ff:	ba 00 20 00 00       	mov    $0x2000,%edx
  402704:	be 01 00 00 00       	mov    $0x1,%esi
  402709:	4c 89 e7             	mov    %r12,%rdi
  40270c:	b8 00 00 00 00       	mov    $0x0,%eax
  402711:	e8 8a e7 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402716:	b8 00 00 00 00       	mov    $0x0,%eax
  40271b:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402722:	4c 89 e7             	mov    %r12,%rdi
  402725:	f2 ae                	repnz scas %es:(%rdi),%al
  402727:	48 f7 d1             	not    %rcx
  40272a:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40272e:	48 83 c4 20          	add    $0x20,%rsp
  402732:	4c 89 e6             	mov    %r12,%rsi
  402735:	89 ef                	mov    %ebp,%edi
  402737:	e8 8b f9 ff ff       	callq  4020c7 <rio_writen>
  40273c:	48 85 c0             	test   %rax,%rax
  40273f:	79 6b                	jns    4027ac <submitr+0x447>
  402741:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402748:	3a 20 43 
  40274b:	48 89 03             	mov    %rax,(%rbx)
  40274e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402755:	20 75 6e 
  402758:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40275c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402763:	74 6f 20 
  402766:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40276a:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402771:	20 74 6f 
  402774:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402778:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  40277f:	41 75 74 
  402782:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402786:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  40278d:	73 65 72 
  402790:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402794:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  40279b:	89 ef                	mov    %ebp,%edi
  40279d:	e8 ae e5 ff ff       	callq  400d50 <close@plt>
  4027a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027a7:	e9 1a 03 00 00       	jmpq   402ac6 <submitr+0x761>
  4027ac:	89 ee                	mov    %ebp,%esi
  4027ae:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4027b3:	e8 cf f8 ff ff       	callq  402087 <rio_readinitb>
  4027b8:	ba 00 20 00 00       	mov    $0x2000,%edx
  4027bd:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  4027c4:	00 
  4027c5:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  4027ca:	e8 df f9 ff ff       	callq  4021ae <rio_readlineb>
  4027cf:	48 85 c0             	test   %rax,%rax
  4027d2:	7f 7f                	jg     402853 <submitr+0x4ee>
  4027d4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4027db:	3a 20 43 
  4027de:	48 89 03             	mov    %rax,(%rbx)
  4027e1:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4027e8:	20 75 6e 
  4027eb:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4027ef:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027f6:	74 6f 20 
  4027f9:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027fd:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402804:	66 69 72 
  402807:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40280b:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402812:	61 64 65 
  402815:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402819:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  402820:	6d 20 41 
  402823:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402827:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  40282e:	62 20 73 
  402831:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402835:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  40283c:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  402842:	89 ef                	mov    %ebp,%edi
  402844:	e8 07 e5 ff ff       	callq  400d50 <close@plt>
  402849:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40284e:	e9 73 02 00 00       	jmpq   402ac6 <submitr+0x761>
  402853:	4c 8d 84 24 40 80 00 	lea    0x8040(%rsp),%r8
  40285a:	00 
  40285b:	48 8d 4c 24 1c       	lea    0x1c(%rsp),%rcx
  402860:	48 8d 94 24 40 60 00 	lea    0x6040(%rsp),%rdx
  402867:	00 
  402868:	be df 36 40 00       	mov    $0x4036df,%esi
  40286d:	48 8d bc 24 40 20 00 	lea    0x2040(%rsp),%rdi
  402874:	00 
  402875:	b8 00 00 00 00       	mov    $0x0,%eax
  40287a:	e8 81 e5 ff ff       	callq  400e00 <__isoc99_sscanf@plt>
  40287f:	e9 92 00 00 00       	jmpq   402916 <submitr+0x5b1>
  402884:	ba 00 20 00 00       	mov    $0x2000,%edx
  402889:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402890:	00 
  402891:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  402896:	e8 13 f9 ff ff       	callq  4021ae <rio_readlineb>
  40289b:	48 85 c0             	test   %rax,%rax
  40289e:	7f 76                	jg     402916 <submitr+0x5b1>
  4028a0:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028a7:	3a 20 43 
  4028aa:	48 89 03             	mov    %rax,(%rbx)
  4028ad:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028b4:	20 75 6e 
  4028b7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028bb:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028c2:	74 6f 20 
  4028c5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028c9:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4028d0:	68 65 61 
  4028d3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028d7:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4028de:	66 72 6f 
  4028e1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028e5:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  4028ec:	6f 6c 61 
  4028ef:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028f3:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  4028fa:	76 65 72 
  4028fd:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402901:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  402905:	89 ef                	mov    %ebp,%edi
  402907:	e8 44 e4 ff ff       	callq  400d50 <close@plt>
  40290c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402911:	e9 b0 01 00 00       	jmpq   402ac6 <submitr+0x761>
  402916:	0f b6 94 24 40 20 00 	movzbl 0x2040(%rsp),%edx
  40291d:	00 
  40291e:	b8 0d 00 00 00       	mov    $0xd,%eax
  402923:	29 d0                	sub    %edx,%eax
  402925:	75 1b                	jne    402942 <submitr+0x5dd>
  402927:	0f b6 94 24 41 20 00 	movzbl 0x2041(%rsp),%edx
  40292e:	00 
  40292f:	b8 0a 00 00 00       	mov    $0xa,%eax
  402934:	29 d0                	sub    %edx,%eax
  402936:	75 0a                	jne    402942 <submitr+0x5dd>
  402938:	0f b6 84 24 42 20 00 	movzbl 0x2042(%rsp),%eax
  40293f:	00 
  402940:	f7 d8                	neg    %eax
  402942:	85 c0                	test   %eax,%eax
  402944:	0f 85 3a ff ff ff    	jne    402884 <submitr+0x51f>
  40294a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40294f:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402956:	00 
  402957:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  40295c:	e8 4d f8 ff ff       	callq  4021ae <rio_readlineb>
  402961:	48 85 c0             	test   %rax,%rax
  402964:	0f 8f 80 00 00 00    	jg     4029ea <submitr+0x685>
  40296a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402971:	3a 20 43 
  402974:	48 89 03             	mov    %rax,(%rbx)
  402977:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40297e:	20 75 6e 
  402981:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402985:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40298c:	74 6f 20 
  40298f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402993:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  40299a:	73 74 61 
  40299d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4029a1:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4029a8:	65 73 73 
  4029ab:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4029af:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4029b6:	72 6f 6d 
  4029b9:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4029bd:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  4029c4:	6c 61 62 
  4029c7:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4029cb:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  4029d2:	65 72 00 
  4029d5:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4029d9:	89 ef                	mov    %ebp,%edi
  4029db:	e8 70 e3 ff ff       	callq  400d50 <close@plt>
  4029e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029e5:	e9 dc 00 00 00       	jmpq   402ac6 <submitr+0x761>
  4029ea:	44 8b 44 24 1c       	mov    0x1c(%rsp),%r8d
  4029ef:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  4029f6:	74 37                	je     402a2f <submitr+0x6ca>
  4029f8:	4c 8d 8c 24 40 80 00 	lea    0x8040(%rsp),%r9
  4029ff:	00 
  402a00:	b9 a8 36 40 00       	mov    $0x4036a8,%ecx
  402a05:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  402a0c:	be 01 00 00 00       	mov    $0x1,%esi
  402a11:	48 89 df             	mov    %rbx,%rdi
  402a14:	b8 00 00 00 00       	mov    $0x0,%eax
  402a19:	e8 82 e4 ff ff       	callq  400ea0 <__sprintf_chk@plt>
  402a1e:	89 ef                	mov    %ebp,%edi
  402a20:	e8 2b e3 ff ff       	callq  400d50 <close@plt>
  402a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a2a:	e9 97 00 00 00       	jmpq   402ac6 <submitr+0x761>
  402a2f:	48 8d b4 24 40 20 00 	lea    0x2040(%rsp),%rsi
  402a36:	00 
  402a37:	48 89 df             	mov    %rbx,%rdi
  402a3a:	e8 a1 e2 ff ff       	callq  400ce0 <strcpy@plt>
  402a3f:	89 ef                	mov    %ebp,%edi
  402a41:	e8 0a e3 ff ff       	callq  400d50 <close@plt>
  402a46:	0f b6 03             	movzbl (%rbx),%eax
  402a49:	ba 4f 00 00 00       	mov    $0x4f,%edx
  402a4e:	29 c2                	sub    %eax,%edx
  402a50:	75 22                	jne    402a74 <submitr+0x70f>
  402a52:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402a56:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402a5b:	29 c8                	sub    %ecx,%eax
  402a5d:	75 17                	jne    402a76 <submitr+0x711>
  402a5f:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402a63:	b8 0a 00 00 00       	mov    $0xa,%eax
  402a68:	29 c8                	sub    %ecx,%eax
  402a6a:	75 0a                	jne    402a76 <submitr+0x711>
  402a6c:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402a70:	f7 d8                	neg    %eax
  402a72:	eb 02                	jmp    402a76 <submitr+0x711>
  402a74:	89 d0                	mov    %edx,%eax
  402a76:	85 c0                	test   %eax,%eax
  402a78:	74 40                	je     402aba <submitr+0x755>
  402a7a:	bf f0 36 40 00       	mov    $0x4036f0,%edi
  402a7f:	b9 05 00 00 00       	mov    $0x5,%ecx
  402a84:	48 89 de             	mov    %rbx,%rsi
  402a87:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402a89:	0f 97 c0             	seta   %al
  402a8c:	0f 92 c1             	setb   %cl
  402a8f:	29 c8                	sub    %ecx,%eax
  402a91:	0f be c0             	movsbl %al,%eax
  402a94:	85 c0                	test   %eax,%eax
  402a96:	74 2e                	je     402ac6 <submitr+0x761>
  402a98:	85 d2                	test   %edx,%edx
  402a9a:	75 13                	jne    402aaf <submitr+0x74a>
  402a9c:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402aa0:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402aa5:	29 c2                	sub    %eax,%edx
  402aa7:	75 06                	jne    402aaf <submitr+0x74a>
  402aa9:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402aad:	f7 da                	neg    %edx
  402aaf:	85 d2                	test   %edx,%edx
  402ab1:	75 0e                	jne    402ac1 <submitr+0x75c>
  402ab3:	b8 00 00 00 00       	mov    $0x0,%eax
  402ab8:	eb 0c                	jmp    402ac6 <submitr+0x761>
  402aba:	b8 00 00 00 00       	mov    $0x0,%eax
  402abf:	eb 05                	jmp    402ac6 <submitr+0x761>
  402ac1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ac6:	48 8b 9c 24 48 a0 00 	mov    0xa048(%rsp),%rbx
  402acd:	00 
  402ace:	64 48 33 1c 25 28 00 	xor    %fs:0x28,%rbx
  402ad5:	00 00 
  402ad7:	74 05                	je     402ade <submitr+0x779>
  402ad9:	e8 32 e2 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402ade:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  402ae5:	5b                   	pop    %rbx
  402ae6:	5d                   	pop    %rbp
  402ae7:	41 5c                	pop    %r12
  402ae9:	41 5d                	pop    %r13
  402aeb:	41 5e                	pop    %r14
  402aed:	41 5f                	pop    %r15
  402aef:	c3                   	retq   

0000000000402af0 <init_timeout>:
  402af0:	85 ff                	test   %edi,%edi
  402af2:	74 23                	je     402b17 <init_timeout+0x27>
  402af4:	53                   	push   %rbx
  402af5:	89 fb                	mov    %edi,%ebx
  402af7:	85 ff                	test   %edi,%edi
  402af9:	79 05                	jns    402b00 <init_timeout+0x10>
  402afb:	bb 00 00 00 00       	mov    $0x0,%ebx
  402b00:	be 99 20 40 00       	mov    $0x402099,%esi
  402b05:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b0a:	e8 71 e2 ff ff       	callq  400d80 <signal@plt>
  402b0f:	89 df                	mov    %ebx,%edi
  402b11:	e8 2a e2 ff ff       	callq  400d40 <alarm@plt>
  402b16:	5b                   	pop    %rbx
  402b17:	f3 c3                	repz retq 

0000000000402b19 <init_driver>:
  402b19:	55                   	push   %rbp
  402b1a:	53                   	push   %rbx
  402b1b:	48 83 ec 28          	sub    $0x28,%rsp
  402b1f:	48 89 fd             	mov    %rdi,%rbp
  402b22:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b29:	00 00 
  402b2b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402b30:	31 c0                	xor    %eax,%eax
  402b32:	be 01 00 00 00       	mov    $0x1,%esi
  402b37:	bf 0d 00 00 00       	mov    $0xd,%edi
  402b3c:	e8 3f e2 ff ff       	callq  400d80 <signal@plt>
  402b41:	be 01 00 00 00       	mov    $0x1,%esi
  402b46:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b4b:	e8 30 e2 ff ff       	callq  400d80 <signal@plt>
  402b50:	be 01 00 00 00       	mov    $0x1,%esi
  402b55:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402b5a:	e8 21 e2 ff ff       	callq  400d80 <signal@plt>
  402b5f:	ba 00 00 00 00       	mov    $0x0,%edx
  402b64:	be 01 00 00 00       	mov    $0x1,%esi
  402b69:	bf 02 00 00 00       	mov    $0x2,%edi
  402b6e:	e8 3d e3 ff ff       	callq  400eb0 <socket@plt>
  402b73:	85 c0                	test   %eax,%eax
  402b75:	79 4f                	jns    402bc6 <init_driver+0xad>
  402b77:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402b7e:	3a 20 43 
  402b81:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b85:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402b8c:	20 75 6e 
  402b8f:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b93:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b9a:	74 6f 20 
  402b9d:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ba1:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402ba8:	65 20 73 
  402bab:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402baf:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402bb6:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402bbc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bc1:	e9 2a 01 00 00       	jmpq   402cf0 <init_driver+0x1d7>
  402bc6:	89 c3                	mov    %eax,%ebx
  402bc8:	bf 15 32 40 00       	mov    $0x403215,%edi
  402bcd:	e8 be e1 ff ff       	callq  400d90 <gethostbyname@plt>
  402bd2:	48 85 c0             	test   %rax,%rax
  402bd5:	75 68                	jne    402c3f <init_driver+0x126>
  402bd7:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402bde:	3a 20 44 
  402be1:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402be5:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402bec:	20 75 6e 
  402bef:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402bf3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bfa:	74 6f 20 
  402bfd:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c01:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402c08:	76 65 20 
  402c0b:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402c0f:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402c16:	72 20 61 
  402c19:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c1d:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402c24:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402c2a:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402c2e:	89 df                	mov    %ebx,%edi
  402c30:	e8 1b e1 ff ff       	callq  400d50 <close@plt>
  402c35:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c3a:	e9 b1 00 00 00       	jmpq   402cf0 <init_driver+0x1d7>
  402c3f:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402c46:	00 
  402c47:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402c4e:	00 00 
  402c50:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402c56:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402c5a:	48 8b 40 18          	mov    0x18(%rax),%rax
  402c5e:	48 8b 30             	mov    (%rax),%rsi
  402c61:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402c66:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402c6b:	e8 30 e1 ff ff       	callq  400da0 <__memmove_chk@plt>
  402c70:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  402c77:	ba 10 00 00 00       	mov    $0x10,%edx
  402c7c:	48 89 e6             	mov    %rsp,%rsi
  402c7f:	89 df                	mov    %ebx,%edi
  402c81:	e8 fa e1 ff ff       	callq  400e80 <connect@plt>
  402c86:	85 c0                	test   %eax,%eax
  402c88:	79 50                	jns    402cda <init_driver+0x1c1>
  402c8a:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402c91:	3a 20 55 
  402c94:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c98:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402c9f:	20 74 6f 
  402ca2:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ca6:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402cad:	65 63 74 
  402cb0:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402cb4:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402cbb:	65 72 76 
  402cbe:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402cc2:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402cc8:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402ccc:	89 df                	mov    %ebx,%edi
  402cce:	e8 7d e0 ff ff       	callq  400d50 <close@plt>
  402cd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402cd8:	eb 16                	jmp    402cf0 <init_driver+0x1d7>
  402cda:	89 df                	mov    %ebx,%edi
  402cdc:	e8 6f e0 ff ff       	callq  400d50 <close@plt>
  402ce1:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402ce7:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402ceb:	b8 00 00 00 00       	mov    $0x0,%eax
  402cf0:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402cf5:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402cfc:	00 00 
  402cfe:	74 05                	je     402d05 <init_driver+0x1ec>
  402d00:	e8 0b e0 ff ff       	callq  400d10 <__stack_chk_fail@plt>
  402d05:	48 83 c4 28          	add    $0x28,%rsp
  402d09:	5b                   	pop    %rbx
  402d0a:	5d                   	pop    %rbp
  402d0b:	c3                   	retq   

0000000000402d0c <driver_post>:
  402d0c:	53                   	push   %rbx
  402d0d:	4c 89 cb             	mov    %r9,%rbx
  402d10:	45 85 c0             	test   %r8d,%r8d
  402d13:	74 27                	je     402d3c <driver_post+0x30>
  402d15:	48 89 ca             	mov    %rcx,%rdx
  402d18:	be f5 36 40 00       	mov    $0x4036f5,%esi
  402d1d:	bf 01 00 00 00       	mov    $0x1,%edi
  402d22:	b8 00 00 00 00       	mov    $0x0,%eax
  402d27:	e8 f4 e0 ff ff       	callq  400e20 <__printf_chk@plt>
  402d2c:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d31:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d35:	b8 00 00 00 00       	mov    $0x0,%eax
  402d3a:	eb 3f                	jmp    402d7b <driver_post+0x6f>
  402d3c:	48 85 ff             	test   %rdi,%rdi
  402d3f:	74 2c                	je     402d6d <driver_post+0x61>
  402d41:	80 3f 00             	cmpb   $0x0,(%rdi)
  402d44:	74 27                	je     402d6d <driver_post+0x61>
  402d46:	48 83 ec 08          	sub    $0x8,%rsp
  402d4a:	41 51                	push   %r9
  402d4c:	49 89 c9             	mov    %rcx,%r9
  402d4f:	49 89 d0             	mov    %rdx,%r8
  402d52:	48 89 f9             	mov    %rdi,%rcx
  402d55:	48 89 f2             	mov    %rsi,%rdx
  402d58:	be 50 00 00 00       	mov    $0x50,%esi
  402d5d:	bf 15 32 40 00       	mov    $0x403215,%edi
  402d62:	e8 fe f5 ff ff       	callq  402365 <submitr>
  402d67:	48 83 c4 10          	add    $0x10,%rsp
  402d6b:	eb 0e                	jmp    402d7b <driver_post+0x6f>
  402d6d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402d72:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402d76:	b8 00 00 00 00       	mov    $0x0,%eax
  402d7b:	5b                   	pop    %rbx
  402d7c:	c3                   	retq   

0000000000402d7d <check>:
  402d7d:	89 f8                	mov    %edi,%eax
  402d7f:	c1 e8 1c             	shr    $0x1c,%eax
  402d82:	85 c0                	test   %eax,%eax
  402d84:	74 1d                	je     402da3 <check+0x26>
  402d86:	b9 00 00 00 00       	mov    $0x0,%ecx
  402d8b:	eb 0b                	jmp    402d98 <check+0x1b>
  402d8d:	89 f8                	mov    %edi,%eax
  402d8f:	d3 e8                	shr    %cl,%eax
  402d91:	3c 0a                	cmp    $0xa,%al
  402d93:	74 14                	je     402da9 <check+0x2c>
  402d95:	83 c1 08             	add    $0x8,%ecx
  402d98:	83 f9 1f             	cmp    $0x1f,%ecx
  402d9b:	7e f0                	jle    402d8d <check+0x10>
  402d9d:	b8 01 00 00 00       	mov    $0x1,%eax
  402da2:	c3                   	retq   
  402da3:	b8 00 00 00 00       	mov    $0x0,%eax
  402da8:	c3                   	retq   
  402da9:	b8 00 00 00 00       	mov    $0x0,%eax
  402dae:	c3                   	retq   

0000000000402daf <gencookie>:
  402daf:	53                   	push   %rbx
  402db0:	83 c7 01             	add    $0x1,%edi
  402db3:	e8 08 df ff ff       	callq  400cc0 <srandom@plt>
  402db8:	e8 23 e0 ff ff       	callq  400de0 <random@plt>
  402dbd:	89 c3                	mov    %eax,%ebx
  402dbf:	89 c7                	mov    %eax,%edi
  402dc1:	e8 b7 ff ff ff       	callq  402d7d <check>
  402dc6:	85 c0                	test   %eax,%eax
  402dc8:	74 ee                	je     402db8 <gencookie+0x9>
  402dca:	89 d8                	mov    %ebx,%eax
  402dcc:	5b                   	pop    %rbx
  402dcd:	c3                   	retq   
  402dce:	66 90                	xchg   %ax,%ax