.text
.align 2
.set noreorder
.globl grid_handles_build
.ent grid_handles_build
grid_handles_build:
    addiu $sp,$sp,-0x38
    sw $s0,0x28($sp)
    move $s0,$zero
    andi $a3,$a3,0xffff
    sll $v1,$a3,3
    subu $v1,$v1,$a3
    andi $a2,$a2,0xffff
    sll $v0,$a2,3
    subu $v0,$v0,$a2
    sll $v0,$v0,5
    lui $a2,0x8008
    addiu $a2,$a2,-0x5a98
    sll $a3,$v1,3
    addu $v0,$v0,$a2
    sw $s1,0x2c($sp)
    addu $s1,$a3,$v0
    sll $v1,$v1,1
    addu $a1,$a1,$v1
    sw $ra,0x30($sp)
    sh $a0,0x10($sp)
    sh $a1,0x12($sp)
    sw $zero,0x20($sp)
.Lloop:
    jal func_8000E558
     addiu $a0,$sp,0x10
    andi $v1,$s0,0xffff
    sll $v1,$v1,2
    addu $v1,$v1,$s1
    sw $v0,0($v1)
    lhu $v0,0x12($sp)
    addiu $s0,$s0,1
    addiu $v0,$v0,1
    sh $v0,0x12($sp)
    andi $v0,$s0,0xffff
    sltiu $v0,$v0,0xe
    bnez $v0,.Lloop
     nop
    lw $ra,0x30($sp)
    lw $s1,0x2c($sp)
    lw $s0,0x28($sp)
    addiu $sp,$sp,0x38
    jr $ra
     nop
.end grid_handles_build
