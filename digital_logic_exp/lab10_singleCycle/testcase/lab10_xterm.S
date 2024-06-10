	.file	"lab10_xterm.c"
	.option nopic
	.attribute arch, "rv32i2p1"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	j	main
	.text
	.align	2
	.type	write2LED, @function
write2LED:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,268759040
	sw	a5,-20(s0)
	lw	a4,-36(s0)
	lw	a5,-20(s0)
	sw	a4,0(a5)
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	write2LED, .-write2LED
	.align	2
	.type	umul, @function
umul:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	zero,-20(s0)
	j	.L3
.L6:
	lw	a5,-40(s0)
	andi	a5,a5,1
	beq	a5,zero,.L4
	lw	a5,-36(s0)
	j	.L5
.L4:
	li	a5,0
.L5:
	lw	a4,-20(s0)
	add	a5,a4,a5
	sw	a5,-20(s0)
	lw	a5,-36(s0)
	slli	a5,a5,1
	sw	a5,-36(s0)
	lw	a5,-40(s0)
	srli	a5,a5,1
	sw	a5,-40(s0)
.L3:
	lw	a5,-40(s0)
	bne	a5,zero,.L6
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	umul, .-umul
	.align	2
	.type	udiv, @function
udiv:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	sw	zero,-20(s0)
	li	a1,-2147483648
	sw	a1,-24(s0)
	lw	a1,-56(s0)
	mv	a2,a1
	li	a3,0
	srli	a1,a2,1
	slli	a0,a3,31
	or	a1,a0,a1
	sw	a1,-28(s0)
	slli	a3,a2,31
	sw	a3,-32(s0)
	lw	a3,-52(s0)
	sw	a3,-40(s0)
	sw	zero,-36(s0)
	j	.L9
.L12:
	lw	a2,-28(s0)
	lw	a3,-36(s0)
	bgtu	a2,a3,.L10
	lw	a2,-28(s0)
	lw	a3,-36(s0)
	bne	a2,a3,.L14
	lw	a2,-32(s0)
	lw	a3,-40(s0)
	bgtu	a2,a3,.L10
.L14:
	lw	a0,-40(s0)
	lw	a1,-36(s0)
	lw	a6,-32(s0)
	lw	a7,-28(s0)
	sub	a2,a0,a6
	mv	t1,a2
	sgtu	t1,t1,a0
	sub	a3,a1,a7
	sub	a1,a3,t1
	mv	a3,a1
	sw	a2,-40(s0)
	sw	a3,-36(s0)
	lw	a2,-20(s0)
	lw	a3,-24(s0)
	add	a3,a2,a3
	sw	a3,-20(s0)
.L10:
	lw	a3,-28(s0)
	slli	a3,a3,31
	lw	a2,-32(s0)
	srli	a4,a2,1
	or	a4,a3,a4
	lw	a3,-28(s0)
	srli	a5,a3,1
	sw	a4,-32(s0)
	sw	a5,-28(s0)
	lw	a3,-24(s0)
	srli	a3,a3,1
	sw	a3,-24(s0)
.L9:
	lw	a3,-24(s0)
	bne	a3,zero,.L12
	lw	a5,-20(s0)
	mv	a0,a5
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	udiv, .-udiv
	.align	2
	.type	umod, @function
