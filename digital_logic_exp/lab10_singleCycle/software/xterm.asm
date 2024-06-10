
./xterm.o:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <showInt2SegDisplay>:
       0:	1101                	add	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	add	s0,sp,32
       6:	87aa                	mv	a5,a0
       8:	fef42623          	sw	a5,-20(s0)
       c:	1004f7b7          	lui	a5,0x1004f
      10:	fec42703          	lw	a4,-20(s0)
      14:	c398                	sw	a4,0(a5)
      16:	0001                	nop
      18:	6462                	ld	s0,24(sp)
      1a:	6105                	add	sp,sp,32
      1c:	8082                	ret

000000000000001e <putch>:
      1e:	7179                	add	sp,sp,-48
      20:	f422                	sd	s0,40(sp)
      22:	1800                	add	s0,sp,48
      24:	fca43c23          	sd	a0,-40(s0)
      28:	87ae                	mv	a5,a1
      2a:	fcf40ba3          	sb	a5,-41(s0)
      2e:	fd843783          	ld	a5,-40(s0)
      32:	fef43423          	sd	a5,-24(s0)
      36:	fd744783          	lbu	a5,-41(s0)
      3a:	fef403a3          	sb	a5,-25(s0)
      3e:	fe843783          	ld	a5,-24(s0)
      42:	639c                	ld	a5,0(a5)
      44:	fe843703          	ld	a4,-24(s0)
      48:	4718                	lw	a4,8(a4)
      4a:	97ba                	add	a5,a5,a4
      4c:	fe744703          	lbu	a4,-25(s0)
      50:	00e78023          	sb	a4,0(a5) # 1004f000 <.L14+0x1004dbac>
      54:	0001                	nop
      56:	0001                	nop
      58:	7422                	ld	s0,40(sp)
      5a:	6145                	add	sp,sp,48
      5c:	8082                	ret

000000000000005e <del>:
      5e:	7179                	add	sp,sp,-48
      60:	f422                	sd	s0,40(sp)
      62:	1800                	add	s0,sp,48
      64:	fca43c23          	sd	a0,-40(s0)
      68:	fd843783          	ld	a5,-40(s0)
      6c:	fef43423          	sd	a5,-24(s0)
      70:	fe0403a3          	sb	zero,-25(s0)
      74:	fe843783          	ld	a5,-24(s0)
      78:	639c                	ld	a5,0(a5)
      7a:	fe843703          	ld	a4,-24(s0)
      7e:	4718                	lw	a4,8(a4)
      80:	97ba                	add	a5,a5,a4
      82:	fe744703          	lbu	a4,-25(s0)
      86:	00e78023          	sb	a4,0(a5)
      8a:	0001                	nop
      8c:	0001                	nop
      8e:	7422                	ld	s0,40(sp)
      90:	6145                	add	sp,sp,48
      92:	8082                	ret

0000000000000094 <movePtr>:
      94:	7179                	add	sp,sp,-48
      96:	f422                	sd	s0,40(sp)
      98:	1800                	add	s0,sp,48
      9a:	fca43c23          	sd	a0,-40(s0)
      9e:	87ae                	mv	a5,a1
      a0:	fcf40ba3          	sb	a5,-41(s0)
      a4:	fd843783          	ld	a5,-40(s0)
      a8:	fef43423          	sd	a5,-24(s0)
      ac:	fd744783          	lbu	a5,-41(s0)
      b0:	fef403a3          	sb	a5,-25(s0)
      b4:	fe744783          	lbu	a5,-25(s0)
      b8:	0ff7f713          	zext.b	a4,a5
      bc:	47c5                	li	a5,17
      be:	02f71763          	bne	a4,a5,ec <.L4>
      c2:	fe843783          	ld	a5,-24(s0)
      c6:	4798                	lw	a4,8(a5)
      c8:	fe843783          	ld	a5,-24(s0)
      cc:	4fdc                	lw	a5,28(a5)
      ce:	00f74f63          	blt	a4,a5,ec <.L4>
      d2:	fe843783          	ld	a5,-24(s0)
      d6:	4798                	lw	a4,8(a5)
      d8:	fe843783          	ld	a5,-24(s0)
      dc:	4fdc                	lw	a5,28(a5)
      de:	40f707bb          	subw	a5,a4,a5
      e2:	0007871b          	sext.w	a4,a5
      e6:	fe843783          	ld	a5,-24(s0)
      ea:	c798                	sw	a4,8(a5)

00000000000000ec <.L4>:
      ec:	fe744783          	lbu	a5,-25(s0)
      f0:	0ff7f713          	zext.b	a4,a5
      f4:	47c9                	li	a5,18
      f6:	02f71c63          	bne	a4,a5,12e <.L5>
      fa:	fe843783          	ld	a5,-24(s0)
      fe:	4798                	lw	a4,8(a5)
     100:	fe843783          	ld	a5,-24(s0)
     104:	4fdc                	lw	a5,28(a5)
     106:	9fb9                	addw	a5,a5,a4
     108:	0007871b          	sext.w	a4,a5
     10c:	fe843783          	ld	a5,-24(s0)
     110:	4f9c                	lw	a5,24(a5)
     112:	00f75e63          	bge	a4,a5,12e <.L5>
     116:	fe843783          	ld	a5,-24(s0)
     11a:	4798                	lw	a4,8(a5)
     11c:	fe843783          	ld	a5,-24(s0)
     120:	4fdc                	lw	a5,28(a5)
     122:	9fb9                	addw	a5,a5,a4
     124:	0007871b          	sext.w	a4,a5
     128:	fe843783          	ld	a5,-24(s0)
     12c:	c798                	sw	a4,8(a5)

000000000000012e <.L5>:
     12e:	fe744783          	lbu	a5,-25(s0)
     132:	0ff7f713          	zext.b	a4,a5
     136:	47cd                	li	a5,19
     138:	02f71663          	bne	a4,a5,164 <.L6>
     13c:	fe843783          	ld	a5,-24(s0)
     140:	479c                	lw	a5,8(a5)
     142:	2785                	addw	a5,a5,1
     144:	0007871b          	sext.w	a4,a5
     148:	fe843783          	ld	a5,-24(s0)
     14c:	4f9c                	lw	a5,24(a5)
     14e:	00f75b63          	bge	a4,a5,164 <.L6>
     152:	fe843783          	ld	a5,-24(s0)
     156:	479c                	lw	a5,8(a5)
     158:	2785                	addw	a5,a5,1
     15a:	0007871b          	sext.w	a4,a5
     15e:	fe843783          	ld	a5,-24(s0)
     162:	c798                	sw	a4,8(a5)

0000000000000164 <.L6>:
     164:	fe744783          	lbu	a5,-25(s0)
     168:	0ff7f713          	zext.b	a4,a5
     16c:	47d1                	li	a5,20
     16e:	02f71063          	bne	a4,a5,18e <.L7>
     172:	fe843783          	ld	a5,-24(s0)
     176:	479c                	lw	a5,8(a5)
     178:	00f05b63          	blez	a5,18e <.L7>
     17c:	fe843783          	ld	a5,-24(s0)
     180:	479c                	lw	a5,8(a5)
     182:	37fd                	addw	a5,a5,-1
     184:	0007871b          	sext.w	a4,a5
     188:	fe843783          	ld	a5,-24(s0)
     18c:	c798                	sw	a4,8(a5)

000000000000018e <.L7>:
     18e:	fe843783          	ld	a5,-24(s0)
     192:	6b9c                	ld	a5,16(a5)
     194:	fe843703          	ld	a4,-24(s0)
     198:	4718                	lw	a4,8(a4)
     19a:	c398                	sw	a4,0(a5)
     19c:	0001                	nop
     19e:	0001                	nop
     1a0:	7422                	ld	s0,40(sp)
     1a2:	6145                	add	sp,sp,48
     1a4:	8082                	ret

00000000000001a6 <getConChar>:
     1a6:	7179                	add	sp,sp,-48
     1a8:	f422                	sd	s0,40(sp)
     1aa:	1800                	add	s0,sp,48
     1ac:	fca43c23          	sd	a0,-40(s0)
     1b0:	87ae                	mv	a5,a1
     1b2:	fcf42a23          	sw	a5,-44(s0)
     1b6:	fd843783          	ld	a5,-40(s0)
     1ba:	fef43423          	sd	a5,-24(s0)
     1be:	fd442783          	lw	a5,-44(s0)
     1c2:	fef42223          	sw	a5,-28(s0)
     1c6:	fe843783          	ld	a5,-24(s0)
     1ca:	6398                	ld	a4,0(a5)
     1cc:	fe442783          	lw	a5,-28(s0)
     1d0:	97ba                	add	a5,a5,a4
     1d2:	0007c783          	lbu	a5,0(a5)
     1d6:	853e                	mv	a0,a5
     1d8:	7422                	ld	s0,40(sp)
     1da:	6145                	add	sp,sp,48
     1dc:	8082                	ret

00000000000001de <getc>:
     1de:	1101                	add	sp,sp,-32
     1e0:	ec06                	sd	ra,24(sp)
     1e2:	e822                	sd	s0,16(sp)
     1e4:	1000                	add	s0,sp,32
     1e6:	fea43423          	sd	a0,-24(s0)
     1ea:	fe843503          	ld	a0,-24(s0)
     1ee:	00000097          	auipc	ra,0x0
     1f2:	000080e7          	jalr	ra # 1ee <getc+0x10>
     1f6:	87aa                	mv	a5,a0
     1f8:	853e                	mv	a0,a5
     1fa:	60e2                	ld	ra,24(sp)
     1fc:	6442                	ld	s0,16(sp)
     1fe:	6105                	add	sp,sp,32
     200:	8082                	ret

0000000000000202 <getTime_ms>:
     202:	1141                	add	sp,sp,-16
     204:	e422                	sd	s0,8(sp)
     206:	0800                	add	s0,sp,16
     208:	500017b7          	lui	a5,0x50001
     20c:	0786                	sll	a5,a5,0x1
     20e:	b0078793          	add	a5,a5,-1280 # 50000b00 <.L14+0x4ffff6ac>
     212:	439c                	lw	a5,0(a5)
     214:	853e                	mv	a0,a5
     216:	6422                	ld	s0,8(sp)
     218:	0141                	add	sp,sp,16
     21a:	8082                	ret

000000000000021c <kb_getc>:
     21c:	7179                	add	sp,sp,-48
     21e:	f422                	sd	s0,40(sp)
     220:	1800                	add	s0,sp,48
     222:	fca43c23          	sd	a0,-40(s0)
     226:	fe0407a3          	sb	zero,-17(s0)
     22a:	57fd                	li	a5,-1
     22c:	fef42423          	sw	a5,-24(s0)
     230:	fe042223          	sw	zero,-28(s0)
     234:	a079                	j	2c2 <.L2>

0000000000000236 <.L5>:
     236:	fd843783          	ld	a5,-40(s0)
     23a:	6798                	ld	a4,8(a5)
     23c:	fe442783          	lw	a5,-28(s0)
     240:	97ba                	add	a5,a5,a4
     242:	0007c683          	lbu	a3,0(a5)
     246:	fd843783          	ld	a5,-40(s0)
     24a:	6398                	ld	a4,0(a5)
     24c:	fe442783          	lw	a5,-28(s0)
     250:	97ba                	add	a5,a5,a4
     252:	0007c783          	lbu	a5,0(a5)
     256:	8736                	mv	a4,a3
     258:	04f70063          	beq	a4,a5,298 <.L3>
     25c:	fd843783          	ld	a5,-40(s0)
     260:	6798                	ld	a4,8(a5)
     262:	fe442783          	lw	a5,-28(s0)
     266:	97ba                	add	a5,a5,a4
     268:	0007c783          	lbu	a5,0(a5)
     26c:	e795                	bnez	a5,298 <.L3>
     26e:	fd843783          	ld	a5,-40(s0)
     272:	6398                	ld	a4,0(a5)
     274:	fe442783          	lw	a5,-28(s0)
     278:	973e                	add	a4,a4,a5
     27a:	fd843783          	ld	a5,-40(s0)
     27e:	6794                	ld	a3,8(a5)
     280:	fe442783          	lw	a5,-28(s0)
     284:	97b6                	add	a5,a5,a3
     286:	00074703          	lbu	a4,0(a4)
     28a:	00e78023          	sb	a4,0(a5)
     28e:	fe442783          	lw	a5,-28(s0)
     292:	fef42423          	sw	a5,-24(s0)
     296:	a835                	j	2d2 <.L4>

