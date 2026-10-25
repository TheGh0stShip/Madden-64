.text
.align 2
.set noreorder
.globl strided_rows_copy
.ent strided_rows_copy
strided_rows_copy:
    addiu $sp,$sp,-0x30
    lhu $v0,0x42($sp)
    andi $v1,$a2,0xffff
    mult $v0,$v1
    mflo $v0
    lhu $a2,0x46($sp)
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s2,0x18($sp)
    sw $s0,0x10($sp)
    addu $s0,$a1,$v0
    lhu $v0,0x4a($sp)
    move $s2,$zero
    andi $a3,$a3,0xffff
    sw $ra,0x28($sp)
    sw $s5,0x24($sp)
    sw $s4,0x20($sp)
    sw $s1,0x14($sp)
    beqz $v0,.Ldone
     addu $s0,$s0,$a3
    andi $s1,$a2,0xffff
    move $s5,$v1
    move $s4,$v0
.Lloop:
    move $a0,$s0
    move $a1,$s3
    jal func_8002E17C
     move $a2,$s1
    addu $s3,$s3,$s1
    addiu $s2,$s2,1
    andi $v0,$s2,0xffff
    sltu $v0,$v0,$s4
    bnez $v0,.Lloop
     addu $s0,$s0,$s5
.Ldone:
    lw $ra,0x28($sp)
    lw $s5,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x30
    jr $ra
     nop
.end strided_rows_copy
