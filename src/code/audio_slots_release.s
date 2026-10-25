.text
.align 2
.set noreorder
.globl audio_slots_release
.ent audio_slots_release
audio_slots_release:
    addiu $sp,$sp,-0x28
    sw $s0,0x10($sp)
    move $s0,$zero
    sw $s2,0x18($sp)
    ori $s2,$zero,0xffff
    sw $s1,0x14($sp)
    addiu $s1,$zero,0xe0
    sw $s3,0x1c($sp)
    lui $s3,0x8008
    addiu $s3,$s3,0x2d84
    sw $s4,0x20($sp)
    addiu $s4,$s3,0x214c
    sw $ra,0x24($sp)
.Lloop:
    sll $v0,$s0,16
.Lrepeat:
    sra $a0,$v0,14
    lui $at,0x8008
    addu $at,$at,$a0
    lhu $v0,0x2d84($at)
    beq $v0,$s2,.Lsecond
     sll $v0,$s0,16
    lui $at,0x8008
    addu $at,$at,$a0
    lbu $v0,0x2d87($at)
    bne $v0,$s1,.Lsecond
     sll $v0,$s0,16
    jal func_8003F230
     addu $a0,$a0,$s3
    sll $v0,$s0,16
.Lsecond:
    sra $a0,$v0,14
    lui $at,0x8008
    addu $at,$at,$a0
    lhu $v0,0x4ed0($at)
    beq $v0,$s2,.Lnext
     addiu $v0,$s0,1
    lui $at,0x8008
    addu $at,$at,$a0
    lbu $v0,0x4ed3($at)
    bne $v0,$s1,.Lnext
     addiu $v0,$s0,1
    jal func_8003F230
     addu $a0,$a0,$s4
    addiu $v0,$s0,1
.Lnext:
    move $s0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,4
    bnez $v0,.Lrepeat
     sll $v0,$s0,16
    lw $ra,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end audio_slots_release
