.text
.align 2
.set noreorder
.globl grid_row_handles_build
.ent grid_row_handles_build
grid_row_handles_build:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s1,0x14($sp)
    move $s1,$a1
    andi $a2,$a2,0xffff
    sll $v0,$a2,1
    addu $v0,$v0,$a2
    sll $v0,$v0,2
    subu $v0,$v0,$a2
    sll $v0,$v0,2
    andi $v1,$s1,0xffff
    sw $s0,0x10($sp)
    move $s0,$zero
    sw $ra,0x20($sp)
    sw $s2,0x18($sp)
    lui $at,0x8008
    addu $at,$at,$v0
    sw $v1,-0x56f0($at)
    lui $v1,0x8008
    addiu $v1,$v1,-0x5718
    addu $s2,$v0,$v1
    move $a1,$s1
.Lloop:
    addiu $s1,$s1,1
    andi $a0,$s3,0xffff
    jal func_80035D7C
     andi $a1,$a1,0xffff
    andi $v1,$s0,0xffff
    sll $v1,$v1,2
    addu $v1,$v1,$s2
    sw $v0,0($v1)
    addiu $s0,$s0,1
    andi $v0,$s0,0xffff
    sltiu $v0,$v0,8
    bnez $v0,.Lloop
     move $a1,$s1
.Ldone:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end grid_row_handles_build
