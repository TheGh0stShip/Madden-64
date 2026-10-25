.text
.align 2
.set noreorder
.globl game_session_release
.ent game_session_release
game_session_release:
    addiu $sp,$sp,-0x20
    sw $s1,0x14($sp)
    move $s1,$a0
    sw $ra,0x18($sp)
    sw $s0,0x10($sp)
    lw $s0,0($s1)
    jal func_8000BE80
     nop
    sll $v0,$s0,1
    addu $v0,$v0,$s0
    sll $s0,$v0,4
    lui $at,0x8007
    addu $at,$at,$s0
    lw $v0,-0x5ac8($at)
    beqz $v0,.Lnext1
     nop
    jal func_800458F8
     nop
.Lnext1:
    lui $at,0x8007
    addu $at,$at,$s0
    lw $a0,-0x5acc($at)
    beqz $a0,.Lnext2
     nop
    jal func_8003D78C
     nop
.Lnext2:
    lui $at,0x8007
    addu $at,$at,$s0
    lh $v0,-0x5ac4($at)
    beqz $v0,.Lobjects
     nop
    jal func_8003CA4C
     nop
.Lobjects:
    lw $v0,4($s1)
    lw $a0,4($v0)
    lw $a1,8($v0)
    jal func_8000D998
     nop
    lw $v0,4($s1)
    lhu $a0,0xc($v0)
    jal func_80035A7C
     nop
    lw $v0,4($s1)
    lw $a0,0($v0)
    jal func_8000B7E4
     nop
    lw $a1,4($s1)
    jal func_80032F3C
     move $a0,$zero
    jal func_800334B8
     nop
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end game_session_release