0000000000000298 <.L3>:
     298:	fd843783          	ld	a5,-40(s0)
     29c:	6398                	ld	a4,0(a5)
     29e:	fe442783          	lw	a5,-28(s0)
     2a2:	973e                	add	a4,a4,a5
     2a4:	fd843783          	ld	a5,-40(s0)
     2a8:	6794                	ld	a3,8(a5)
     2aa:	fe442783          	lw	a5,-28(s0)
     2ae:	97b6                	add	a5,a5,a3
     2b0:	00074703          	lbu	a4,0(a4)
     2b4:	00e78023          	sb	a4,0(a5)
     2b8:	fe442783          	lw	a5,-28(s0)
     2bc:	2785                	addw	a5,a5,1
     2be:	fef42223          	sw	a5,-28(s0)

00000000000002c2 <.L2>:
     2c2:	fe442783          	lw	a5,-28(s0)
     2c6:	0007871b          	sext.w	a4,a5
     2ca:	0fe00793          	li	a5,254
     2ce:	f6e7d4e3          	bge	a5,a4,236 <.L5>

00000000000002d2 <.L4>:
     2d2:	fe842783          	lw	a5,-24(s0)
     2d6:	0007871b          	sext.w	a4,a5
     2da:	57fd                	li	a5,-1
     2dc:	62f70a63          	beq	a4,a5,910 <.L6>
     2e0:	1004f7b7          	lui	a5,0x1004f
     2e4:	fe842703          	lw	a4,-24(s0)
     2e8:	c398                	sw	a4,0(a5)
     2ea:	fe842783          	lw	a5,-24(s0)
     2ee:	0007871b          	sext.w	a4,a5
     2f2:	06600793          	li	a5,102
     2f6:	00f71563          	bne	a4,a5,300 <.L7>
     2fa:	47a1                	li	a5,8
     2fc:	fef407a3          	sb	a5,-17(s0)

0000000000000300 <.L7>:
     300:	fe842783          	lw	a5,-24(s0)
     304:	0007871b          	sext.w	a4,a5
     308:	05a00793          	li	a5,90
     30c:	00f71563          	bne	a4,a5,316 <.L8>
     310:	47a9                	li	a5,10
     312:	fef407a3          	sb	a5,-17(s0)

0000000000000316 <.L8>:
     316:	fe842783          	lw	a5,-24(s0)
     31a:	0007871b          	sext.w	a4,a5
     31e:	07600793          	li	a5,118
     322:	00f71563          	bne	a4,a5,32c <.L9>
     326:	47ed                	li	a5,27
     328:	fef407a3          	sb	a5,-17(s0)

000000000000032c <.L9>:
     32c:	fe842783          	lw	a5,-24(s0)
     330:	0007871b          	sext.w	a4,a5
     334:	07500793          	li	a5,117
     338:	00f71563          	bne	a4,a5,342 <.L10>
     33c:	47c5                	li	a5,17
     33e:	fef407a3          	sb	a5,-17(s0)

0000000000000342 <.L10>:
     342:	fe842783          	lw	a5,-24(s0)
     346:	0007871b          	sext.w	a4,a5
     34a:	07200793          	li	a5,114
     34e:	00f71563          	bne	a4,a5,358 <.L11>
     352:	47c9                	li	a5,18
     354:	fef407a3          	sb	a5,-17(s0)

0000000000000358 <.L11>:
     358:	fe842783          	lw	a5,-24(s0)
     35c:	0007871b          	sext.w	a4,a5
     360:	06b00793          	li	a5,107
     364:	00f71563          	bne	a4,a5,36e <.L12>
     368:	47cd                	li	a5,19
     36a:	fef407a3          	sb	a5,-17(s0)

000000000000036e <.L12>:
     36e:	fe842783          	lw	a5,-24(s0)
     372:	0007871b          	sext.w	a4,a5
     376:	07400793          	li	a5,116
     37a:	00f71563          	bne	a4,a5,384 <.L13>
     37e:	47d1                	li	a5,20
     380:	fef407a3          	sb	a5,-17(s0)

0000000000000384 <.L13>:
     384:	fe842783          	lw	a5,-24(s0)
     388:	0007871b          	sext.w	a4,a5
     38c:	47b5                	li	a5,13
     38e:	00f71663          	bne	a4,a5,39a <.L14>
     392:	02000793          	li	a5,32
     396:	fef407a3          	sb	a5,-17(s0)

000000000000039a <.L14>:
     39a:	fe842783          	lw	a5,-24(s0)
     39e:	0007871b          	sext.w	a4,a5
     3a2:	47b9                	li	a5,14
     3a4:	00f71663          	bne	a4,a5,3b0 <.L15>
     3a8:	06000793          	li	a5,96
     3ac:	fef407a3          	sb	a5,-17(s0)

00000000000003b0 <.L15>:
     3b0:	fe842783          	lw	a5,-24(s0)
     3b4:	0007871b          	sext.w	a4,a5
     3b8:	47d5                	li	a5,21
     3ba:	00f71663          	bne	a4,a5,3c6 <.L16>
     3be:	07100793          	li	a5,113
     3c2:	fef407a3          	sb	a5,-17(s0)

00000000000003c6 <.L16>:
     3c6:	fe842783          	lw	a5,-24(s0)
     3ca:	0007871b          	sext.w	a4,a5
     3ce:	47d9                	li	a5,22
     3d0:	00f71663          	bne	a4,a5,3dc <.L17>
     3d4:	03100793          	li	a5,49
     3d8:	fef407a3          	sb	a5,-17(s0)

00000000000003dc <.L17>:
     3dc:	fe842783          	lw	a5,-24(s0)
     3e0:	0007871b          	sext.w	a4,a5
     3e4:	47e9                	li	a5,26
     3e6:	00f71663          	bne	a4,a5,3f2 <.L18>
     3ea:	07a00793          	li	a5,122
     3ee:	fef407a3          	sb	a5,-17(s0)

00000000000003f2 <.L18>:
     3f2:	fe842783          	lw	a5,-24(s0)
     3f6:	0007871b          	sext.w	a4,a5
     3fa:	47ed                	li	a5,27
     3fc:	00f71663          	bne	a4,a5,408 <.L19>
     400:	07300793          	li	a5,115
     404:	fef407a3          	sb	a5,-17(s0)

0000000000000408 <.L19>:
     408:	fe842783          	lw	a5,-24(s0)
     40c:	0007871b          	sext.w	a4,a5
     410:	47f1                	li	a5,28
     412:	00f71663          	bne	a4,a5,41e <.L20>
     416:	06100793          	li	a5,97
     41a:	fef407a3          	sb	a5,-17(s0)

000000000000041e <.L20>:
     41e:	fe842783          	lw	a5,-24(s0)
     422:	0007871b          	sext.w	a4,a5
     426:	47f5                	li	a5,29
     428:	00f71663          	bne	a4,a5,434 <.L21>
     42c:	07700793          	li	a5,119
     430:	fef407a3          	sb	a5,-17(s0)

0000000000000434 <.L21>:
     434:	fe842783          	lw	a5,-24(s0)
     438:	0007871b          	sext.w	a4,a5
     43c:	47f9                	li	a5,30
     43e:	00f71663          	bne	a4,a5,44a <.L22>
     442:	03200793          	li	a5,50
     446:	fef407a3          	sb	a5,-17(s0)

000000000000044a <.L22>:
     44a:	fe842783          	lw	a5,-24(s0)
     44e:	0007871b          	sext.w	a4,a5
     452:	02100793          	li	a5,33
     456:	00f71663          	bne	a4,a5,462 <.L23>
     45a:	06300793          	li	a5,99
     45e:	fef407a3          	sb	a5,-17(s0)

0000000000000462 <.L23>:
     462:	fe842783          	lw	a5,-24(s0)
     466:	0007871b          	sext.w	a4,a5
     46a:	02200793          	li	a5,34
     46e:	00f71663          	bne	a4,a5,47a <.L24>
     472:	07800793          	li	a5,120
     476:	fef407a3          	sb	a5,-17(s0)

000000000000047a <.L24>:
     47a:	fe842783          	lw	a5,-24(s0)
     47e:	0007871b          	sext.w	a4,a5
     482:	02300793          	li	a5,35
     486:	00f71663          	bne	a4,a5,492 <.L25>
     48a:	06400793          	li	a5,100
     48e:	fef407a3          	sb	a5,-17(s0)

0000000000000492 <.L25>:
     492:	fe842783          	lw	a5,-24(s0)
     496:	0007871b          	sext.w	a4,a5
     49a:	02400793          	li	a5,36
     49e:	00f71663          	bne	a4,a5,4aa <.L26>
     4a2:	06500793          	li	a5,101
     4a6:	fef407a3          	sb	a5,-17(s0)

00000000000004aa <.L26>:
     4aa:	fe842783          	lw	a5,-24(s0)
     4ae:	0007871b          	sext.w	a4,a5
     4b2:	02500793          	li	a5,37
     4b6:	00f71663          	bne	a4,a5,4c2 <.L27>
     4ba:	03400793          	li	a5,52
     4be:	fef407a3          	sb	a5,-17(s0)

00000000000004c2 <.L27>:
     4c2:	fe842783          	lw	a5,-24(s0)
     4c6:	0007871b          	sext.w	a4,a5
     4ca:	02600793          	li	a5,38
     4ce:	00f71663          	bne	a4,a5,4da <.L28>
     4d2:	03300793          	li	a5,51
     4d6:	fef407a3          	sb	a5,-17(s0)

00000000000004da <.L28>:
     4da:	fe842783          	lw	a5,-24(s0)
     4de:	0007871b          	sext.w	a4,a5
     4e2:	02900793          	li	a5,41
     4e6:	00f71663          	bne	a4,a5,4f2 <.L29>
     4ea:	02000793          	li	a5,32
     4ee:	fef407a3          	sb	a5,-17(s0)

00000000000004f2 <.L29>:
     4f2:	fe842783          	lw	a5,-24(s0)
     4f6:	0007871b          	sext.w	a4,a5
     4fa:	02a00793          	li	a5,42
     4fe:	00f71663          	bne	a4,a5,50a <.L30>
     502:	07600793          	li	a5,118
     506:	fef407a3          	sb	a5,-17(s0)

000000000000050a <.L30>:
     50a:	fe842783          	lw	a5,-24(s0)
     50e:	0007871b          	sext.w	a4,a5
     512:	02b00793          	li	a5,43
     516:	00f71663          	bne	a4,a5,522 <.L31>
     51a:	06600793          	li	a5,102
     51e:	fef407a3          	sb	a5,-17(s0)

0000000000000522 <.L31>:
     522:	fe842783          	lw	a5,-24(s0)
     526:	0007871b          	sext.w	a4,a5
     52a:	02c00793          	li	a5,44
     52e:	00f71663          	bne	a4,a5,53a <.L32>
     532:	07400793          	li	a5,116
     536:	fef407a3          	sb	a5,-17(s0)

000000000000053a <.L32>:
     53a:	fe842783          	lw	a5,-24(s0)
     53e:	0007871b          	sext.w	a4,a5
     542:	02d00793          	li	a5,45
     546:	00f71663          	bne	a4,a5,552 <.L33>
     54a:	07200793          	li	a5,114
     54e:	fef407a3          	sb	a5,-17(s0)

0000000000000552 <.L33>:
     552:	fe842783          	lw	a5,-24(s0)
     556:	0007871b          	sext.w	a4,a5
     55a:	02e00793          	li	a5,46
     55e:	00f71663          	bne	a4,a5,56a <.L34>
     562:	03500793          	li	a5,53
     566:	fef407a3          	sb	a5,-17(s0)

000000000000056a <.L34>:
     56a:	fe842783          	lw	a5,-24(s0)
     56e:	0007871b          	sext.w	a4,a5
     572:	03100793          	li	a5,49
     576:	00f71663          	bne	a4,a5,582 <.L35>
     57a:	06e00793          	li	a5,110
     57e:	fef407a3          	sb	a5,-17(s0)

0000000000000582 <.L35>:
     582:	fe842783          	lw	a5,-24(s0)
     586:	0007871b          	sext.w	a4,a5
     58a:	03200793          	li	a5,50
     58e:	00f71663          	bne	a4,a5,59a <.L36>
     592:	06200793          	li	a5,98
     596:	fef407a3          	sb	a5,-17(s0)

