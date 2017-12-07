
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  forktest();
  11:	e8 3a 00 00 00       	call   50 <forktest>
  exit();
  16:	e8 77 03 00 00       	call   392 <exit>
  1b:	66 90                	xchg   %ax,%ax
  1d:	66 90                	xchg   %ax,%ax
  1f:	90                   	nop

00000020 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
  20:	55                   	push   %ebp
  21:	89 e5                	mov    %esp,%ebp
  23:	53                   	push   %ebx
  24:	83 ec 10             	sub    $0x10,%esp
  27:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  2a:	53                   	push   %ebx
  2b:	e8 a0 01 00 00       	call   1d0 <strlen>
  30:	83 c4 0c             	add    $0xc,%esp
  33:	50                   	push   %eax
  34:	53                   	push   %ebx
  35:	ff 75 08             	pushl  0x8(%ebp)
  38:	e8 75 03 00 00       	call   3b2 <write>
}
  3d:	83 c4 10             	add    $0x10,%esp
  40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  43:	c9                   	leave  
  44:	c3                   	ret    
  45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000050 <forktest>:

void
forktest(void)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  54:	31 db                	xor    %ebx,%ebx
  write(fd, s, strlen(s));
}

void
forktest(void)
{
  56:	83 ec 10             	sub    $0x10,%esp
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  59:	68 3c 04 00 00       	push   $0x43c
  5e:	e8 6d 01 00 00       	call   1d0 <strlen>
  63:	83 c4 0c             	add    $0xc,%esp
  66:	50                   	push   %eax
  67:	68 3c 04 00 00       	push   $0x43c
  6c:	6a 01                	push   $0x1
  6e:	e8 3f 03 00 00       	call   3b2 <write>
  73:	83 c4 10             	add    $0x10,%esp
  76:	eb 19                	jmp    91 <forktest+0x41>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
  80:	0f 84 7c 00 00 00    	je     102 <forktest+0xb2>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  86:	83 c3 01             	add    $0x1,%ebx
  89:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  8f:	74 4f                	je     e0 <forktest+0x90>
    pid = fork();
  91:	e8 f4 02 00 00       	call   38a <fork>
    if(pid < 0)
  96:	85 c0                	test   %eax,%eax
  98:	79 e6                	jns    80 <forktest+0x30>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  9a:	85 db                	test   %ebx,%ebx
  9c:	74 10                	je     ae <forktest+0x5e>
  9e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  a0:	e8 f5 02 00 00       	call   39a <wait>
  a5:	85 c0                	test   %eax,%eax
  a7:	78 5e                	js     107 <forktest+0xb7>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  }

  for(; n > 0; n--){
  a9:	83 eb 01             	sub    $0x1,%ebx
  ac:	75 f2                	jne    a0 <forktest+0x50>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
  ae:	e8 e7 02 00 00       	call   39a <wait>
  b3:	83 f8 ff             	cmp    $0xffffffff,%eax
  b6:	75 71                	jne    129 <forktest+0xd9>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  b8:	83 ec 0c             	sub    $0xc,%esp
  bb:	68 6e 04 00 00       	push   $0x46e
  c0:	e8 0b 01 00 00       	call   1d0 <strlen>
  c5:	83 c4 0c             	add    $0xc,%esp
  c8:	50                   	push   %eax
  c9:	68 6e 04 00 00       	push   $0x46e
  ce:	6a 01                	push   $0x1
  d0:	e8 dd 02 00 00       	call   3b2 <write>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
}
  d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d8:	c9                   	leave  
  d9:	c3                   	ret    
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
  e0:	83 ec 0c             	sub    $0xc,%esp
  e3:	68 7c 04 00 00       	push   $0x47c
  e8:	e8 e3 00 00 00       	call   1d0 <strlen>
  ed:	83 c4 0c             	add    $0xc,%esp
  f0:	50                   	push   %eax
  f1:	68 7c 04 00 00       	push   $0x47c
  f6:	6a 01                	push   $0x1
  f8:	e8 b5 02 00 00       	call   3b2 <write>
      exit();
  }

  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit();
  fd:	e8 90 02 00 00       	call   392 <exit>
  for(n=0; n<N; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
 102:	e8 8b 02 00 00       	call   392 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 107:	83 ec 0c             	sub    $0xc,%esp
 10a:	68 47 04 00 00       	push   $0x447
 10f:	e8 bc 00 00 00       	call   1d0 <strlen>
 114:	83 c4 0c             	add    $0xc,%esp
 117:	50                   	push   %eax
 118:	68 47 04 00 00       	push   $0x447
 11d:	6a 01                	push   $0x1
 11f:	e8 8e 02 00 00       	call   3b2 <write>
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
      exit();
 124:	e8 69 02 00 00       	call   392 <exit>
#define N  1000

void
printf(int fd, char *s, ...)
{
  write(fd, s, strlen(s));
 129:	83 ec 0c             	sub    $0xc,%esp
 12c:	68 5b 04 00 00       	push   $0x45b
 131:	e8 9a 00 00 00       	call   1d0 <strlen>
 136:	83 c4 0c             	add    $0xc,%esp
 139:	50                   	push   %eax
 13a:	68 5b 04 00 00       	push   $0x45b
 13f:	6a 01                	push   $0x1
 141:	e8 6c 02 00 00       	call   3b2 <write>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    exit();
 146:	e8 47 02 00 00       	call   392 <exit>
 14b:	66 90                	xchg   %ax,%ax
 14d:	66 90                	xchg   %ax,%ax
 14f:	90                   	nop

00000150 <strcpy>:
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 15a:	89 c2                	mov    %eax,%edx
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 160:	83 c1 01             	add    $0x1,%ecx
 163:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 167:	83 c2 01             	add    $0x1,%edx
 16a:	84 db                	test   %bl,%bl
 16c:	88 5a ff             	mov    %bl,-0x1(%edx)
 16f:	75 ef                	jne    160 <strcpy+0x10>
 171:	5b                   	pop    %ebx
 172:	5d                   	pop    %ebp
 173:	c3                   	ret    
 174:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 17a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000180 <strcmp>:
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	8b 55 08             	mov    0x8(%ebp),%edx
 188:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 18b:	0f b6 02             	movzbl (%edx),%eax
 18e:	0f b6 19             	movzbl (%ecx),%ebx
 191:	84 c0                	test   %al,%al
 193:	75 1e                	jne    1b3 <strcmp+0x33>
 195:	eb 29                	jmp    1c0 <strcmp+0x40>
 197:	89 f6                	mov    %esi,%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1a0:	83 c2 01             	add    $0x1,%edx
 1a3:	0f b6 02             	movzbl (%edx),%eax
 1a6:	8d 71 01             	lea    0x1(%ecx),%esi
 1a9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1ad:	84 c0                	test   %al,%al
 1af:	74 0f                	je     1c0 <strcmp+0x40>
 1b1:	89 f1                	mov    %esi,%ecx
 1b3:	38 d8                	cmp    %bl,%al
 1b5:	74 e9                	je     1a0 <strcmp+0x20>
 1b7:	29 d8                	sub    %ebx,%eax
 1b9:	5b                   	pop    %ebx
 1ba:	5e                   	pop    %esi
 1bb:	5d                   	pop    %ebp
 1bc:	c3                   	ret    
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	29 d8                	sub    %ebx,%eax
 1c4:	5b                   	pop    %ebx
 1c5:	5e                   	pop    %esi
 1c6:	5d                   	pop    %ebp
 1c7:	c3                   	ret    
 1c8:	90                   	nop
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strlen>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1d6:	80 39 00             	cmpb   $0x0,(%ecx)
 1d9:	74 12                	je     1ed <strlen+0x1d>
 1db:	31 d2                	xor    %edx,%edx
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c2 01             	add    $0x1,%edx
 1e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 1e7:	89 d0                	mov    %edx,%eax
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
 1eb:	5d                   	pop    %ebp
 1ec:	c3                   	ret    
 1ed:	31 c0                	xor    %eax,%eax
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	eb 0d                	jmp    200 <memset>
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop

00000200 <memset>:
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
 212:	89 d0                	mov    %edx,%eax
 214:	5f                   	pop    %edi
 215:	5d                   	pop    %ebp
 216:	c3                   	ret    
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <strchr>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	74 1d                	je     24e <strchr+0x2e>
 231:	38 d3                	cmp    %dl,%bl
 233:	89 d9                	mov    %ebx,%ecx
 235:	75 0d                	jne    244 <strchr+0x24>
 237:	eb 17                	jmp    250 <strchr+0x30>
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 240:	38 ca                	cmp    %cl,%dl
 242:	74 0c                	je     250 <strchr+0x30>
 244:	83 c0 01             	add    $0x1,%eax
 247:	0f b6 10             	movzbl (%eax),%edx
 24a:	84 d2                	test   %dl,%dl
 24c:	75 f2                	jne    240 <strchr+0x20>
 24e:	31 c0                	xor    %eax,%eax
 250:	5b                   	pop    %ebx
 251:	5d                   	pop    %ebp
 252:	c3                   	ret    
 253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <gets>:
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
 265:	53                   	push   %ebx
 266:	31 f6                	xor    %esi,%esi
 268:	8d 7d e7             	lea    -0x19(%ebp),%edi
 26b:	83 ec 1c             	sub    $0x1c,%esp
 26e:	eb 29                	jmp    299 <gets+0x39>
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 2d 01 00 00       	call   3aa <read>
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	89 de                	mov    %ebx,%esi
 28d:	3c 0a                	cmp    $0xa,%al
 28f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 293:	74 1b                	je     2b0 <gets+0x50>
 295:	3c 0d                	cmp    $0xd,%al
 297:	74 17                	je     2b0 <gets+0x50>
 299:	8d 5e 01             	lea    0x1(%esi),%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	eb 0d                	jmp    2d0 <stat>
 2c3:	90                   	nop
 2c4:	90                   	nop
 2c5:	90                   	nop
 2c6:	90                   	nop
 2c7:	90                   	nop
 2c8:	90                   	nop
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop
 2cc:	90                   	nop
 2cd:	90                   	nop
 2ce:	90                   	nop
 2cf:	90                   	nop

000002d0 <stat>:
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 f0 00 00 00       	call   3d2 <open>
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 f3 00 00 00       	call   3ea <fstat>
 2f7:	89 c6                	mov    %eax,%esi
 2f9:	89 1c 24             	mov    %ebx,(%esp)
 2fc:	e8 b9 00 00 00       	call   3ba <close>
 301:	83 c4 10             	add    $0x10,%esp
 304:	89 f0                	mov    %esi,%eax
 306:	8d 65 f8             	lea    -0x8(%ebp),%esp
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
 310:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 315:	eb ef                	jmp    306 <stat+0x36>
 317:	89 f6                	mov    %esi,%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <atoi>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 4d 08             	mov    0x8(%ebp),%ecx
 327:	0f be 11             	movsbl (%ecx),%edx
 32a:	8d 42 d0             	lea    -0x30(%edx),%eax
 32d:	3c 09                	cmp    $0x9,%al
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
 334:	77 1f                	ja     355 <atoi+0x35>
 336:	8d 76 00             	lea    0x0(%esi),%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 340:	8d 04 80             	lea    (%eax,%eax,4),%eax
 343:	83 c1 01             	add    $0x1,%ecx
 346:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 34a:	0f be 11             	movsbl (%ecx),%edx
 34d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
 355:	5b                   	pop    %ebx
 356:	5d                   	pop    %ebp
 357:	c3                   	ret    
 358:	90                   	nop
 359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	56                   	push   %esi
 364:	53                   	push   %ebx
 365:	8b 5d 10             	mov    0x10(%ebp),%ebx
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
 36e:	85 db                	test   %ebx,%ebx
 370:	7e 14                	jle    386 <memmove+0x26>
 372:	31 d2                	xor    %edx,%edx
 374:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 378:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 37c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 37f:	83 c2 01             	add    $0x1,%edx
 382:	39 da                	cmp    %ebx,%edx
 384:	75 f2                	jne    378 <memmove+0x18>
 386:	5b                   	pop    %ebx
 387:	5e                   	pop    %esi
 388:	5d                   	pop    %ebp
 389:	c3                   	ret    

0000038a <fork>:
 38a:	b8 01 00 00 00       	mov    $0x1,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <exit>:
 392:	b8 02 00 00 00       	mov    $0x2,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <wait>:
 39a:	b8 03 00 00 00       	mov    $0x3,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <pipe>:
 3a2:	b8 04 00 00 00       	mov    $0x4,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <read>:
 3aa:	b8 05 00 00 00       	mov    $0x5,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <write>:
 3b2:	b8 10 00 00 00       	mov    $0x10,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <close>:
 3ba:	b8 15 00 00 00       	mov    $0x15,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <kill>:
 3c2:	b8 06 00 00 00       	mov    $0x6,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <exec>:
 3ca:	b8 07 00 00 00       	mov    $0x7,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <open>:
 3d2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <mknod>:
 3da:	b8 11 00 00 00       	mov    $0x11,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <unlink>:
 3e2:	b8 12 00 00 00       	mov    $0x12,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <fstat>:
 3ea:	b8 08 00 00 00       	mov    $0x8,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <link>:
 3f2:	b8 13 00 00 00       	mov    $0x13,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <mkdir>:
 3fa:	b8 14 00 00 00       	mov    $0x14,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <chdir>:
 402:	b8 09 00 00 00       	mov    $0x9,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <dup>:
 40a:	b8 0a 00 00 00       	mov    $0xa,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <getpid>:
 412:	b8 0b 00 00 00       	mov    $0xb,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <sbrk>:
 41a:	b8 0c 00 00 00       	mov    $0xc,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <sleep>:
 422:	b8 0d 00 00 00       	mov    $0xd,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <uptime>:
 42a:	b8 0e 00 00 00       	mov    $0xe,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <mkfile>:
 432:	b8 16 00 00 00       	mov    $0x16,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    
