.text
.align 2
.set noreorder
.globl audio_runtime_shutdown
.ent audio_runtime_shutdown
audio_runtime_shutdown:
    lui $v1,0x8008
    lw $v1,0x5028($v1)
    addiu $sp,$sp,-0x28
    addiu $v0,$zero,1
    sw $ra,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    bne $v1,$v0,.Lskip_clear
     sw $s0,0x10($sp)
    jal func_80004B54
     addiu $s1,$zero,0x41
    addiu $v1,$zero,0x410
.Lclear_loop:
    lui $at,0x8008
    addu $at,$at,$v1
    sw $zero,0x7b70($at)
    addiu $v1,$v1,-0x10
    move $v0,$s1
    bnez $v0,.Lclear_loop
     addiu $s1,$s1,-1
.Lskip_clear:
    lui $a0,0x8008
    lhu $a0,0x5d42($a0)
    jal func_80035A7C
     addiu $s1,$zero,1
    lui $a0,0x8008
    lw $a0,-0x5ac8($a0)
    lui $s0,0x8008
    addiu $s0,$s0,0x4f64
    lui $s2,0x8009
    addiu $s2,$s2,-0x79f8
    jal func_8002FF70
     nop
.Lqueue_loop:
    lw $v0,0($s0)
    beqz $v0,.Lnext
     move $s3,$s1
    move $a0,$s2
    move $a1,$zero
    jal func_8004CDA8
     addiu $a2,$zero,1
    sw $zero,0($s0)
.Lnext:
    addiu $s0,$s0,-4
    addiu $s2,$s2,-0x18
    bnez $s3,.Lqueue_loop
     addiu $s1,$s1,-1
    lui $a1,0x8009
    lw $a1,-0x4cb8($a1)
    jal func_80032F3C
     move $a0,$zero
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_runtime_shutdown