000000000000059a <.L36>:
     59a:	fe842783          	lw	a5,-24(s0)
     59e:	0007871b          	sext.w	a4,a5
     5a2:	03300793          	li	a5,51
     5a6:	00f71663          	bne	a4,a5,5b2 <.L37>
     5aa:	06800793          	li	a5,104
     5ae:	fef407a3          	sb	a5,-17(s0)

00000000000005b2 <.L37>:
     5b2:	fe842783          	lw	a5,-24(s0)
     5b6:	0007871b          	sext.w	a4,a5
     5ba:	03400793          	li	a5,52
     5be:	00f71663          	bne	a4,a5,5ca <.L38>
     5c2:	06700793          	li	a5,103
     5c6:	fef407a3          	sb	a5,-17(s0)

00000000000005ca <.L38>:
     5ca:	fe842783          	lw	a5,-24(s0)
     5ce:	0007871b          	sext.w	a4,a5
     5d2:	03500793          	li	a5,53
     5d6:	00f71663          	bne	a4,a5,5e2 <.L39>
     5da:	07900793          	li	a5,121
     5de:	fef407a3          	sb	a5,-17(s0)

00000000000005e2 <.L39>:
     5e2:	fe842783          	lw	a5,-24(s0)
     5e6:	0007871b          	sext.w	a4,a5
     5ea:	03600793          	li	a5,54
     5ee:	00f71663          	bne	a4,a5,5fa <.L40>
     5f2:	03600793          	li	a5,54
     5f6:	fef407a3          	sb	a5,-17(s0)

00000000000005fa <.L40>:
     5fa:	fe842783          	lw	a5,-24(s0)
     5fe:	0007871b          	sext.w	a4,a5
     602:	03a00793          	li	a5,58
     606:	00f71663          	bne	a4,a5,612 <.L41>
     60a:	06d00793          	li	a5,109
     60e:	fef407a3          	sb	a5,-17(s0)

0000000000000612 <.L41>:
     612:	fe842783          	lw	a5,-24(s0)
     616:	0007871b          	sext.w	a4,a5
     61a:	03b00793          	li	a5,59
     61e:	00f71663          	bne	a4,a5,62a <.L42>
     622:	06a00793          	li	a5,106
     626:	fef407a3          	sb	a5,-17(s0)

000000000000062a <.L42>:
     62a:	fe842783          	lw	a5,-24(s0)
     62e:	0007871b          	sext.w	a4,a5
     632:	03c00793          	li	a5,60
     636:	00f71663          	bne	a4,a5,642 <.L43>
     63a:	07500793          	li	a5,117
     63e:	fef407a3          	sb	a5,-17(s0)

0000000000000642 <.L43>:
     642:	fe842783          	lw	a5,-24(s0)
     646:	0007871b          	sext.w	a4,a5
     64a:	03d00793          	li	a5,61
     64e:	00f71663          	bne	a4,a5,65a <.L44>
     652:	03700793          	li	a5,55
     656:	fef407a3          	sb	a5,-17(s0)

000000000000065a <.L44>:
     65a:	fe842783          	lw	a5,-24(s0)
     65e:	0007871b          	sext.w	a4,a5
     662:	03e00793          	li	a5,62
     666:	00f71663          	bne	a4,a5,672 <.L45>
     66a:	03800793          	li	a5,56
     66e:	fef407a3          	sb	a5,-17(s0)

0000000000000672 <.L45>:
     672:	fe842783          	lw	a5,-24(s0)
     676:	0007871b          	sext.w	a4,a5
     67a:	04100793          	li	a5,65
     67e:	00f71663          	bne	a4,a5,68a <.L46>
     682:	02c00793          	li	a5,44
     686:	fef407a3          	sb	a5,-17(s0)

000000000000068a <.L46>:
     68a:	fe842783          	lw	a5,-24(s0)
     68e:	0007871b          	sext.w	a4,a5
     692:	04200793          	li	a5,66
     696:	00f71663          	bne	a4,a5,6a2 <.L47>
     69a:	06b00793          	li	a5,107
     69e:	fef407a3          	sb	a5,-17(s0)

00000000000006a2 <.L47>:
     6a2:	fe842783          	lw	a5,-24(s0)
     6a6:	0007871b          	sext.w	a4,a5
     6aa:	04300793          	li	a5,67
     6ae:	00f71663          	bne	a4,a5,6ba <.L48>
     6b2:	06900793          	li	a5,105
     6b6:	fef407a3          	sb	a5,-17(s0)

00000000000006ba <.L48>:
     6ba:	fe842783          	lw	a5,-24(s0)
     6be:	0007871b          	sext.w	a4,a5
     6c2:	04400793          	li	a5,68
     6c6:	00f71663          	bne	a4,a5,6d2 <.L49>
     6ca:	06f00793          	li	a5,111
     6ce:	fef407a3          	sb	a5,-17(s0)

00000000000006d2 <.L49>:
     6d2:	fe842783          	lw	a5,-24(s0)
     6d6:	0007871b          	sext.w	a4,a5
     6da:	04500793          	li	a5,69
     6de:	00f71663          	bne	a4,a5,6ea <.L50>
     6e2:	03000793          	li	a5,48
     6e6:	fef407a3          	sb	a5,-17(s0)

00000000000006ea <.L50>:
     6ea:	fe842783          	lw	a5,-24(s0)
     6ee:	0007871b          	sext.w	a4,a5
     6f2:	04600793          	li	a5,70
     6f6:	00f71663          	bne	a4,a5,702 <.L51>
     6fa:	03900793          	li	a5,57
     6fe:	fef407a3          	sb	a5,-17(s0)

0000000000000702 <.L51>:
     702:	fe842783          	lw	a5,-24(s0)
     706:	0007871b          	sext.w	a4,a5
     70a:	04900793          	li	a5,73
     70e:	00f71663          	bne	a4,a5,71a <.L52>
     712:	02e00793          	li	a5,46
     716:	fef407a3          	sb	a5,-17(s0)

000000000000071a <.L52>:
     71a:	fe842783          	lw	a5,-24(s0)
     71e:	0007871b          	sext.w	a4,a5
     722:	04a00793          	li	a5,74
     726:	00f71663          	bne	a4,a5,732 <.L53>
     72a:	02f00793          	li	a5,47
     72e:	fef407a3          	sb	a5,-17(s0)

0000000000000732 <.L53>:
     732:	fe842783          	lw	a5,-24(s0)
     736:	0007871b          	sext.w	a4,a5
     73a:	04b00793          	li	a5,75
     73e:	00f71663          	bne	a4,a5,74a <.L54>
     742:	06c00793          	li	a5,108
     746:	fef407a3          	sb	a5,-17(s0)

000000000000074a <.L54>:
     74a:	fe842783          	lw	a5,-24(s0)
     74e:	0007871b          	sext.w	a4,a5
     752:	04c00793          	li	a5,76
     756:	00f71663          	bne	a4,a5,762 <.L55>
     75a:	03a00793          	li	a5,58
     75e:	fef407a3          	sb	a5,-17(s0)

0000000000000762 <.L55>:
     762:	fe842783          	lw	a5,-24(s0)
     766:	0007871b          	sext.w	a4,a5
     76a:	04d00793          	li	a5,77
     76e:	00f71663          	bne	a4,a5,77a <.L56>
     772:	07100793          	li	a5,113
     776:	fef407a3          	sb	a5,-17(s0)

000000000000077a <.L56>:
     77a:	fe842783          	lw	a5,-24(s0)
     77e:	0007871b          	sext.w	a4,a5
     782:	04e00793          	li	a5,78
     786:	00f71663          	bne	a4,a5,792 <.L57>
     78a:	02d00793          	li	a5,45
     78e:	fef407a3          	sb	a5,-17(s0)

0000000000000792 <.L57>:
     792:	fe842783          	lw	a5,-24(s0)
     796:	0007871b          	sext.w	a4,a5
     79a:	05200793          	li	a5,82
     79e:	00f71663          	bne	a4,a5,7aa <.L58>
     7a2:	02700793          	li	a5,39
     7a6:	fef407a3          	sb	a5,-17(s0)

00000000000007aa <.L58>:
     7aa:	fe842783          	lw	a5,-24(s0)
     7ae:	0007871b          	sext.w	a4,a5
     7b2:	05400793          	li	a5,84
     7b6:	00f71663          	bne	a4,a5,7c2 <.L59>
     7ba:	05b00793          	li	a5,91
     7be:	fef407a3          	sb	a5,-17(s0)

00000000000007c2 <.L59>:
     7c2:	fe842783          	lw	a5,-24(s0)
     7c6:	0007871b          	sext.w	a4,a5
     7ca:	05500793          	li	a5,85
     7ce:	00f71663          	bne	a4,a5,7da <.L60>
     7d2:	03d00793          	li	a5,61
     7d6:	fef407a3          	sb	a5,-17(s0)

00000000000007da <.L60>:
     7da:	fe842783          	lw	a5,-24(s0)
     7de:	0007871b          	sext.w	a4,a5
     7e2:	05b00793          	li	a5,91
     7e6:	00f71663          	bne	a4,a5,7f2 <.L61>
     7ea:	05d00793          	li	a5,93
     7ee:	fef407a3          	sb	a5,-17(s0)

00000000000007f2 <.L61>:
     7f2:	fe842783          	lw	a5,-24(s0)
     7f6:	0007871b          	sext.w	a4,a5
     7fa:	05d00793          	li	a5,93
     7fe:	00f71663          	bne	a4,a5,80a <.L62>
     802:	05c00793          	li	a5,92
     806:	fef407a3          	sb	a5,-17(s0)

000000000000080a <.L62>:
     80a:	fe842783          	lw	a5,-24(s0)
     80e:	0007871b          	sext.w	a4,a5
     812:	06600793          	li	a5,102
     816:	00f71563          	bne	a4,a5,820 <.L63>
     81a:	47a1                	li	a5,8
     81c:	fef407a3          	sb	a5,-17(s0)

0000000000000820 <.L63>:
     820:	fe842783          	lw	a5,-24(s0)
     824:	0007871b          	sext.w	a4,a5
     828:	06900793          	li	a5,105
     82c:	00f71663          	bne	a4,a5,838 <.L64>
     830:	03100793          	li	a5,49
     834:	fef407a3          	sb	a5,-17(s0)

0000000000000838 <.L64>:
     838:	fe842783          	lw	a5,-24(s0)
     83c:	0007871b          	sext.w	a4,a5
     840:	06c00793          	li	a5,108
     844:	00f71663          	bne	a4,a5,850 <.L65>
     848:	03700793          	li	a5,55
     84c:	fef407a3          	sb	a5,-17(s0)

0000000000000850 <.L65>:
     850:	fe842783          	lw	a5,-24(s0)
     854:	0007871b          	sext.w	a4,a5
     858:	07000793          	li	a5,112
     85c:	00f71663          	bne	a4,a5,868 <.L66>
     860:	03000793          	li	a5,48
     864:	fef407a3          	sb	a5,-17(s0)

0000000000000868 <.L66>:
     868:	fe842783          	lw	a5,-24(s0)
     86c:	0007871b          	sext.w	a4,a5
     870:	07100793          	li	a5,113
     874:	00f71663          	bne	a4,a5,880 <.L67>
     878:	02e00793          	li	a5,46
     87c:	fef407a3          	sb	a5,-17(s0)

0000000000000880 <.L67>:
     880:	fe842783          	lw	a5,-24(s0)
     884:	0007871b          	sext.w	a4,a5
     888:	07300793          	li	a5,115
     88c:	00f71663          	bne	a4,a5,898 <.L68>
     890:	03500793          	li	a5,53
     894:	fef407a3          	sb	a5,-17(s0)

0000000000000898 <.L68>:
     898:	fe842783          	lw	a5,-24(s0)
     89c:	0007871b          	sext.w	a4,a5
     8a0:	07900793          	li	a5,121
     8a4:	00f71663          	bne	a4,a5,8b0 <.L69>
     8a8:	02b00793          	li	a5,43
     8ac:	fef407a3          	sb	a5,-17(s0)

00000000000008b0 <.L69>:
     8b0:	fe842783          	lw	a5,-24(s0)
     8b4:	0007871b          	sext.w	a4,a5
     8b8:	07a00793          	li	a5,122
     8bc:	00f71663          	bne	a4,a5,8c8 <.L70>
     8c0:	03300793          	li	a5,51
     8c4:	fef407a3          	sb	a5,-17(s0)

