.text
.align 2
.set noreorder
.globl audio_slot_markers_reset
.ent audio_slot_markers_reset
audio_slot_markers_reset:
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    jal func_80040010
     nop
    move $a0,$zero
    ori $a1,$zero,0xffff
    addiu $a2,$zero,0x20
    sll $v0,$a0,16
.Lloop:
    sra $v1,$v0,14
    lui $at,0x8008
    addu $at,$at,$v1
    lhu $v0,0x2d84($at)
    beq $v0,$a1,.Lsecond
     sll $v0,$a0,16
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,0x2d87($at)
    andi $v0,$v0,0xe0
    bne $v0,$a2,.Lsecond
     sll $v0,$a0,16
    lui $at,0x8008
    addu $at,$at,$v1
    sh $a1,0x2d84($at)
.Lsecond:
    sra $v1,$v0,14
    lui $at,0x8008
    addu $at,$at,$v1
    lhu $v0,0x4ed0($at)
    beq $v0,$a1,.Lnext
     addiu $v0,$a0,1
    lui $at,0x8008
    addu $at,$at,$v1
    lbu $v0,0x4ed3($at)
    andi $v0,$v0,0xe0
    bne $v0,$a2,.Lnext
     addiu $v0,$a0,1
    lui $at,0x8008
    addu $at,$at,$v1
    sh $a1,0x4ed0($at)
.Lnext:
    move $a0,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,4
    bnez $v0,.Lloop
     sll $v0,$a0,16
.Ldone:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end audio_slot_markers_reset