umod:
	addi	sp,sp,-64
	sw	s0,60(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	sw	a1,-56(s0)
	lw	a1,-56(s0)
	bne	a1,zero,.L16
	li	a5,-1
	j	.L17
.L16:
	sw	zero,-20(s0)
	li	a1,-2147483648
	sw	a1,-24(s0)
	lw	a1,-56(s0)
	mv	a2,a1
	li	a3,0
	srli	a1,a2,1
	slli	a0,a3,31
	or	a1,a0,a1
	sw	a1,-28(s0)
	slli	a3,a2,31
	sw	a3,-32(s0)
	lw	a3,-52(s0)
	sw	a3,-40(s0)
	sw	zero,-36(s0)
	j	.L18
.L21:
	lw	a2,-28(s0)
	lw	a3,-36(s0)
	bgtu	a2,a3,.L19
	lw	a2,-28(s0)
	lw	a3,-36(s0)
	bne	a2,a3,.L22
	lw	a2,-32(s0)
	lw	a3,-40(s0)
	bgtu	a2,a3,.L19
.L22:
	lw	a0,-40(s0)
	lw	a1,-36(s0)
	lw	a6,-32(s0)
	lw	a7,-28(s0)
	sub	a2,a0,a6
	mv	t1,a2
	sgtu	t1,t1,a0
	sub	a3,a1,a7
	sub	a1,a3,t1
	mv	a3,a1
	sw	a2,-40(s0)
	sw	a3,-36(s0)
	lw	a2,-20(s0)
	lw	a3,-24(s0)
	add	a3,a2,a3
	sw	a3,-20(s0)
.L19:
	lw	a3,-28(s0)
	slli	a3,a3,31
	lw	a2,-32(s0)
	srli	a4,a2,1
	or	a4,a3,a4
	lw	a3,-28(s0)
	srli	a5,a3,1
	sw	a4,-32(s0)
	sw	a5,-28(s0)
	lw	a3,-24(s0)
	srli	a3,a3,1
	sw	a3,-24(s0)
.L18:
	lw	a3,-24(s0)
	bne	a3,zero,.L21
	lw	a5,-40(s0)
.L17:
	mv	a0,a5
	lw	s0,60(sp)
	addi	sp,sp,64
	jr	ra
	.size	umod, .-umod
	.align	2
	.type	kb_getc, @function
kb_getc:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sb	zero,-17(s0)
	li	a5,-1
	sw	a5,-24(s0)
	sw	zero,-28(s0)
	j	.L24
.L27:
	lw	a4,-28(s0)
	li	a5,-1342177280
	add	a5,a4,a5
	lbu	a4,0(a5)
	lw	a3,-28(s0)
	li	a5,-1610608640
	add	a5,a3,a5
	lbu	a5,0(a5)
	beq	a4,a5,.L25
	lw	a4,-28(s0)
	li	a5,-1342177280
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L25
	lw	a4,-28(s0)
	li	a5,-1610608640
	add	a4,a4,a5
	lw	a3,-28(s0)
	li	a5,-1342177280
	add	a5,a3,a5
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	sw	a5,-24(s0)
	j	.L26
.L25:
	lw	a4,-28(s0)
	li	a5,-1610608640
	add	a4,a4,a5
	lw	a3,-28(s0)
	li	a5,-1342177280
	add	a5,a3,a5
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L24:
	lw	a4,-28(s0)
	li	a5,254
	ble	a4,a5,.L27
.L26:
	lw	a4,-24(s0)
	li	a5,-1
	beq	a4,a5,.L28
	li	a5,268759040
	lw	a4,-24(s0)
	sw	a4,0(a5)
	lw	a4,-24(s0)
	li	a5,102
	bne	a4,a5,.L29
	li	a5,8
	sb	a5,-17(s0)
.L29:
	lw	a4,-24(s0)
	li	a5,90
	bne	a4,a5,.L30
	li	a5,10
	sb	a5,-17(s0)
.L30:
	lw	a4,-24(s0)
	li	a5,118
	bne	a4,a5,.L31
	li	a5,27
	sb	a5,-17(s0)
.L31:
	lw	a4,-24(s0)
	li	a5,117
	bne	a4,a5,.L32
	li	a5,17
	sb	a5,-17(s0)
.L32:
	lw	a4,-24(s0)
	li	a5,114
	bne	a4,a5,.L33
	li	a5,18
	sb	a5,-17(s0)
.L33:
	lw	a4,-24(s0)
	li	a5,107
	bne	a4,a5,.L34
	li	a5,19
	sb	a5,-17(s0)
.L34:
	lw	a4,-24(s0)
	li	a5,116
	bne	a4,a5,.L35
	li	a5,20
	sb	a5,-17(s0)
.L35:
	lw	a4,-24(s0)
	li	a5,13
	bne	a4,a5,.L36
	li	a5,32
	sb	a5,-17(s0)
.L36:
	lw	a4,-24(s0)
	li	a5,14
	bne	a4,a5,.L37
	li	a5,96
	sb	a5,-17(s0)
.L37:
	lw	a4,-24(s0)
	li	a5,21
	bne	a4,a5,.L38
	li	a5,113
	sb	a5,-17(s0)
.L38:
	lw	a4,-24(s0)
	li	a5,22
	bne	a4,a5,.L39
	li	a5,49
	sb	a5,-17(s0)
.L39:
	lw	a4,-24(s0)
	li	a5,26
	bne	a4,a5,.L40
	li	a5,122
	sb	a5,-17(s0)
.L40:
	lw	a4,-24(s0)
	li	a5,27
	bne	a4,a5,.L41
	li	a5,115
	sb	a5,-17(s0)
.L41:
	lw	a4,-24(s0)
	li	a5,28
	bne	a4,a5,.L42
	li	a5,97
	sb	a5,-17(s0)
.L42:
	lw	a4,-24(s0)
	li	a5,29
	bne	a4,a5,.L43
	li	a5,119
	sb	a5,-17(s0)
.L43:
	lw	a4,-24(s0)
	li	a5,30
	bne	a4,a5,.L44
	li	a5,50
	sb	a5,-17(s0)
.L44:
	lw	a4,-24(s0)
	li	a5,33
	bne	a4,a5,.L45
	li	a5,99
	sb	a5,-17(s0)
.L45:
	lw	a4,-24(s0)
	li	a5,34
	bne	a4,a5,.L46
	li	a5,120
	sb	a5,-17(s0)
.L46:
	lw	a4,-24(s0)
	li	a5,35
	bne	a4,a5,.L47
	li	a5,100
	sb	a5,-17(s0)
.L47:
	lw	a4,-24(s0)
	li	a5,36
	bne	a4,a5,.L48
	li	a5,101
	sb	a5,-17(s0)
.L48:
	lw	a4,-24(s0)
	li	a5,37
	bne	a4,a5,.L49
	li	a5,52
	sb	a5,-17(s0)
.L49:
	lw	a4,-24(s0)
	li	a5,38
	bne	a4,a5,.L50
	li	a5,51
	sb	a5,-17(s0)
.L50:
	lw	a4,-24(s0)
	li	a5,41
	bne	a4,a5,.L51
	li	a5,32
	sb	a5,-17(s0)
.L51:
	lw	a4,-24(s0)
	li	a5,42
	bne	a4,a5,.L52
	li	a5,118
	sb	a5,-17(s0)
.L52:
	lw	a4,-24(s0)
	li	a5,43
	bne	a4,a5,.L53
	li	a5,102
	sb	a5,-17(s0)
.L53:
	lw	a4,-24(s0)
	li	a5,44
	bne	a4,a5,.L54
	li	a5,116
	sb	a5,-17(s0)
.L54:
	lw	a4,-24(s0)
	li	a5,45
	bne	a4,a5,.L55
	li	a5,114
	sb	a5,-17(s0)
.L55:
	lw	a4,-24(s0)
	li	a5,46
	bne	a4,a5,.L56
	li	a5,53
	sb	a5,-17(s0)
.L56:
	lw	a4,-24(s0)
	li	a5,49
	bne	a4,a5,.L57
	li	a5,110
	sb	a5,-17(s0)
.L57:
	lw	a4,-24(s0)
	li	a5,50
	bne	a4,a5,.L58
	li	a5,98
	sb	a5,-17(s0)
.L58:
	lw	a4,-24(s0)
	li	a5,51
	bne	a4,a5,.L59
	li	a5,104
	sb	a5,-17(s0)
.L59:
	lw	a4,-24(s0)
	li	a5,52
	bne	a4,a5,.L60
	li	a5,103
	sb	a5,-17(s0)
.L60:
	lw	a4,-24(s0)
	li	a5,53
	bne	a4,a5,.L61
	li	a5,121
	sb	a5,-17(s0)
.L61:
	lw	a4,-24(s0)
	li	a5,54
	bne	a4,a5,.L62
	li	a5,54
	sb	a5,-17(s0)
.L62:
	lw	a4,-24(s0)
	li	a5,58
	bne	a4,a5,.L63
	li	a5,109
	sb	a5,-17(s0)
.L63:
	lw	a4,-24(s0)
	li	a5,59
	bne	a4,a5,.L64
	li	a5,106
	sb	a5,-17(s0)
.L64:
	lw	a4,-24(s0)
	li	a5,60
	bne	a4,a5,.L65
	li	a5,117
	sb	a5,-17(s0)
.L65:
	lw	a4,-24(s0)
	li	a5,61
	bne	a4,a5,.L66
	li	a5,55
	sb	a5,-17(s0)
.L66:
	lw	a4,-24(s0)
	li	a5,62
	bne	a4,a5,.L67
	li	a5,56
	sb	a5,-17(s0)
.L67:
	lw	a4,-24(s0)
	li	a5,65
	bne	a4,a5,.L68
	li	a5,44
	sb	a5,-17(s0)
.L68:
	lw	a4,-24(s0)
	li	a5,66
	bne	a4,a5,.L69
	li	a5,107
	sb	a5,-17(s0)
.L69:
	lw	a4,-24(s0)
	li	a5,67
	bne	a4,a5,.L70
	li	a5,105
	sb	a5,-17(s0)
.L70:
	lw	a4,-24(s0)
	li	a5,68
	bne	a4,a5,.L71
	li	a5,111
	sb	a5,-17(s0)
.L71:
	lw	a4,-24(s0)
	li	a5,69
	bne	a4,a5,.L72
	li	a5,48
	sb	a5,-17(s0)
.L72:
	lw	a4,-24(s0)
	li	a5,70
	bne	a4,a5,.L73
	li	a5,57
	sb	a5,-17(s0)
.L73:
	lw	a4,-24(s0)
	li	a5,73
	bne	a4,a5,.L74
	li	a5,46
	sb	a5,-17(s0)
.L74:
	lw	a4,-24(s0)
	li	a5,74
	bne	a4,a5,.L75
	li	a5,47
	sb	a5,-17(s0)
.L75:
	lw	a4,-24(s0)
	li	a5,75
	bne	a4,a5,.L76
	li	a5,108
	sb	a5,-17(s0)
.L76:
	lw	a4,-24(s0)
	li	a5,76
	bne	a4,a5,.L77
	li	a5,58
	sb	a5,-17(s0)
.L77:
	lw	a4,-24(s0)
	li	a5,77
	bne	a4,a5,.L78
	li	a5,113
	sb	a5,-17(s0)
.L78:
	lw	a4,-24(s0)
	li	a5,78
	bne	a4,a5,.L79
	li	a5,45
	sb	a5,-17(s0)
.L79:
	lw	a4,-24(s0)
	li	a5,82
	bne	a4,a5,.L80
	li	a5,39
	sb	a5,-17(s0)
.L80:
	lw	a4,-24(s0)
	li	a5,84
	bne	a4,a5,.L81
	li	a5,91
	sb	a5,-17(s0)
.L81:
	lw	a4,-24(s0)
	li	a5,85
	bne	a4,a5,.L82
	li	a5,61
	sb	a5,-17(s0)
.L82:
	lw	a4,-24(s0)
	li	a5,91
	bne	a4,a5,.L83
	li	a5,93
	sb	a5,-17(s0)
.L83:
	lw	a4,-24(s0)
	li	a5,93
	bne	a4,a5,.L84
	li	a5,92
	sb	a5,-17(s0)
.L84:
	lw	a4,-24(s0)
	li	a5,102
	bne	a4,a5,.L85
	li	a5,8
	sb	a5,-17(s0)
.L85:
	lw	a4,-24(s0)
	li	a5,105
	bne	a4,a5,.L86
	li	a5,49
	sb	a5,-17(s0)
.L86:
	lw	a4,-24(s0)
	li	a5,108
	bne	a4,a5,.L87
	li	a5,55
	sb	a5,-17(s0)
.L87:
	lw	a4,-24(s0)
	li	a5,112
	bne	a4,a5,.L88
	li	a5,48
	sb	a5,-17(s0)
.L88:
	lw	a4,-24(s0)
	li	a5,113
	bne	a4,a5,.L89
	li	a5,46
	sb	a5,-17(s0)
.L89:
	lw	a4,-24(s0)
	li	a5,115
	bne	a4,a5,.L90
	li	a5,53
	sb	a5,-17(s0)
.L90:
	lw	a4,-24(s0)
	li	a5,121
	bne	a4,a5,.L91
	li	a5,43
	sb	a5,-17(s0)
.L91:
	lw	a4,-24(s0)
	li	a5,122
	bne	a4,a5,.L92
	li	a5,51
	sb	a5,-17(s0)
.L92:
	lw	a4,-24(s0)
	li	a5,123
	bne	a4,a5,.L93
	li	a5,44
	sb	a5,-17(s0)
.L93:
	lw	a4,-24(s0)
	li	a5,124
	bne	a4,a5,.L94
	li	a5,42
	sb	a5,-17(s0)
.L94:
	lw	a4,-24(s0)
	li	a5,125
	bne	a4,a5,.L28
	li	a5,57
	sb	a5,-17(s0)
.L28:
	li	a5,-1610608640
	addi	a5,a5,18
	lbu	a5,0(a5)
	bne	a5,zero,.L95
	li	a5,-1610608640
	addi	a5,a5,89
	lbu	a5,0(a5)
	beq	a5,zero,.L96
.L95:
	lbu	a4,-17(s0)
	li	a5,96
	bleu	a4,a5,.L97
	lbu	a4,-17(s0)
	li	a5,122
	bgtu	a4,a5,.L97
	lbu	a5,-17(s0)
	addi	a5,a5,-32
	sb	a5,-17(s0)
	j	.L96
.L97:
	lbu	a4,-17(s0)
	li	a5,49
	bne	a4,a5,.L98
	li	a5,33
	sb	a5,-17(s0)
	j	.L96
.L98:
	lbu	a4,-17(s0)
	li	a5,50
	bne	a4,a5,.L99
	li	a5,64
	sb	a5,-17(s0)
	j	.L96
.L99:
	lbu	a4,-17(s0)
	li	a5,51
	bne	a4,a5,.L100
	li	a5,35
	sb	a5,-17(s0)
	j	.L96
.L100:
	lbu	a4,-17(s0)
	li	a5,52
	bne	a4,a5,.L101
	li	a5,36
	sb	a5,-17(s0)
	j	.L96
.L101:
	lbu	a4,-17(s0)
	li	a5,53
	bne	a4,a5,.L102
	li	a5,37
	sb	a5,-17(s0)
	j	.L96
.L102:
	lbu	a4,-17(s0)
	li	a5,54
	bne	a4,a5,.L103
	li	a5,94
	sb	a5,-17(s0)
	j	.L96
.L103:
	lbu	a4,-17(s0)
	li	a5,55
	bne	a4,a5,.L104
	li	a5,38
	sb	a5,-17(s0)
	j	.L96
.L104:
	lbu	a4,-17(s0)
	li	a5,56
	bne	a4,a5,.L105
	li	a5,42
	sb	a5,-17(s0)
	j	.L96
.L105:
	lbu	a4,-17(s0)
	li	a5,57
	bne	a4,a5,.L106
	li	a5,40
	sb	a5,-17(s0)
	j	.L96
.L106:
	lbu	a4,-17(s0)
	li	a5,48
	bne	a4,a5,.L107
	li	a5,41
	sb	a5,-17(s0)
	j	.L96
.L107:
	lbu	a4,-17(s0)
	li	a5,91
	bne	a4,a5,.L108
	li	a5,123
	sb	a5,-17(s0)
	j	.L96
.L108:
	lbu	a4,-17(s0)
	li	a5,93
	bne	a4,a5,.L109
	li	a5,125
	sb	a5,-17(s0)
	j	.L96
.L109:
	lbu	a4,-17(s0)
	li	a5,44
	bne	a4,a5,.L110
	li	a5,60
	sb	a5,-17(s0)
	j	.L96
.L110:
	lbu	a4,-17(s0)
	li	a5,46
	bne	a4,a5,.L111
	li	a5,62
	sb	a5,-17(s0)
	j	.L96
.L111:
	lbu	a4,-17(s0)
	li	a5,47
	bne	a4,a5,.L112
	li	a5,63
	sb	a5,-17(s0)
	j	.L96
.L112:
	lbu	a4,-17(s0)
	li	a5,59
	bne	a4,a5,.L113
	li	a5,58
	sb	a5,-17(s0)
	j	.L96
.L113:
	lbu	a4,-17(s0)
	li	a5,61
	bne	a4,a5,.L114
	li	a5,43
	sb	a5,-17(s0)
	j	.L96
.L114:
	lbu	a4,-17(s0)
	li	a5,45
	bne	a4,a5,.L115
	li	a5,95
	sb	a5,-17(s0)
	j	.L96
.L115:
	lbu	a4,-17(s0)
	li	a5,96
	bne	a4,a5,.L116
	li	a5,126
	sb	a5,-17(s0)
	j	.L96
.L116:
	lbu	a4,-17(s0)
	li	a5,92
	bne	a4,a5,.L117
	li	a5,124
	sb	a5,-17(s0)
	j	.L96
.L117:
	lbu	a4,-17(s0)
	li	a5,39
	bne	a4,a5,.L96
	li	a5,34
	sb	a5,-17(s0)
.L96:
	lbu	a5,-17(s0)
	mv	a0,a5
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	kb_getc, .-kb_getc
	.align	2
	.type	console_clear, @function
console_clear:
	addi	sp,sp,-48
	sw	s0,44(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	sw	zero,4(a5)
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
	sw	zero,-20(s0)
	j	.L120
.L121:
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-20(s0)
	add	a5,a4,a5
	sb	zero,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L120:
	lw	a5,-36(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	blt	a4,a5,.L121
	nop
	nop
	lw	s0,44(sp)
	addi	sp,sp,48
	jr	ra
	.size	console_clear, .-console_clear
	.align	2
	.type	console_putc, @function
console_putc:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	mv	a5,a1
	sb	a5,-21(s0)
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,12(a5)
	bge	a4,a5,.L126
	lbu	a4,-21(s0)
	li	a5,10
	bne	a4,a5,.L124
	lw	a5,-20(s0)
	lw	a4,12(a5)
	lw	a5,-20(s0)
	lw	a5,4(a5)
	sub	a4,a4,a5
	lw	a5,-20(s0)
	lw	a5,16(a5)
	ble	a4,a5,.L124
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	add	a5,a4,a5
	mv	s1,a5
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	add	a5,a4,a5
	mv	a4,a5
	lw	a5,-20(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a5,a0
	sub	a5,s1,a5
	mv	a4,a5
	lw	a5,-20(s0)
	sw	a4,4(a5)
	j	.L125
.L124:
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	add	a5,a5,a4
	lbu	a4,-21(s0)
	sb	a4,0(a5)
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,1
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L125:
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
.L126:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	addi	sp,sp,32
	jr	ra
	.size	console_putc, .-console_putc
	.align	2
	.type	console_putc_at, @function
console_putc_at:
	addi	sp,sp,-32
	sw	s0,28(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	mv	a5,a1
	sw	a2,-28(s0)
	sb	a5,-21(s0)
	lw	a5,-20(s0)
	lw	a5,12(a5)
	lw	a4,-28(s0)
	bge	a4,a5,.L129
	lw	a5,-20(s0)
	lw	a4,0(a5)
	lw	a5,-28(s0)
	add	a5,a4,a5
	lbu	a4,-21(s0)
	sb	a4,0(a5)
.L129:
	nop
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
	.size	console_putc_at, .-console_putc_at
	.align	2
	.type	console_insert_char, @function
console_insert_char:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	mv	a5,a1
	sb	a5,-37(s0)
	lbu	a4,-37(s0)
	li	a5,10
	bne	a4,a5,.L131
	lbu	a5,-37(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc
	j	.L130
.L131:
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,12(a5)
	bge	a4,a5,.L130
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-20(s0)
	j	.L133
.L135:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L133:
	lw	a5,-36(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	bge	a4,a5,.L134
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-20(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L135
.L134:
	lw	a5,-36(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	bne	a4,a5,.L137
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	j	.L137
.L140:
	lw	a5,-36(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	bgt	a4,a5,.L138
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,-1
	add	a5,a4,a5
	lbu	a5,0(a5)
	j	.L139
.L138:
	li	a5,0
.L139:
	lw	a2,-20(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc_at
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
.L137:
	lw	a5,-36(s0)
	lw	a5,4(a5)
	lw	a4,-20(s0)
	bgt	a4,a5,.L140
	lbu	a5,-37(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc
.L130:
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	console_insert_char, .-console_insert_char
	.align	2
	.type	console_backspace, @function
console_backspace:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	lw	a5,4(a5)
	ble	a5,zero,.L147
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,-1
	lw	a5,-20(s0)
	sw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	add	a5,a5,a4
	lbu	a5,0(a5)
	bne	a5,zero,.L143
	j	.L144
.L146:
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,-1
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L144:
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	add	a5,a5,a4
	lbu	a5,0(a5)
	bne	a5,zero,.L145
	lw	a5,-20(s0)
	lw	a5,4(a5)
	mv	a4,a5
	lw	a5,-20(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a5,a0
	bne	a5,zero,.L146
.L145:
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	add	a5,a5,a4
	lbu	a5,0(a5)
	beq	a5,zero,.L143
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,1
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L143:
	lw	a5,-20(s0)
	lw	a5,0(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	add	a5,a5,a4
	sb	zero,0(a5)
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
.L147:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	console_backspace, .-console_backspace
	.align	2
	.type	console_moveptr, @function
console_moveptr:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a4,-24(s0)
	li	a5,17
	bne	a4,a5,.L149
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	blt	a4,a5,.L149
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	sub	a4,a4,a5
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L149:
	lw	a4,-24(s0)
	li	a5,18
	bne	a4,a5,.L150
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a3,12(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	sub	a5,a3,a5
	bge	a4,a5,.L150
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	add	a4,a4,a5
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L150:
	lw	a4,-24(s0)
	li	a5,19
	bne	a4,a5,.L151
	lw	a5,-20(s0)
	lw	a5,4(a5)
	mv	a4,a5
	lw	a5,-20(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a5,a0
	beq	a5,zero,.L151
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,-1
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L151:
	lw	a4,-24(s0)
	li	a5,20
	bne	a4,a5,.L152
	lw	a5,-20(s0)
	lw	a5,4(a5)
	mv	a4,a5
	lw	a5,-20(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a4,a0
	lw	a5,-20(s0)
	lw	a5,16(a5)
	addi	a5,a5,-1
	beq	a4,a5,.L152
	lw	a5,-20(s0)
	lw	a5,4(a5)
	addi	a4,a5,1
	lw	a5,-20(s0)
	sw	a4,4(a5)
.L152:
	lw	a5,-20(s0)
	lw	a5,8(a5)
	lw	a4,-20(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	console_moveptr, .-console_moveptr
	.align	2
	.type	console_backspace_inline, @function
console_backspace_inline:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,12(a5)
	bge	a4,a5,.L162
	lw	a5,-36(s0)
	lw	a5,4(a5)
	ble	a5,zero,.L162
	j	.L155
.L159:
	lw	a5,-36(s0)
	lw	a5,4(a5)
	addi	a4,a5,-1
	lw	a5,-36(s0)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-20(s0)
	j	.L156
.L157:
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	add	a5,a4,a5
	lbu	a5,0(a5)
	lw	a2,-20(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc_at
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L156:
	lw	a5,-20(s0)
	addi	a5,a5,1
	mv	a4,a5
	lw	a5,-36(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a5,a0
	bne	a5,zero,.L157
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
.L155:
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-36(s0)
	lw	a5,4(a5)
	addi	a5,a5,-1
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L158
	lw	a5,-36(s0)
	lw	a5,4(a5)
	bgt	a5,zero,.L159
.L158:
	lw	a5,-36(s0)
	lw	a5,4(a5)
	addi	a4,a5,-1
	lw	a5,-36(s0)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-24(s0)
	j	.L160
.L161:
	lw	a5,-36(s0)
	lw	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	add	a5,a4,a5
	lbu	a5,0(a5)
	lw	a2,-24(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc_at
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L160:
	lw	a5,-24(s0)
	addi	a5,a5,1
	mv	a4,a5
	lw	a5,-36(s0)
	lw	a5,16(a5)
	mv	a1,a5
	mv	a0,a4
	call	umod
	mv	a5,a0
	bne	a5,zero,.L161
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
.L162:
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	console_backspace_inline, .-console_backspace_inline
	.align	2
	.type	print_int, @function
print_int:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	lw	a5,-40(s0)
	beq	a5,zero,.L164
	li	a1,10
	lw	a0,-40(s0)
	call	udiv
	mv	a5,a0
	li	a2,0
	mv	a1,a5
	lw	a0,-36(s0)
	call	print_int
	sw	a0,-20(s0)
	li	a1,10
	lw	a0,-40(s0)
	call	umod
	mv	a5,a0
	andi	a5,a5,0xff
	addi	a5,a5,48
	andi	a5,a5,0xff
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc
	lw	a5,-20(s0)
	addi	a5,a5,1
	j	.L167
.L164:
	lw	a5,-44(s0)
	beq	a5,zero,.L166
	li	a1,48
	lw	a0,-36(s0)
	call	console_putc
.L166:
	li	a5,0
.L167:
	mv	a0,a5
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_int, .-print_int
	.align	2
	.type	console_nputline, @function
console_nputline:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	sw	a2,-44(s0)
	sw	zero,-20(s0)
	j	.L169
.L171:
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L169:
	lw	a5,-20(s0)
	lw	a4,-40(s0)
	add	a5,a4,a5
	lbu	a5,0(a5)
	beq	a5,zero,.L172
	lw	a4,-20(s0)
	lw	a5,-44(s0)
	blt	a4,a5,.L171
.L172:
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	console_nputline, .-console_nputline
	.align	2
	.type	console_rollUp, @function
console_rollUp:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-24(s0)
	sw	zero,-20(s0)
	j	.L174
.L177:
	lw	a5,-36(s0)
	lw	a4,16(a5)
	lw	a5,-20(s0)
	add	a4,a4,a5
	lw	a5,-36(s0)
	lw	a5,12(a5)
	bge	a4,a5,.L175
	lw	a5,-36(s0)
	lw	a5,0(a5)
	lw	a4,-36(s0)
	lw	a3,16(a4)
	lw	a4,-20(s0)
	add	a4,a3,a4
	add	a5,a5,a4
	lbu	a5,0(a5)
	j	.L176
.L175:
	li	a5,0
.L176:
	lw	a2,-20(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_putc_at
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L174:
	lw	a5,-36(s0)
	lw	a5,12(a5)
	lw	a4,-20(s0)
	blt	a4,a5,.L177
	lw	a5,-36(s0)
	lw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,16(a5)
	sub	a4,a4,a5
	lw	a5,-36(s0)
	sw	a4,4(a5)
	lw	a5,-36(s0)
	lw	a5,8(a5)
	lw	a4,-36(s0)
	lw	a4,4(a4)
	sw	a4,0(a5)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	console_rollUp, .-console_rollUp
	.align	2
	.type	getc, @function
getc:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	call	kb_getc
	mv	a5,a0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	getc, .-getc
	.align	2
	.type	console_autorollUp, @function
console_autorollUp:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	lw	a5,-20(s0)
	lw	a4,4(a5)
	lw	a5,-20(s0)
	lw	a3,12(a5)
	lw	a5,-20(s0)
	lw	a5,16(a5)
	sub	a5,a3,a5
	blt	a4,a5,.L182
	lw	a0,-20(s0)
	call	console_rollUp
.L182:
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	console_autorollUp, .-console_autorollUp
	.align	2
	.type	get_line, @function
get_line:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	zero,-20(s0)
	call	getc
	mv	a5,a0
	sb	a5,-25(s0)
	lw	a5,-36(s0)
	lw	a5,4(a5)
	sw	a5,-32(s0)
.L191:
	call	getc
	mv	a5,a0
	sb	a5,-25(s0)
	lbu	a5,-25(s0)
	beq	a5,zero,.L191
	lbu	a4,-25(s0)
	li	a5,8
	bne	a4,a5,.L185
	lw	a5,-36(s0)
	lw	a5,4(a5)
	lw	a4,-32(s0)
	bge	a4,a5,.L185
	lw	a0,-36(s0)
	call	console_backspace_inline
	lw	a5,-20(s0)
	addi	a5,a5,-1
	sw	a5,-20(s0)
	j	.L184
.L185:
	lbu	a4,-25(s0)
	li	a5,19
	beq	a4,a5,.L186
	lbu	a4,-25(s0)
	li	a5,20
	bne	a4,a5,.L187
.L186:
	lw	a5,-36(s0)
	lw	a5,4(a5)
	lw	a4,-32(s0)
	bge	a4,a5,.L184
	lbu	a5,-25(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_moveptr
	j	.L184
.L187:
	lbu	a5,-25(s0)
	mv	a1,a5
	lw	a0,-36(s0)
	call	console_insert_char
	lbu	a4,-25(s0)
	li	a5,10
	beq	a4,a5,.L195
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L184:
	j	.L191
.L195:
	nop
	lw	a0,-36(s0)
	call	console_autorollUp
	sw	zero,-24(s0)
	j	.L192
.L193:
	lw	a5,-36(s0)
	lw	a5,0(a5)
	lw	a3,-32(s0)
	lw	a4,-24(s0)
	add	a4,a3,a4
	add	a4,a5,a4
	lw	a3,-24(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a3,a5
	lbu	a4,0(a4)
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L192:
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	blt	a4,a5,.L193
	lw	a4,-20(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a4,a5
	sb	zero,0(a5)
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	get_line, .-get_line
	.align	2
	.type	hi, @function
hi:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	sw	a1,-40(s0)
	li	a2,100
	lw	a1,-40(s0)
	lw	a0,-36(s0)
	call	console_nputline
	li	a2,100
	li	a5,-1342177280
	addi	a1,a5,771
	lw	a0,-36(s0)
	call	console_nputline
	li	a1,32
	lw	a0,-36(s0)
	call	console_putc
	sw	zero,-20(s0)
	j	.L197
.L198:
	li	a1,33
	lw	a0,-36(s0)
	call	console_putc
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L197:
	lw	a4,-20(s0)
	li	a5,4
	ble	a4,a5,.L198
	li	a1,10
	lw	a0,-36(s0)
	call	console_putc
	lw	a0,-36(s0)
	call	console_autorollUp
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	hi, .-hi
	.align	2
	.type	print_time, @function
print_time:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	sw	a0,-36(s0)
	li	a5,-1610604544
	addi	a5,a5,-1280
	lw	a5,0(a5)
	sw	a5,-20(s0)
	li	a5,3600384
	addi	a1,a5,-384
	lw	a0,-20(s0)
	call	udiv
	sw	a0,-24(s0)
	li	a5,61440
	addi	a1,a5,-1440
	lw	a0,-20(s0)
	call	udiv
	sw	a0,-28(s0)
	li	a1,1000
	lw	a0,-20(s0)
	call	udiv
	sw	a0,-32(s0)
	li	a2,1
	lw	a1,-24(s0)
	lw	a0,-36(s0)
	call	print_int
	li	a1,58
	lw	a0,-36(s0)
	call	console_putc
	li	a2,1
	lw	a1,-28(s0)
	lw	a0,-36(s0)
	call	print_int
	li	a1,58
	lw	a0,-36(s0)
	call	console_putc
	li	a2,1
	lw	a1,-32(s0)
	lw	a0,-36(s0)
	call	print_int
	li	a1,10
	lw	a0,-36(s0)
	call	console_putc
	lw	a0,-36(s0)
	call	console_autorollUp
	nop
	lw	ra,44(sp)
	lw	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	print_time, .-print_time
	.align	2
	.type	fib, @function
fib:
	addi	sp,sp,-64
	sw	ra,60(sp)
	sw	s0,56(sp)
	addi	s0,sp,64
	sw	a0,-52(s0)
	li	a5,3
	sw	a5,-20(s0)
	j	.L201
.L202:
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
	li	a0,0
	call	write2LED
.L201:
	lw	a4,-20(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,47
	bleu	a4,a5,.L202
	lw	a4,-20(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a4,a5
	lbu	a4,0(a5)
	li	a5,57
	bgtu	a4,a5,.L202
	sw	zero,-24(s0)
	j	.L203
.L204:
	lw	a5,-24(s0)
	li	a1,10
	mv	a0,a5
	call	umul
	mv	a5,a0
	sw	a5,-24(s0)
	lw	a4,-20(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a4,a5
	lbu	a5,0(a5)
	addi	a5,a5,-48
	lw	a4,-24(s0)
	add	a5,a4,a5
	sw	a5,-24(s0)
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L203:
	lw	a4,-20(s0)
	li	a5,-1342177280
	addi	a5,a5,768
	add	a5,a4,a5
	lbu	a5,0(a5)
	bne	a5,zero,.L204
	li	a5,1
	sw	a5,-28(s0)
	li	a5,1
	sw	a5,-32(s0)
	lw	a0,-24(s0)
	call	write2LED
	lw	a4,-24(s0)
	li	a5,1
	bgt	a4,a5,.L205
	li	a1,48
	lw	a0,-52(s0)
	call	console_putc
	j	.L206
.L205:
	li	a1,49
	lw	a0,-52(s0)
	call	console_putc
	li	a1,10
	lw	a0,-52(s0)
	call	console_putc
	lw	a0,-52(s0)
	call	console_autorollUp
	li	a1,49
	lw	a0,-52(s0)
	call	console_putc
	li	a1,10
	lw	a0,-52(s0)
	call	console_putc
	lw	a0,-52(s0)
	call	console_autorollUp
	sw	zero,-36(s0)
	j	.L207
.L208:
	lw	a4,-28(s0)
	lw	a5,-32(s0)
	add	a5,a4,a5
	sw	a5,-40(s0)
	lw	a5,-28(s0)
	sw	a5,-32(s0)
	lw	a5,-40(s0)
	sw	a5,-28(s0)
	lw	a5,-40(s0)
	li	a2,1
	mv	a1,a5
	lw	a0,-52(s0)
	call	print_int
	li	a1,10
	lw	a0,-52(s0)
	call	console_putc
	lw	a0,-52(s0)
	call	console_autorollUp
	lw	a5,-36(s0)
	addi	a5,a5,1
	sw	a5,-36(s0)
.L207:
	lw	a5,-24(s0)
	addi	a5,a5,-2
	lw	a4,-36(s0)
	blt	a4,a5,.L208
.L206:
	li	a1,10
	lw	a0,-52(s0)
	call	console_putc
	lw	a0,-52(s0)
	call	console_autorollUp
	nop
	lw	ra,60(sp)
	lw	s0,56(sp)
	addi	sp,sp,64
	jr	ra
	.size	fib, .-fib
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sw	ra,44(sp)
	sw	s0,40(sp)
	addi	s0,sp,48
	li	a5,-1610612736
	sw	a5,-44(s0)
	sw	zero,-40(s0)
	li	a5,4096
	addi	a5,a5,-1696
	sw	a5,-32(s0)
	li	a5,80
	sw	a5,-28(s0)
	li	a5,-1610608640
	addi	a5,a5,-1
	sw	a5,-36(s0)
	li	a5,-1342177280
	addi	a5,a5,544
	sw	a5,-20(s0)
	lw	a5,-20(s0)
	li	a4,72
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,1
	li	a4,101
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,2
	li	a4,108
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,3
	li	a4,108
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,4
	li	a4,111
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,5
	li	a4,32
	sb	a4,0(a5)
	lw	a5,-20(s0)
	addi	a5,a5,6
	sb	zero,0(a5)
	li	a5,-1342177280
	addi	a5,a5,512
	sw	a5,-24(s0)
	lw	a5,-24(s0)
	li	a4,67
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,1
	li	a4,88
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,2
	li	a4,95
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,3
	li	a4,76
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,4
	li	a4,105
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,5
	li	a4,64
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,6
	li	a4,76
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,7
	li	a4,67
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,8
	li	a4,111
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,9
	li	a4,114
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,10
	li	a4,101
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,11
	li	a4,58
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,12
	li	a4,35
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,13
	li	a4,126
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,14
	li	a4,32
	sb	a4,0(a5)
	lw	a5,-24(s0)
	addi	a5,a5,15
	sb	zero,0(a5)
	addi	a5,s0,-44
	li	a2,100
	lw	a1,-24(s0)
	mv	a0,a5
	call	console_nputline
.L214:
	addi	a5,s0,-44
	mv	a0,a5
	call	get_line
	li	a5,-1342177280
	addi	a5,a5,768
	lbu	a4,0(a5)
	li	a5,104
	bne	a4,a5,.L210
	li	a5,-1342177280
	addi	a5,a5,769
	lbu	a4,0(a5)
	li	a5,105
	bne	a4,a5,.L210
	li	a5,-1342177280
	addi	a5,a5,770
	lbu	a4,0(a5)
	li	a5,32
	bne	a4,a5,.L210
	addi	a5,s0,-44
	lw	a1,-20(s0)
	mv	a0,a5
	call	hi
	j	.L211
.L210:
	li	a5,-1342177280
	addi	a5,a5,768
	lbu	a4,0(a5)
	li	a5,99
	bne	a4,a5,.L212
	li	a5,-1342177280
	addi	a5,a5,769
	lbu	a4,0(a5)
	li	a5,108
	bne	a4,a5,.L212
	li	a5,-1342177280
	addi	a5,a5,770
	lbu	a4,0(a5)
	li	a5,101
	bne	a4,a5,.L212
	li	a5,-1342177280
	addi	a5,a5,771
	lbu	a4,0(a5)
	li	a5,97
	bne	a4,a5,.L212
	li	a5,-1342177280
	addi	a5,a5,772
	lbu	a4,0(a5)
	li	a5,114
	bne	a4,a5,.L212
	li	a5,-1342177280
	addi	a5,a5,773
	lbu	a5,0(a5)
	bne	a5,zero,.L212
	addi	a5,s0,-44
	mv	a0,a5
	call	console_clear
	j	.L211
.L212:
	li	a5,-1342177280
	addi	a5,a5,768
	lbu	a4,0(a5)
	li	a5,116
	bne	a4,a5,.L213
	li	a5,-1342177280
	addi	a5,a5,769
	lbu	a4,0(a5)
	li	a5,105
	bne	a4,a5,.L213
	li	a5,-1342177280
	addi	a5,a5,770
	lbu	a4,0(a5)
	li	a5,109
	bne	a4,a5,.L213
	li	a5,-1342177280
	addi	a5,a5,771
	lbu	a4,0(a5)
	li	a5,101
	bne	a4,a5,.L213
	li	a5,-1342177280
	addi	a5,a5,772
	lbu	a5,0(a5)
	bne	a5,zero,.L213
	addi	a5,s0,-44
	mv	a0,a5
	call	print_time
	j	.L211
.L213:
	li	a5,-1342177280
	addi	a5,a5,768
	lbu	a4,0(a5)
	li	a5,102
	bne	a4,a5,.L211
	li	a5,-1342177280
	addi	a5,a5,769
	lbu	a4,0(a5)
	li	a5,105
	bne	a4,a5,.L211
	li	a5,-1342177280
	addi	a5,a5,770
	lbu	a4,0(a5)
	li	a5,98
	bne	a4,a5,.L211
	li	a5,-1342177280
	addi	a5,a5,771
	lbu	a4,0(a5)
	li	a5,32
	bne	a4,a5,.L211
	addi	a5,s0,-44
	mv	a0,a5
	call	fib
.L211:
	addi	a5,s0,-44
	li	a2,100
	lw	a1,-24(s0)
	mv	a0,a5
	call	console_nputline
	j	.L214
	.size	main, .-main
	.ident	"GCC: (gc891d8dc2) 13.2.0"