00000000000008c8 <.L70>:
     8c8:	fe842783          	lw	a5,-24(s0)
     8cc:	0007871b          	sext.w	a4,a5
     8d0:	07b00793          	li	a5,123
     8d4:	00f71663          	bne	a4,a5,8e0 <.L71>
     8d8:	02c00793          	li	a5,44
     8dc:	fef407a3          	sb	a5,-17(s0)

00000000000008e0 <.L71>:
     8e0:	fe842783          	lw	a5,-24(s0)
     8e4:	0007871b          	sext.w	a4,a5
     8e8:	07c00793          	li	a5,124
     8ec:	00f71663          	bne	a4,a5,8f8 <.L72>
     8f0:	02a00793          	li	a5,42
     8f4:	fef407a3          	sb	a5,-17(s0)

00000000000008f8 <.L72>:
     8f8:	fe842783          	lw	a5,-24(s0)
     8fc:	0007871b          	sext.w	a4,a5
     900:	07d00793          	li	a5,125
     904:	00f71663          	bne	a4,a5,910 <.L6>
     908:	03900793          	li	a5,57
     90c:	fef407a3          	sb	a5,-17(s0)

0000000000000910 <.L6>:
     910:	500017b7          	lui	a5,0x50001
     914:	80978793          	add	a5,a5,-2039 # 50000809 <.L14+0x4ffff3b5>
     918:	0786                	sll	a5,a5,0x1
     91a:	0007c783          	lbu	a5,0(a5)
     91e:	eb91                	bnez	a5,932 <.L73>
     920:	00000797          	auipc	a5,0x0
     924:	00078793          	mv	a5,a5
     928:	639c                	ld	a5,0(a5)
     92a:	0007c783          	lbu	a5,0(a5) # 920 <.L6+0x10>
     92e:	24078863          	beqz	a5,b7e <.L74>

0000000000000932 <.L73>:
     932:	fef44783          	lbu	a5,-17(s0)
     936:	0ff7f713          	zext.b	a4,a5
     93a:	06000793          	li	a5,96
     93e:	02e7f063          	bgeu	a5,a4,95e <.L75>
     942:	fef44783          	lbu	a5,-17(s0)
     946:	0ff7f713          	zext.b	a4,a5
     94a:	07a00793          	li	a5,122
     94e:	00e7e863          	bltu	a5,a4,95e <.L75>
     952:	fef44783          	lbu	a5,-17(s0)
     956:	3781                	addw	a5,a5,-32
     958:	fef407a3          	sb	a5,-17(s0)
     95c:	a40d                	j	b7e <.L74>

000000000000095e <.L75>:
     95e:	fef44783          	lbu	a5,-17(s0)
     962:	0ff7f713          	zext.b	a4,a5
     966:	03100793          	li	a5,49
     96a:	00f71763          	bne	a4,a5,978 <.L76>
     96e:	02100793          	li	a5,33
     972:	fef407a3          	sb	a5,-17(s0)
     976:	a421                	j	b7e <.L74>

0000000000000978 <.L76>:
     978:	fef44783          	lbu	a5,-17(s0)
     97c:	0ff7f713          	zext.b	a4,a5
     980:	03200793          	li	a5,50
     984:	00f71763          	bne	a4,a5,992 <.L77>
     988:	04000793          	li	a5,64
     98c:	fef407a3          	sb	a5,-17(s0)
     990:	a2fd                	j	b7e <.L74>

0000000000000992 <.L77>:
     992:	fef44783          	lbu	a5,-17(s0)
     996:	0ff7f713          	zext.b	a4,a5
     99a:	03300793          	li	a5,51
     99e:	00f71763          	bne	a4,a5,9ac <.L78>
     9a2:	02300793          	li	a5,35
     9a6:	fef407a3          	sb	a5,-17(s0)
     9aa:	aad1                	j	b7e <.L74>

00000000000009ac <.L78>:
     9ac:	fef44783          	lbu	a5,-17(s0)
     9b0:	0ff7f713          	zext.b	a4,a5
     9b4:	03400793          	li	a5,52
     9b8:	00f71763          	bne	a4,a5,9c6 <.L79>
     9bc:	02400793          	li	a5,36
     9c0:	fef407a3          	sb	a5,-17(s0)
     9c4:	aa6d                	j	b7e <.L74>

00000000000009c6 <.L79>:
     9c6:	fef44783          	lbu	a5,-17(s0)
     9ca:	0ff7f713          	zext.b	a4,a5
     9ce:	03500793          	li	a5,53
     9d2:	00f71763          	bne	a4,a5,9e0 <.L80>
     9d6:	02500793          	li	a5,37
     9da:	fef407a3          	sb	a5,-17(s0)
     9de:	a245                	j	b7e <.L74>

00000000000009e0 <.L80>:
     9e0:	fef44783          	lbu	a5,-17(s0)
     9e4:	0ff7f713          	zext.b	a4,a5
     9e8:	03600793          	li	a5,54
     9ec:	00f71763          	bne	a4,a5,9fa <.L81>
     9f0:	05e00793          	li	a5,94
     9f4:	fef407a3          	sb	a5,-17(s0)
     9f8:	a259                	j	b7e <.L74>

00000000000009fa <.L81>:
     9fa:	fef44783          	lbu	a5,-17(s0)
     9fe:	0ff7f713          	zext.b	a4,a5
     a02:	03700793          	li	a5,55
     a06:	00f71763          	bne	a4,a5,a14 <.L82>
     a0a:	02600793          	li	a5,38
     a0e:	fef407a3          	sb	a5,-17(s0)
     a12:	a2b5                	j	b7e <.L74>

0000000000000a14 <.L82>:
     a14:	fef44783          	lbu	a5,-17(s0)
     a18:	0ff7f713          	zext.b	a4,a5
     a1c:	03800793          	li	a5,56
     a20:	00f71763          	bne	a4,a5,a2e <.L83>
     a24:	02a00793          	li	a5,42
     a28:	fef407a3          	sb	a5,-17(s0)
     a2c:	aa89                	j	b7e <.L74>

0000000000000a2e <.L83>:
     a2e:	fef44783          	lbu	a5,-17(s0)
     a32:	0ff7f713          	zext.b	a4,a5
     a36:	03900793          	li	a5,57
     a3a:	00f71763          	bne	a4,a5,a48 <.L84>
     a3e:	02800793          	li	a5,40
     a42:	fef407a3          	sb	a5,-17(s0)
     a46:	aa25                	j	b7e <.L74>

0000000000000a48 <.L84>:
     a48:	fef44783          	lbu	a5,-17(s0)
     a4c:	0ff7f713          	zext.b	a4,a5
     a50:	03000793          	li	a5,48
     a54:	00f71763          	bne	a4,a5,a62 <.L85>
     a58:	02900793          	li	a5,41
     a5c:	fef407a3          	sb	a5,-17(s0)
     a60:	aa39                	j	b7e <.L74>

0000000000000a62 <.L85>:
     a62:	fef44783          	lbu	a5,-17(s0)
     a66:	0ff7f713          	zext.b	a4,a5
     a6a:	05b00793          	li	a5,91
     a6e:	00f71763          	bne	a4,a5,a7c <.L86>
     a72:	07b00793          	li	a5,123
     a76:	fef407a3          	sb	a5,-17(s0)
     a7a:	a211                	j	b7e <.L74>

0000000000000a7c <.L86>:
     a7c:	fef44783          	lbu	a5,-17(s0)
     a80:	0ff7f713          	zext.b	a4,a5
     a84:	05d00793          	li	a5,93
     a88:	00f71763          	bne	a4,a5,a96 <.L87>
     a8c:	07d00793          	li	a5,125
     a90:	fef407a3          	sb	a5,-17(s0)
     a94:	a0ed                	j	b7e <.L74>

0000000000000a96 <.L87>:
     a96:	fef44783          	lbu	a5,-17(s0)
     a9a:	0ff7f713          	zext.b	a4,a5
     a9e:	02c00793          	li	a5,44
     aa2:	00f71763          	bne	a4,a5,ab0 <.L88>
     aa6:	03c00793          	li	a5,60
     aaa:	fef407a3          	sb	a5,-17(s0)
     aae:	a8c1                	j	b7e <.L74>

0000000000000ab0 <.L88>:
     ab0:	fef44783          	lbu	a5,-17(s0)
     ab4:	0ff7f713          	zext.b	a4,a5
     ab8:	02e00793          	li	a5,46
     abc:	00f71763          	bne	a4,a5,aca <.L89>
     ac0:	03e00793          	li	a5,62
     ac4:	fef407a3          	sb	a5,-17(s0)
     ac8:	a85d                	j	b7e <.L74>

0000000000000aca <.L89>:
     aca:	fef44783          	lbu	a5,-17(s0)
     ace:	0ff7f713          	zext.b	a4,a5
     ad2:	02f00793          	li	a5,47
     ad6:	00f71763          	bne	a4,a5,ae4 <.L90>
     ada:	03f00793          	li	a5,63
     ade:	fef407a3          	sb	a5,-17(s0)
     ae2:	a871                	j	b7e <.L74>

0000000000000ae4 <.L90>:
     ae4:	fef44783          	lbu	a5,-17(s0)
     ae8:	0ff7f713          	zext.b	a4,a5
     aec:	03b00793          	li	a5,59
     af0:	00f71763          	bne	a4,a5,afe <.L91>
     af4:	03a00793          	li	a5,58
     af8:	fef407a3          	sb	a5,-17(s0)
     afc:	a049                	j	b7e <.L74>

0000000000000afe <.L91>:
     afe:	fef44783          	lbu	a5,-17(s0)
     b02:	0ff7f713          	zext.b	a4,a5
     b06:	03d00793          	li	a5,61
     b0a:	00f71763          	bne	a4,a5,b18 <.L92>
     b0e:	02b00793          	li	a5,43
     b12:	fef407a3          	sb	a5,-17(s0)
     b16:	a0a5                	j	b7e <.L74>

0000000000000b18 <.L92>:
     b18:	fef44783          	lbu	a5,-17(s0)
     b1c:	0ff7f713          	zext.b	a4,a5
     b20:	02d00793          	li	a5,45
     b24:	00f71763          	bne	a4,a5,b32 <.L93>
     b28:	05f00793          	li	a5,95
     b2c:	fef407a3          	sb	a5,-17(s0)
     b30:	a0b9                	j	b7e <.L74>

0000000000000b32 <.L93>:
     b32:	fef44783          	lbu	a5,-17(s0)
     b36:	0ff7f713          	zext.b	a4,a5
     b3a:	06000793          	li	a5,96
     b3e:	00f71763          	bne	a4,a5,b4c <.L94>
     b42:	07e00793          	li	a5,126
     b46:	fef407a3          	sb	a5,-17(s0)
     b4a:	a815                	j	b7e <.L74>

0000000000000b4c <.L94>:
     b4c:	fef44783          	lbu	a5,-17(s0)
     b50:	0ff7f713          	zext.b	a4,a5
     b54:	05c00793          	li	a5,92
     b58:	00f71763          	bne	a4,a5,b66 <.L95>
     b5c:	07c00793          	li	a5,124
     b60:	fef407a3          	sb	a5,-17(s0)
     b64:	a829                	j	b7e <.L74>

0000000000000b66 <.L95>:
     b66:	fef44783          	lbu	a5,-17(s0)
     b6a:	0ff7f713          	zext.b	a4,a5
     b6e:	02700793          	li	a5,39
     b72:	00f71663          	bne	a4,a5,b7e <.L74>
     b76:	02200793          	li	a5,34
     b7a:	fef407a3          	sb	a5,-17(s0)

0000000000000b7e <.L74>:
     b7e:	fef44783          	lbu	a5,-17(s0)
     b82:	853e                	mv	a0,a5
     b84:	7422                	ld	s0,40(sp)
     b86:	6145                	add	sp,sp,48
     b88:	8082                	ret

