.text
.align 2
.set noreorder
.globl vector_slots_initialize
.ent vector_slots_initialize
vector_slots_initialize:
    addiu $sp,$sp,-0x30
    sw $s3,0x24($sp)
    move $s3,$a0
    move $a0,$zero
    lui $a1,0x8008
    addiu $a1,$a1,-0x7d00
    addiu $a2,$zero,0x118
    move $a3,$zero
    sw $ra,0x28($sp)
    sw $s2,0x20($sp)
    sw $s1,0x1c($sp)
    jal func_80033308
     sw $s0,0x18($sp)
    sll $v0,$s3,4
    subu $v0,$v0,$s3
    sll $v0,$v0,3
    lui $v1,0x8006
    addiu $v1,$v1,0x4bb8
    addu $s2,$v0,$v1
    jal func_8000DF34
     move $a0,$s2
    lw $v0,4($s2)
    beqz $v0,.Lfill_test
     move $s0,$zero
    addiu $s1,$zero,8
.Lactive:
    addu $a1,$s2,$s1
    addiu $a0,$a1,4
    andi $a2,$s0,0xff
    jal func_8000E0BC
     addiu $a3,$zero,1
    lw $v0,4($s2)
    addiu $s0,$s0,1
    sltu $v0,$s0,$v0
    bnez $v0,.Lactive
     addiu $s1,$s1,0x10
    j .Ltest
     sltiu $v0,$s0,7
.Lzero:
    move $a1,$zero
    andi $a2,$s0,0xff
    jal func_8000E0BC
     move $a3,$zero
    addiu $s0,$s0,1
.Lfill_test:
    sltiu $v0,$s0,7
.Ltest:
    bnez $v0,.Lzero
     move $a0,$zero
    lui $at,0x8006
    sw $s3,0x4bb0($at)
    lw $ra,0x28($sp)
    lw $s3,0x24($sp)
    lw $s2,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x30
    jr $ra
     nop
.end vector_slots_initialize