0000000000000b8a <main>:
     b8a:	1101                	add	sp,sp,-32
     b8c:	ec06                	sd	ra,24(sp)
     b8e:	e822                	sd	s0,16(sp)
     b90:	1000                	add	s0,sp,32
     b92:	00000797          	auipc	a5,0x0
     b96:	0007b783          	ld	a5,0(a5) # b92 <main+0x8>
     b9a:	04800713          	li	a4,72
     b9e:	00e78023          	sb	a4,0(a5)
     ba2:	00000797          	auipc	a5,0x0
     ba6:	0007b783          	ld	a5,0(a5) # ba2 <main+0x18>
     baa:	06500713          	li	a4,101
     bae:	00e780a3          	sb	a4,1(a5)
     bb2:	00000797          	auipc	a5,0x0
     bb6:	0007b783          	ld	a5,0(a5) # bb2 <main+0x28>
     bba:	06c00713          	li	a4,108
     bbe:	00e78123          	sb	a4,2(a5)
     bc2:	00000797          	auipc	a5,0x0
     bc6:	0007b783          	ld	a5,0(a5) # bc2 <main+0x38>
     bca:	06c00713          	li	a4,108
     bce:	00e781a3          	sb	a4,3(a5)
     bd2:	00000797          	auipc	a5,0x0
     bd6:	0007b783          	ld	a5,0(a5) # bd2 <main+0x48>
     bda:	06f00713          	li	a4,111
     bde:	00e78223          	sb	a4,4(a5)
     be2:	00000797          	auipc	a5,0x0
     be6:	0007b783          	ld	a5,0(a5) # be2 <main+0x58>
     bea:	02000713          	li	a4,32
     bee:	00e782a3          	sb	a4,5(a5)
     bf2:	00000797          	auipc	a5,0x0
     bf6:	0007b783          	ld	a5,0(a5) # bf2 <main+0x68>
     bfa:	05700713          	li	a4,87
     bfe:	00e78323          	sb	a4,6(a5)
     c02:	00000797          	auipc	a5,0x0
     c06:	0007b783          	ld	a5,0(a5) # c02 <main+0x78>
     c0a:	06f00713          	li	a4,111
     c0e:	00e783a3          	sb	a4,7(a5)
     c12:	00000797          	auipc	a5,0x0
     c16:	0007b783          	ld	a5,0(a5) # c12 <main+0x88>
     c1a:	07200713          	li	a4,114
     c1e:	00e78423          	sb	a4,8(a5)
     c22:	00000797          	auipc	a5,0x0
     c26:	0007b783          	ld	a5,0(a5) # c22 <main+0x98>
     c2a:	06c00713          	li	a4,108
     c2e:	00e784a3          	sb	a4,9(a5)
     c32:	00000797          	auipc	a5,0x0
     c36:	0007b783          	ld	a5,0(a5) # c32 <main+0xa8>
     c3a:	06400713          	li	a4,100
     c3e:	00e78523          	sb	a4,10(a5)
     c42:	00000797          	auipc	a5,0x0
     c46:	0007b783          	ld	a5,0(a5) # c42 <main+0xb8>
     c4a:	4729                	li	a4,10
     c4c:	00e785a3          	sb	a4,11(a5)
     c50:	00000797          	auipc	a5,0x0
     c54:	0007b783          	ld	a5,0(a5) # c50 <main+0xc6>
     c58:	00078623          	sb	zero,12(a5)
     c5c:	00000797          	auipc	a5,0x0
     c60:	0007b783          	ld	a5,0(a5) # c5c <main+0xd2>
     c64:	fef43423          	sd	a5,-24(s0)
     c68:	a01d                	j	c8e <.L2>

0000000000000c6a <.L3>:
     c6a:	fe843783          	ld	a5,-24(s0)
     c6e:	0007c783          	lbu	a5,0(a5)
     c72:	85be                	mv	a1,a5
     c74:	00000517          	auipc	a0,0x0
     c78:	00053503          	ld	a0,0(a0) # c74 <.L3+0xa>
     c7c:	00000097          	auipc	ra,0x0
     c80:	000080e7          	jalr	ra # c7c <.L3+0x12>
     c84:	fe843783          	ld	a5,-24(s0)
     c88:	0785                	add	a5,a5,1
     c8a:	fef43423          	sd	a5,-24(s0)

0000000000000c8e <.L2>:
     c8e:	fe843783          	ld	a5,-24(s0)
     c92:	0007c783          	lbu	a5,0(a5)
     c96:	fbf1                	bnez	a5,c6a <.L3>
     c98:	4781                	li	a5,0
     c9a:	853e                	mv	a0,a5
     c9c:	60e2                	ld	ra,24(sp)
     c9e:	6442                	ld	s0,16(sp)
     ca0:	6105                	add	sp,sp,32
     ca2:	8082                	ret

0000000000000ca4 <print_int>:
     ca4:	7179                	add	sp,sp,-48
     ca6:	f406                	sd	ra,40(sp)
     ca8:	f022                	sd	s0,32(sp)
     caa:	1800                	add	s0,sp,48
     cac:	87aa                	mv	a5,a0
     cae:	fcb43823          	sd	a1,-48(s0)
     cb2:	fcf42e23          	sw	a5,-36(s0)
     cb6:	fdc42783          	lw	a5,-36(s0)
     cba:	2781                	sext.w	a5,a5
     cbc:	c3ad                	beqz	a5,d1e <.L2>
     cbe:	fdc42783          	lw	a5,-36(s0)
     cc2:	45a9                	li	a1,10
     cc4:	853e                	mv	a0,a5
     cc6:	00000097          	auipc	ra,0x0
     cca:	000080e7          	jalr	ra # cc6 <print_int+0x22>
     cce:	87aa                	mv	a5,a0
     cd0:	2781                	sext.w	a5,a5
     cd2:	fd043583          	ld	a1,-48(s0)
     cd6:	853e                	mv	a0,a5
     cd8:	00000097          	auipc	ra,0x0
     cdc:	000080e7          	jalr	ra # cd8 <print_int+0x34>
     ce0:	87aa                	mv	a5,a0
     ce2:	fef42623          	sw	a5,-20(s0)
     ce6:	fdc42783          	lw	a5,-36(s0)
     cea:	45a9                	li	a1,10
     cec:	853e                	mv	a0,a5
     cee:	00000097          	auipc	ra,0x0
     cf2:	000080e7          	jalr	ra # cee <print_int+0x4a>
     cf6:	87aa                	mv	a5,a0
     cf8:	2781                	sext.w	a5,a5
     cfa:	0ff7f793          	zext.b	a5,a5
     cfe:	0307879b          	addw	a5,a5,48
     d02:	0ff7f793          	zext.b	a5,a5
     d06:	85be                	mv	a1,a5
     d08:	fd043503          	ld	a0,-48(s0)
     d0c:	00000097          	auipc	ra,0x0
     d10:	000080e7          	jalr	ra # d0c <print_int+0x68>
     d14:	fec42783          	lw	a5,-20(s0)
     d18:	2785                	addw	a5,a5,1
     d1a:	2781                	sext.w	a5,a5
     d1c:	a011                	j	d20 <.L4>

0000000000000d1e <.L2>:
     d1e:	4781                	li	a5,0

0000000000000d20 <.L4>:
     d20:	853e                	mv	a0,a5
     d22:	70a2                	ld	ra,40(sp)
     d24:	7402                	ld	s0,32(sp)
     d26:	6145                	add	sp,sp,48
     d28:	8082                	ret

0000000000000d2a <backspace>:
     d2a:	7179                	add	sp,sp,-48
     d2c:	f422                	sd	s0,40(sp)
     d2e:	1800                	add	s0,sp,48
     d30:	fca43c23          	sd	a0,-40(s0)
     d34:	fd843783          	ld	a5,-40(s0)
     d38:	479c                	lw	a5,8(a5)
     d3a:	c3d9                	beqz	a5,dc0 <.L11>
     d3c:	fd843783          	ld	a5,-40(s0)
     d40:	479c                	lw	a5,8(a5)
     d42:	37fd                	addw	a5,a5,-1
     d44:	fef42623          	sw	a5,-20(s0)
     d48:	a03d                	j	d76 <.L8>

0000000000000d4a <.L10>:
     d4a:	fd843783          	ld	a5,-40(s0)
     d4e:	6398                	ld	a4,0(a5)
     d50:	fec42783          	lw	a5,-20(s0)
     d54:	0785                	add	a5,a5,1
     d56:	973e                	add	a4,a4,a5
     d58:	fd843783          	ld	a5,-40(s0)
     d5c:	6394                	ld	a3,0(a5)
     d5e:	fec42783          	lw	a5,-20(s0)
     d62:	97b6                	add	a5,a5,a3
     d64:	00074703          	lbu	a4,0(a4)
     d68:	00e78023          	sb	a4,0(a5)
     d6c:	fec42783          	lw	a5,-20(s0)
     d70:	2785                	addw	a5,a5,1
     d72:	fef42623          	sw	a5,-20(s0)

0000000000000d76 <.L8>:
     d76:	fd843783          	ld	a5,-40(s0)
     d7a:	6398                	ld	a4,0(a5)
     d7c:	fec42783          	lw	a5,-20(s0)
     d80:	97ba                	add	a5,a5,a4
     d82:	0007c783          	lbu	a5,0(a5)
     d86:	cf81                	beqz	a5,d9e <.L9>
     d88:	fd843783          	ld	a5,-40(s0)
     d8c:	4f9c                	lw	a5,24(a5)
     d8e:	37fd                	addw	a5,a5,-1
     d90:	0007871b          	sext.w	a4,a5
     d94:	fec42783          	lw	a5,-20(s0)
     d98:	2781                	sext.w	a5,a5
     d9a:	fae7c8e3          	blt	a5,a4,d4a <.L10>

0000000000000d9e <.L9>:
     d9e:	fd843783          	ld	a5,-40(s0)
     da2:	479c                	lw	a5,8(a5)
     da4:	37fd                	addw	a5,a5,-1
     da6:	0007871b          	sext.w	a4,a5
     daa:	fd843783          	ld	a5,-40(s0)
     dae:	c798                	sw	a4,8(a5)
     db0:	fd843783          	ld	a5,-40(s0)
     db4:	6b9c                	ld	a5,16(a5)
     db6:	fd843703          	ld	a4,-40(s0)
     dba:	4718                	lw	a4,8(a4)
     dbc:	c398                	sw	a4,0(a5)
     dbe:	a011                	j	dc2 <.L5>

0000000000000dc0 <.L11>:
     dc0:	0001                	nop

0000000000000dc2 <.L5>:
     dc2:	7422                	ld	s0,40(sp)
     dc4:	6145                	add	sp,sp,48
     dc6:	8082                	ret

0000000000000dc8 <console_putc_at>:
     dc8:	1101                	add	sp,sp,-32
     dca:	ec22                	sd	s0,24(sp)
     dcc:	1000                	add	s0,sp,32
     dce:	fea43423          	sd	a0,-24(s0)
     dd2:	87ae                	mv	a5,a1
     dd4:	8732                	mv	a4,a2
     dd6:	fef403a3          	sb	a5,-25(s0)
     dda:	87ba                	mv	a5,a4
     ddc:	fef42023          	sw	a5,-32(s0)
     de0:	fe843783          	ld	a5,-24(s0)
     de4:	4f98                	lw	a4,24(a5)
     de6:	fe042783          	lw	a5,-32(s0)
     dea:	2781                	sext.w	a5,a5
     dec:	00e7dc63          	bge	a5,a4,e04 <.L14>
     df0:	fe843783          	ld	a5,-24(s0)
     df4:	6398                	ld	a4,0(a5)
     df6:	fe042783          	lw	a5,-32(s0)
     dfa:	97ba                	add	a5,a5,a4
     dfc:	fe744703          	lbu	a4,-25(s0)
     e00:	00e78023          	sb	a4,0(a5)

0000000000000e04 <.L14>:
     e04:	0001                	nop
     e06:	6462                	ld	s0,24(sp)
     e08:	6105                	add	sp,sp,32
     e0a:	8082                	ret

0000000000000e0c <console_insert_char>:
     e0c:	715d                	add	sp,sp,-80
     e0e:	e486                	sd	ra,72(sp)
     e10:	e0a2                	sd	s0,64(sp)
     e12:	0880                	add	s0,sp,80
     e14:	faa43c23          	sd	a0,-72(s0)
     e18:	87ae                	mv	a5,a1
     e1a:	faf40ba3          	sb	a5,-73(s0)
     e1e:	fb744783          	lbu	a5,-73(s0)
     e22:	0ff7f713          	zext.b	a4,a5
     e26:	47a9                	li	a5,10
     e28:	02f71763          	bne	a4,a5,e56 <.L16>
     e2c:	fb843783          	ld	a5,-72(s0)
     e30:	fef43023          	sd	a5,-32(s0)
     e34:	fb744783          	lbu	a5,-73(s0)
     e38:	fcf40fa3          	sb	a5,-33(s0)
     e3c:	fe043783          	ld	a5,-32(s0)
     e40:	639c                	ld	a5,0(a5)
     e42:	fe043703          	ld	a4,-32(s0)
     e46:	4718                	lw	a4,8(a4)
     e48:	97ba                	add	a5,a5,a4
     e4a:	fdf44703          	lbu	a4,-33(s0)
     e4e:	00e78023          	sb	a4,0(a5)
     e52:	0001                	nop
     e54:	a0cd                	j	f36 <.L15>

0000000000000e56 <.L16>:
     e56:	fb843783          	ld	a5,-72(s0)
     e5a:	4798                	lw	a4,8(a5)
     e5c:	fb843783          	ld	a5,-72(s0)
     e60:	4f9c                	lw	a5,24(a5)
     e62:	0cf75a63          	bge	a4,a5,f36 <.L15>
     e66:	fb843783          	ld	a5,-72(s0)
     e6a:	479c                	lw	a5,8(a5)
     e6c:	fef42623          	sw	a5,-20(s0)
     e70:	a031                	j	e7c <.L18>

0000000000000e72 <.L20>:
     e72:	fec42783          	lw	a5,-20(s0)
     e76:	2785                	addw	a5,a5,1
     e78:	fef42623          	sw	a5,-20(s0)

0000000000000e7c <.L18>:
     e7c:	fb843783          	ld	a5,-72(s0)
     e80:	4f98                	lw	a4,24(a5)
     e82:	fec42783          	lw	a5,-20(s0)
     e86:	2781                	sext.w	a5,a5
     e88:	00e7db63          	bge	a5,a4,e9e <.L19>
     e8c:	fb843783          	ld	a5,-72(s0)
     e90:	6398                	ld	a4,0(a5)
     e92:	fec42783          	lw	a5,-20(s0)
     e96:	97ba                	add	a5,a5,a4
     e98:	0007c783          	lbu	a5,0(a5)
     e9c:	fbf9                	bnez	a5,e72 <.L20>

0000000000000e9e <.L19>:
     e9e:	fb843783          	ld	a5,-72(s0)
     ea2:	4f98                	lw	a4,24(a5)
     ea4:	fec42783          	lw	a5,-20(s0)
     ea8:	2781                	sext.w	a5,a5
     eaa:	04e79a63          	bne	a5,a4,efe <.L22>
     eae:	fec42783          	lw	a5,-20(s0)
     eb2:	37fd                	addw	a5,a5,-1
     eb4:	fef42623          	sw	a5,-20(s0)
     eb8:	a099                	j	efe <.L22>

0000000000000eba <.L25>:
     eba:	fb843783          	ld	a5,-72(s0)
     ebe:	4f98                	lw	a4,24(a5)
     ec0:	fec42783          	lw	a5,-20(s0)
     ec4:	2781                	sext.w	a5,a5
     ec6:	00f74c63          	blt	a4,a5,ede <.L23>
     eca:	fb843783          	ld	a5,-72(s0)
     ece:	6398                	ld	a4,0(a5)
     ed0:	fec42783          	lw	a5,-20(s0)
     ed4:	17fd                	add	a5,a5,-1
     ed6:	97ba                	add	a5,a5,a4
     ed8:	0007c783          	lbu	a5,0(a5)
     edc:	a011                	j	ee0 <.L24>

0000000000000ede <.L23>:
     ede:	4781                	li	a5,0

0000000000000ee0 <.L24>:
     ee0:	fec42703          	lw	a4,-20(s0)
     ee4:	863a                	mv	a2,a4
     ee6:	85be                	mv	a1,a5
     ee8:	fb843503          	ld	a0,-72(s0)
     eec:	00000097          	auipc	ra,0x0
     ef0:	000080e7          	jalr	ra # eec <.L24+0xc>
     ef4:	fec42783          	lw	a5,-20(s0)
     ef8:	37fd                	addw	a5,a5,-1
     efa:	fef42623          	sw	a5,-20(s0)

0000000000000efe <.L22>:
     efe:	fb843783          	ld	a5,-72(s0)
     f02:	4798                	lw	a4,8(a5)
     f04:	fec42783          	lw	a5,-20(s0)
     f08:	2781                	sext.w	a5,a5
     f0a:	faf748e3          	blt	a4,a5,eba <.L25>
     f0e:	fb843783          	ld	a5,-72(s0)
     f12:	fcf43823          	sd	a5,-48(s0)
     f16:	fb744783          	lbu	a5,-73(s0)
     f1a:	fcf407a3          	sb	a5,-49(s0)
     f1e:	fd043783          	ld	a5,-48(s0)
     f22:	639c                	ld	a5,0(a5)
     f24:	fd043703          	ld	a4,-48(s0)
     f28:	4718                	lw	a4,8(a4)
     f2a:	97ba                	add	a5,a5,a4
     f2c:	fcf44703          	lbu	a4,-49(s0)
     f30:	00e78023          	sb	a4,0(a5)
     f34:	0001                	nop

0000000000000f36 <.L15>:
     f36:	60a6                	ld	ra,72(sp)
     f38:	6406                	ld	s0,64(sp)
     f3a:	6161                	add	sp,sp,80
     f3c:	8082                	ret

0000000000000f3e <console_rollUp>:
     f3e:	7179                	add	sp,sp,-48
     f40:	f406                	sd	ra,40(sp)
     f42:	f022                	sd	s0,32(sp)
     f44:	1800                	add	s0,sp,48
     f46:	fca43c23          	sd	a0,-40(s0)
     f4a:	fe042423          	sw	zero,-24(s0)
     f4e:	fe042623          	sw	zero,-20(s0)
     f52:	a8a1                	j	faa <.L27>

0000000000000f54 <.L30>:
     f54:	fd843783          	ld	a5,-40(s0)
     f58:	4fdc                	lw	a5,28(a5)
     f5a:	fec42703          	lw	a4,-20(s0)
     f5e:	9fb9                	addw	a5,a5,a4
     f60:	0007871b          	sext.w	a4,a5
     f64:	fd843783          	ld	a5,-40(s0)
     f68:	4f9c                	lw	a5,24(a5)
     f6a:	02f75063          	bge	a4,a5,f8a <.L28>
     f6e:	fd843783          	ld	a5,-40(s0)
     f72:	639c                	ld	a5,0(a5)
     f74:	fd843703          	ld	a4,-40(s0)
     f78:	4f58                	lw	a4,28(a4)
     f7a:	fec42683          	lw	a3,-20(s0)
     f7e:	9f35                	addw	a4,a4,a3
     f80:	2701                	sext.w	a4,a4
     f82:	97ba                	add	a5,a5,a4
     f84:	0007c783          	lbu	a5,0(a5)
     f88:	a011                	j	f8c <.L29>

0000000000000f8a <.L28>:
     f8a:	4781                	li	a5,0

0000000000000f8c <.L29>:
     f8c:	fec42703          	lw	a4,-20(s0)
     f90:	863a                	mv	a2,a4
     f92:	85be                	mv	a1,a5
     f94:	fd843503          	ld	a0,-40(s0)
     f98:	00000097          	auipc	ra,0x0
     f9c:	000080e7          	jalr	ra # f98 <.L29+0xc>
     fa0:	fec42783          	lw	a5,-20(s0)
     fa4:	2785                	addw	a5,a5,1
     fa6:	fef42623          	sw	a5,-20(s0)

0000000000000faa <.L27>:
     faa:	fd843783          	ld	a5,-40(s0)
     fae:	4f98                	lw	a4,24(a5)
     fb0:	fec42783          	lw	a5,-20(s0)
     fb4:	2781                	sext.w	a5,a5
     fb6:	f8e7cfe3          	blt	a5,a4,f54 <.L30>
     fba:	fd843783          	ld	a5,-40(s0)
     fbe:	4798                	lw	a4,8(a5)
     fc0:	fd843783          	ld	a5,-40(s0)
     fc4:	4fdc                	lw	a5,28(a5)
     fc6:	40f707bb          	subw	a5,a4,a5
     fca:	0007871b          	sext.w	a4,a5
     fce:	fd843783          	ld	a5,-40(s0)
     fd2:	c798                	sw	a4,8(a5)
     fd4:	fd843783          	ld	a5,-40(s0)
     fd8:	6b9c                	ld	a5,16(a5)
     fda:	fd843703          	ld	a4,-40(s0)
     fde:	4718                	lw	a4,8(a4)
     fe0:	c398                	sw	a4,0(a5)
     fe2:	0001                	nop
     fe4:	70a2                	ld	ra,40(sp)
     fe6:	7402                	ld	s0,32(sp)
     fe8:	6145                	add	sp,sp,48
     fea:	8082                	ret

0000000000000fec <console_autorollUp>:
     fec:	1101                	add	sp,sp,-32
     fee:	ec06                	sd	ra,24(sp)
     ff0:	e822                	sd	s0,16(sp)
     ff2:	1000                	add	s0,sp,32
     ff4:	fea43423          	sd	a0,-24(s0)
     ff8:	fe843783          	ld	a5,-24(s0)
     ffc:	4794                	lw	a3,8(a5)
     ffe:	fe843783          	ld	a5,-24(s0)
    1002:	4f98                	lw	a4,24(a5)
    1004:	fe843783          	ld	a5,-24(s0)
    1008:	4fdc                	lw	a5,28(a5)
    100a:	40f707bb          	subw	a5,a4,a5
    100e:	2781                	sext.w	a5,a5
    1010:	8736                	mv	a4,a3
    1012:	00f74863          	blt	a4,a5,1022 <.L33>
    1016:	fe843503          	ld	a0,-24(s0)
    101a:	00000097          	auipc	ra,0x0
    101e:	000080e7          	jalr	ra # 101a <console_autorollUp+0x2e>

0000000000001022 <.L33>:
    1022:	0001                	nop
    1024:	60e2                	ld	ra,24(sp)
    1026:	6442                	ld	s0,16(sp)
    1028:	6105                	add	sp,sp,32
    102a:	8082                	ret

000000000000102c <ngetline>:
    102c:	711d                	add	sp,sp,-96
    102e:	ec86                	sd	ra,88(sp)
    1030:	e8a2                	sd	s0,80(sp)
    1032:	1080                	add	s0,sp,96
    1034:	faa43c23          	sd	a0,-72(s0)
    1038:	87ae                	mv	a5,a1
    103a:	fac43423          	sd	a2,-88(s0)
    103e:	fad43023          	sd	a3,-96(s0)
    1042:	faf42a23          	sw	a5,-76(s0)
    1046:	fe042623          	sw	zero,-20(s0)
    104a:	fa843503          	ld	a0,-88(s0)
    104e:	00000097          	auipc	ra,0x0
    1052:	000080e7          	jalr	ra # 104e <ngetline+0x22>
    1056:	87aa                	mv	a5,a0
    1058:	fef403a3          	sb	a5,-25(s0)
    105c:	fa043783          	ld	a5,-96(s0)
    1060:	479c                	lw	a5,8(a5)
    1062:	fef42023          	sw	a5,-32(s0)

0000000000001066 <.L46>:
    1066:	fa843503          	ld	a0,-88(s0)
    106a:	00000097          	auipc	ra,0x0
    106e:	000080e7          	jalr	ra # 106a <.L46+0x4>
    1072:	87aa                	mv	a5,a0
    1074:	fef403a3          	sb	a5,-25(s0)
    1078:	fe744783          	lbu	a5,-25(s0)
    107c:	0ff7f793          	zext.b	a5,a5
    1080:	d3fd                	beqz	a5,1066 <.L46>
    1082:	fe744783          	lbu	a5,-25(s0)
    1086:	0ff7f713          	zext.b	a4,a5
    108a:	47a1                	li	a5,8
    108c:	02f71663          	bne	a4,a5,10b8 <.L36>
    1090:	fa043783          	ld	a5,-96(s0)
    1094:	4798                	lw	a4,8(a5)
    1096:	fe042783          	lw	a5,-32(s0)
    109a:	2781                	sext.w	a5,a5
    109c:	00e7de63          	bge	a5,a4,10b8 <.L36>
    10a0:	fa043503          	ld	a0,-96(s0)
    10a4:	00000097          	auipc	ra,0x0
    10a8:	000080e7          	jalr	ra # 10a4 <.L46+0x3e>
    10ac:	fec42783          	lw	a5,-20(s0)
    10b0:	37fd                	addw	a5,a5,-1
    10b2:	fef42623          	sw	a5,-20(s0)
    10b6:	aa91                	j	120a <.L35>

00000000000010b8 <.L36>:
    10b8:	fe744783          	lbu	a5,-25(s0)
    10bc:	0ff7f713          	zext.b	a4,a5
    10c0:	47cd                	li	a5,19
    10c2:	00f70963          	beq	a4,a5,10d4 <.L37>
    10c6:	fe744783          	lbu	a5,-25(s0)
    10ca:	0ff7f713          	zext.b	a4,a5
    10ce:	47d1                	li	a5,20
    10d0:	10f71863          	bne	a4,a5,11e0 <.L38>

00000000000010d4 <.L37>:
    10d4:	fa043783          	ld	a5,-96(s0)
    10d8:	4798                	lw	a4,8(a5)
    10da:	fe042783          	lw	a5,-32(s0)
    10de:	2781                	sext.w	a5,a5
    10e0:	12e7d563          	bge	a5,a4,120a <.L35>
    10e4:	fa043783          	ld	a5,-96(s0)
    10e8:	fcf43c23          	sd	a5,-40(s0)
    10ec:	fe744783          	lbu	a5,-25(s0)
    10f0:	fcf40ba3          	sb	a5,-41(s0)
    10f4:	fd744783          	lbu	a5,-41(s0)
    10f8:	0ff7f713          	zext.b	a4,a5
    10fc:	47c5                	li	a5,17
    10fe:	02f71763          	bne	a4,a5,112c <.L40>
    1102:	fd843783          	ld	a5,-40(s0)
    1106:	4798                	lw	a4,8(a5)
    1108:	fd843783          	ld	a5,-40(s0)
    110c:	4fdc                	lw	a5,28(a5)
    110e:	00f74f63          	blt	a4,a5,112c <.L40>
    1112:	fd843783          	ld	a5,-40(s0)
    1116:	4798                	lw	a4,8(a5)
    1118:	fd843783          	ld	a5,-40(s0)
    111c:	4fdc                	lw	a5,28(a5)
    111e:	40f707bb          	subw	a5,a4,a5
    1122:	0007871b          	sext.w	a4,a5
    1126:	fd843783          	ld	a5,-40(s0)
    112a:	c798                	sw	a4,8(a5)

000000000000112c <.L40>:
    112c:	fd744783          	lbu	a5,-41(s0)
    1130:	0ff7f713          	zext.b	a4,a5
    1134:	47c9                	li	a5,18
    1136:	02f71c63          	bne	a4,a5,116e <.L41>
    113a:	fd843783          	ld	a5,-40(s0)
    113e:	4798                	lw	a4,8(a5)
    1140:	fd843783          	ld	a5,-40(s0)
    1144:	4fdc                	lw	a5,28(a5)
    1146:	9fb9                	addw	a5,a5,a4
    1148:	0007871b          	sext.w	a4,a5
    114c:	fd843783          	ld	a5,-40(s0)
    1150:	4f9c                	lw	a5,24(a5)
    1152:	00f75e63          	bge	a4,a5,116e <.L41>
    1156:	fd843783          	ld	a5,-40(s0)
    115a:	4798                	lw	a4,8(a5)
    115c:	fd843783          	ld	a5,-40(s0)
    1160:	4fdc                	lw	a5,28(a5)
    1162:	9fb9                	addw	a5,a5,a4
    1164:	0007871b          	sext.w	a4,a5
    1168:	fd843783          	ld	a5,-40(s0)
    116c:	c798                	sw	a4,8(a5)

000000000000116e <.L41>:
    116e:	fd744783          	lbu	a5,-41(s0)
    1172:	0ff7f713          	zext.b	a4,a5
    1176:	47cd                	li	a5,19
    1178:	02f71663          	bne	a4,a5,11a4 <.L42>
    117c:	fd843783          	ld	a5,-40(s0)
    1180:	479c                	lw	a5,8(a5)
    1182:	2785                	addw	a5,a5,1
    1184:	0007871b          	sext.w	a4,a5
    1188:	fd843783          	ld	a5,-40(s0)
    118c:	4f9c                	lw	a5,24(a5)
    118e:	00f75b63          	bge	a4,a5,11a4 <.L42>
    1192:	fd843783          	ld	a5,-40(s0)
    1196:	479c                	lw	a5,8(a5)
    1198:	2785                	addw	a5,a5,1
    119a:	0007871b          	sext.w	a4,a5
    119e:	fd843783          	ld	a5,-40(s0)
    11a2:	c798                	sw	a4,8(a5)

00000000000011a4 <.L42>:
    11a4:	fd744783          	lbu	a5,-41(s0)
    11a8:	0ff7f713          	zext.b	a4,a5
    11ac:	47d1                	li	a5,20
    11ae:	02f71063          	bne	a4,a5,11ce <.L43>
    11b2:	fd843783          	ld	a5,-40(s0)
    11b6:	479c                	lw	a5,8(a5)
    11b8:	00f05b63          	blez	a5,11ce <.L43>
    11bc:	fd843783          	ld	a5,-40(s0)
    11c0:	479c                	lw	a5,8(a5)
    11c2:	37fd                	addw	a5,a5,-1
    11c4:	0007871b          	sext.w	a4,a5
    11c8:	fd843783          	ld	a5,-40(s0)
    11cc:	c798                	sw	a4,8(a5)

00000000000011ce <.L43>:
    11ce:	fd843783          	ld	a5,-40(s0)
    11d2:	6b9c                	ld	a5,16(a5)
    11d4:	fd843703          	ld	a4,-40(s0)
    11d8:	4718                	lw	a4,8(a4)
    11da:	c398                	sw	a4,0(a5)
    11dc:	0001                	nop
    11de:	a035                	j	120a <.L35>

00000000000011e0 <.L38>:
    11e0:	fe744783          	lbu	a5,-25(s0)
    11e4:	85be                	mv	a1,a5
    11e6:	fa043503          	ld	a0,-96(s0)
    11ea:	00000097          	auipc	ra,0x0
    11ee:	000080e7          	jalr	ra # 11ea <.L38+0xa>
    11f2:	fe744783          	lbu	a5,-25(s0)
    11f6:	0ff7f713          	zext.b	a4,a5
    11fa:	47a9                	li	a5,10
    11fc:	00f70863          	beq	a4,a5,120c <.L52>
    1200:	fec42783          	lw	a5,-20(s0)
    1204:	2785                	addw	a5,a5,1
    1206:	fef42623          	sw	a5,-20(s0)

000000000000120a <.L35>:
    120a:	bdb1                	j	1066 <.L46>

000000000000120c <.L52>:
    120c:	0001                	nop
    120e:	fa043503          	ld	a0,-96(s0)
    1212:	00000097          	auipc	ra,0x0
    1216:	000080e7          	jalr	ra # 1212 <.L52+0x6>
    121a:	fe042423          	sw	zero,-24(s0)
    121e:	a099                	j	1264 <.L47>

0000000000001220 <.L50>:
    1220:	fe042783          	lw	a5,-32(s0)
    1224:	873e                	mv	a4,a5
    1226:	fe842783          	lw	a5,-24(s0)
    122a:	9fb9                	addw	a5,a5,a4
    122c:	0007871b          	sext.w	a4,a5
    1230:	fe842783          	lw	a5,-24(s0)
    1234:	fb843683          	ld	a3,-72(s0)
    1238:	97b6                	add	a5,a5,a3
    123a:	fa043683          	ld	a3,-96(s0)
    123e:	fcd43423          	sd	a3,-56(s0)
    1242:	fce42223          	sw	a4,-60(s0)
    1246:	fc843703          	ld	a4,-56(s0)
    124a:	6314                	ld	a3,0(a4)
    124c:	fc442703          	lw	a4,-60(s0)
    1250:	9736                	add	a4,a4,a3
    1252:	00074703          	lbu	a4,0(a4)
    1256:	00e78023          	sb	a4,0(a5)
    125a:	fe842783          	lw	a5,-24(s0)
    125e:	2785                	addw	a5,a5,1
    1260:	fef42423          	sw	a5,-24(s0)

0000000000001264 <.L47>:
    1264:	fe842783          	lw	a5,-24(s0)
    1268:	873e                	mv	a4,a5
    126a:	fec42783          	lw	a5,-20(s0)
    126e:	2701                	sext.w	a4,a4
    1270:	2781                	sext.w	a5,a5
    1272:	00f75c63          	bge	a4,a5,128a <.L49>
    1276:	fb442783          	lw	a5,-76(s0)
    127a:	37fd                	addw	a5,a5,-1
    127c:	0007871b          	sext.w	a4,a5
    1280:	fe842783          	lw	a5,-24(s0)
    1284:	2781                	sext.w	a5,a5
    1286:	f8e7cde3          	blt	a5,a4,1220 <.L50>

000000000000128a <.L49>:
    128a:	fe842783          	lw	a5,-24(s0)
    128e:	fb843703          	ld	a4,-72(s0)
    1292:	97ba                	add	a5,a5,a4
    1294:	00078023          	sb	zero,0(a5)
    1298:	0001                	nop
    129a:	60e6                	ld	ra,88(sp)
    129c:	6446                	ld	s0,80(sp)
    129e:	6125                	add	sp,sp,96
    12a0:	8082                	ret

00000000000012a2 <kstrlen>:
    12a2:	7179                	add	sp,sp,-48
    12a4:	f422                	sd	s0,40(sp)
    12a6:	1800                	add	s0,sp,48
    12a8:	fca43c23          	sd	a0,-40(s0)
    12ac:	fe042623          	sw	zero,-20(s0)
    12b0:	a031                	j	12bc <.L2>

00000000000012b2 <.L3>:
    12b2:	fec42783          	lw	a5,-20(s0)
    12b6:	2785                	addw	a5,a5,1
    12b8:	fef42623          	sw	a5,-20(s0)

00000000000012bc <.L2>:
    12bc:	fec46783          	lwu	a5,-20(s0)
    12c0:	fd843703          	ld	a4,-40(s0)
    12c4:	97ba                	add	a5,a5,a4
    12c6:	0007c783          	lbu	a5,0(a5)
    12ca:	f7e5                	bnez	a5,12b2 <.L3>
    12cc:	fec42783          	lw	a5,-20(s0)
    12d0:	853e                	mv	a0,a5
    12d2:	7422                	ld	s0,40(sp)
    12d4:	6145                	add	sp,sp,48
    12d6:	8082                	ret

00000000000012d8 <umul>:
    12d8:	7179                	add	sp,sp,-48
    12da:	f422                	sd	s0,40(sp)
    12dc:	1800                	add	s0,sp,48
    12de:	87aa                	mv	a5,a0
    12e0:	872e                	mv	a4,a1
    12e2:	fcf42e23          	sw	a5,-36(s0)
    12e6:	87ba                	mv	a5,a4
    12e8:	fcf42c23          	sw	a5,-40(s0)
    12ec:	fe042623          	sw	zero,-20(s0)
    12f0:	a81d                	j	1326 <.L2>

00000000000012f2 <.L5>:
    12f2:	fd842783          	lw	a5,-40(s0)
    12f6:	8b85                	and	a5,a5,1
    12f8:	2781                	sext.w	a5,a5
    12fa:	c781                	beqz	a5,1302 <.L3>
    12fc:	fdc42783          	lw	a5,-36(s0)
    1300:	a011                	j	1304 <.L4>

0000000000001302 <.L3>:
    1302:	4781                	li	a5,0

0000000000001304 <.L4>:
    1304:	fec42703          	lw	a4,-20(s0)
    1308:	9fb9                	addw	a5,a5,a4
    130a:	fef42623          	sw	a5,-20(s0)
    130e:	fdc42783          	lw	a5,-36(s0)
    1312:	0017979b          	sllw	a5,a5,0x1
    1316:	fcf42e23          	sw	a5,-36(s0)
    131a:	fd842783          	lw	a5,-40(s0)
    131e:	0017d79b          	srlw	a5,a5,0x1
    1322:	fcf42c23          	sw	a5,-40(s0)

0000000000001326 <.L2>:
    1326:	fd842783          	lw	a5,-40(s0)
    132a:	2781                	sext.w	a5,a5
    132c:	f3f9                	bnez	a5,12f2 <.L5>
    132e:	fec42783          	lw	a5,-20(s0)
    1332:	853e                	mv	a0,a5
    1334:	7422                	ld	s0,40(sp)
    1336:	6145                	add	sp,sp,48
    1338:	8082                	ret

000000000000133a <udiv>:
    133a:	7139                	add	sp,sp,-64
    133c:	fc22                	sd	s0,56(sp)
    133e:	0080                	add	s0,sp,64
    1340:	87aa                	mv	a5,a0
    1342:	872e                	mv	a4,a1
    1344:	fcf42623          	sw	a5,-52(s0)
    1348:	87ba                	mv	a5,a4
    134a:	fcf42423          	sw	a5,-56(s0)
    134e:	fe042623          	sw	zero,-20(s0)
    1352:	800007b7          	lui	a5,0x80000
    1356:	fef42423          	sw	a5,-24(s0)
    135a:	fc846783          	lwu	a5,-56(s0)
    135e:	07fe                	sll	a5,a5,0x1f
    1360:	fef43023          	sd	a5,-32(s0)
    1364:	fcc46783          	lwu	a5,-52(s0)
    1368:	fcf43c23          	sd	a5,-40(s0)
    136c:	a091                	j	13b0 <.L8>

000000000000136e <.L10>:
    136e:	fd843703          	ld	a4,-40(s0)
    1372:	fe043783          	ld	a5,-32(s0)
    1376:	02f76263          	bltu	a4,a5,139a <.L9>
    137a:	fd843703          	ld	a4,-40(s0)
    137e:	fe043783          	ld	a5,-32(s0)
    1382:	40f707b3          	sub	a5,a4,a5
    1386:	fcf43c23          	sd	a5,-40(s0)
    138a:	fec42783          	lw	a5,-20(s0)
    138e:	873e                	mv	a4,a5
    1390:	fe842783          	lw	a5,-24(s0)
    1394:	9fb9                	addw	a5,a5,a4
    1396:	fef42623          	sw	a5,-20(s0)

000000000000139a <.L9>:
    139a:	fe043783          	ld	a5,-32(s0)
    139e:	8385                	srl	a5,a5,0x1
    13a0:	fef43023          	sd	a5,-32(s0)
    13a4:	fe842783          	lw	a5,-24(s0)
    13a8:	0017d79b          	srlw	a5,a5,0x1
    13ac:	fef42423          	sw	a5,-24(s0)

00000000000013b0 <.L8>:
    13b0:	fe842783          	lw	a5,-24(s0)
    13b4:	2781                	sext.w	a5,a5
    13b6:	ffc5                	bnez	a5,136e <.L10>
    13b8:	fec42783          	lw	a5,-20(s0)
    13bc:	853e                	mv	a0,a5
    13be:	7462                	ld	s0,56(sp)
    13c0:	6121                	add	sp,sp,64
    13c2:	8082                	ret

00000000000013c4 <umod>:
    13c4:	7139                	add	sp,sp,-64
    13c6:	fc22                	sd	s0,56(sp)
    13c8:	0080                	add	s0,sp,64
    13ca:	87aa                	mv	a5,a0
    13cc:	872e                	mv	a4,a1
    13ce:	fcf42623          	sw	a5,-52(s0)
    13d2:	87ba                	mv	a5,a4
    13d4:	fcf42423          	sw	a5,-56(s0)
    13d8:	fc842783          	lw	a5,-56(s0)
    13dc:	2781                	sext.w	a5,a5
    13de:	e399                	bnez	a5,13e4 <.L13>
    13e0:	57fd                	li	a5,-1
    13e2:	a88d                	j	1454 <.L14>

00000000000013e4 <.L13>:
    13e4:	fe042623          	sw	zero,-20(s0)
    13e8:	800007b7          	lui	a5,0x80000
    13ec:	fef42423          	sw	a5,-24(s0)
    13f0:	fc846783          	lwu	a5,-56(s0)
    13f4:	07fe                	sll	a5,a5,0x1f
    13f6:	fef43023          	sd	a5,-32(s0)
    13fa:	fcc46783          	lwu	a5,-52(s0)
    13fe:	fcf43c23          	sd	a5,-40(s0)
    1402:	a091                	j	1446 <.L15>

0000000000001404 <.L17>:
    1404:	fd843703          	ld	a4,-40(s0)
    1408:	fe043783          	ld	a5,-32(s0)
    140c:	02f76263          	bltu	a4,a5,1430 <.L16>
    1410:	fd843703          	ld	a4,-40(s0)
    1414:	fe043783          	ld	a5,-32(s0)
    1418:	40f707b3          	sub	a5,a4,a5
    141c:	fcf43c23          	sd	a5,-40(s0)
    1420:	fec42783          	lw	a5,-20(s0)
    1424:	873e                	mv	a4,a5
    1426:	fe842783          	lw	a5,-24(s0)
    142a:	9fb9                	addw	a5,a5,a4
    142c:	fef42623          	sw	a5,-20(s0)

0000000000001430 <.L16>:
    1430:	fe043783          	ld	a5,-32(s0)
    1434:	8385                	srl	a5,a5,0x1
    1436:	fef43023          	sd	a5,-32(s0)
    143a:	fe842783          	lw	a5,-24(s0)
    143e:	0017d79b          	srlw	a5,a5,0x1
    1442:	fef42423          	sw	a5,-24(s0)

0000000000001446 <.L15>:
    1446:	fe842783          	lw	a5,-24(s0)
    144a:	2781                	sext.w	a5,a5
    144c:	ffc5                	bnez	a5,1404 <.L17>
    144e:	fd843783          	ld	a5,-40(s0)
    1452:	2781                	sext.w	a5,a5

0000000000001454 <.L14>:
    1454:	853e                	mv	a0,a5
    1456:	7462                	ld	s0,56(sp)
    1458:	6121                	add	sp,sp,64
    145a:	8082                	ret

Disassembly of section .rodata:

0000000000000000 <.LC0>:
   0:	1059                	c.nop	-10
   2:	a000                	fsd	fs0,0(s0)
   4:	0000                	unimp
	...

Disassembly of section .data:

0000000000000000 <con0>:
   0:	0000                	unimp
   2:	a000                	fsd	fs0,0(s0)
	...
  10:	0fff a000 0000 0000 	.insn	10, 0x096000000000a0000fff
  18:	0960 
  1a:	0000                	unimp
  1c:	0050                	add	a2,sp,4
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	4700                	lw	s0,8(a4)
   2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
   6:	6728                	ld	a0,72(a4)
   8:	31393863          	.insn	4, 0x31393863
   c:	3864                	fld	fs1,240(s0)
   e:	6364                	ld	s1,192(a4)
  10:	2932                	fld	fs2,264(sp)
  12:	3120                	fld	fs0,96(a0)
  14:	2e322e33          	.insn	4, 0x2e322e33
  18:	0030                	add	a2,sp,8
  1a:	4700                	lw	s0,8(a4)
  1c:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  20:	6728                	ld	a0,72(a4)
  22:	31393863          	.insn	4, 0x31393863
  26:	3864                	fld	fs1,240(s0)
  28:	6364                	ld	s1,192(a4)
  2a:	2932                	fld	fs2,264(sp)
  2c:	3120                	fld	fs0,96(a0)
  2e:	2e322e33          	.insn	4, 0x2e322e33
  32:	0030                	add	a2,sp,8
  34:	4700                	lw	s0,8(a4)
  36:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  3a:	6728                	ld	a0,72(a4)
  3c:	31393863          	.insn	4, 0x31393863
  40:	3864                	fld	fs1,240(s0)
  42:	6364                	ld	s1,192(a4)
  44:	2932                	fld	fs2,264(sp)
  46:	3120                	fld	fs0,96(a0)
  48:	2e322e33          	.insn	4, 0x2e322e33
  4c:	0030                	add	a2,sp,8
  4e:	4700                	lw	s0,8(a4)
  50:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  54:	6728                	ld	a0,72(a4)
  56:	31393863          	.insn	4, 0x31393863
  5a:	3864                	fld	fs1,240(s0)
  5c:	6364                	ld	s1,192(a4)
  5e:	2932                	fld	fs2,264(sp)
  60:	3120                	fld	fs0,96(a0)
  62:	2e322e33          	.insn	4, 0x2e322e33
  66:	0030                	add	a2,sp,8
  68:	4700                	lw	s0,8(a4)
  6a:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  6e:	6728                	ld	a0,72(a4)
  70:	31393863          	.insn	4, 0x31393863
  74:	3864                	fld	fs1,240(s0)
  76:	6364                	ld	s1,192(a4)
  78:	2932                	fld	fs2,264(sp)
  7a:	3120                	fld	fs0,96(a0)
  7c:	2e322e33          	.insn	4, 0x2e322e33
  80:	0030                	add	a2,sp,8
  82:	4700                	lw	s0,8(a4)
  84:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  88:	6728                	ld	a0,72(a4)
  8a:	31393863          	.insn	4, 0x31393863
  8e:	3864                	fld	fs1,240(s0)
  90:	6364                	ld	s1,192(a4)
  92:	2932                	fld	fs2,264(sp)
  94:	3120                	fld	fs0,96(a0)
  96:	2e322e33          	.insn	4, 0x2e322e33
  9a:	0030                	add	a2,sp,8
  9c:	4700                	lw	s0,8(a4)
  9e:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  a2:	6728                	ld	a0,72(a4)
  a4:	31393863          	.insn	4, 0x31393863
  a8:	3864                	fld	fs1,240(s0)
  aa:	6364                	ld	s1,192(a4)
  ac:	2932                	fld	fs2,264(sp)
  ae:	3120                	fld	fs0,96(a0)
  b0:	2e322e33          	.insn	4, 0x2e322e33
  b4:	0030                	add	a2,sp,8
  b6:	4700                	lw	s0,8(a4)
  b8:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  bc:	6728                	ld	a0,72(a4)
  be:	31393863          	.insn	4, 0x31393863
  c2:	3864                	fld	fs1,240(s0)
  c4:	6364                	ld	s1,192(a4)
  c6:	2932                	fld	fs2,264(sp)
  c8:	3120                	fld	fs0,96(a0)
  ca:	2e322e33          	.insn	4, 0x2e322e33
  ce:	0030                	add	a2,sp,8
  d0:	4700                	lw	s0,8(a4)
  d2:	203a4343          	fmadd.s	ft6,fs4,ft3,ft4,rmm
  d6:	6728                	ld	a0,72(a4)
  d8:	31393863          	.insn	4, 0x31393863
  dc:	3864                	fld	fs1,240(s0)
  de:	6364                	ld	s1,192(a4)
  e0:	2932                	fld	fs2,264(sp)
  e2:	3120                	fld	fs0,96(a0)
  e4:	2e322e33          	.insn	4, 0x2e322e33
  e8:	0030                	add	a2,sp,8

Disassembly of section .riscv.attributes:

0000000000000000 <.riscv.attributes>:
   0:	4641                	li	a2,16
   2:	0000                	unimp
   4:	7200                	ld	s0,32(a2)
   6:	7369                	lui	t1,0xffffa
   8:	01007663          	bgeu	zero,a6,14 <.riscv.attributes+0x14>
   c:	003c                	add	a5,sp,8
   e:	0000                	unimp
  10:	1004                	add	s1,sp,32
  12:	7205                	lui	tp,0xfffe1
  14:	3676                	fld	fa2,376(sp)
  16:	6934                	ld	a3,80(a0)
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	li	t5,-20
  1c:	326d                	addw	tp,tp,-5 # fffffffffffe0ffb <.L14+0xfffffffffffdfba7>
  1e:	3070                	fld	fa2,224(s0)
  20:	615f 7032 5f31      	.insn	6, 0x5f317032615f
  26:	3266                	fld	ft4,120(sp)
  28:	3270                	fld	fa2,224(a2)
  2a:	645f 7032 5f32      	.insn	6, 0x5f327032645f
  30:	30703263          	.insn	4, 0x30703263
  34:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  3a:	7032                	.insn	2, 0x7032
  3c:	5f30                	lw	a2,120(a4)
  3e:	6d7a                	ld	s10,408(sp)
  40:	756d                	lui	a0,0xffffb
  42:	316c                	fld	fa1,224(a0)
  44:	3070                	fld	fa2,224(s0)
	...
