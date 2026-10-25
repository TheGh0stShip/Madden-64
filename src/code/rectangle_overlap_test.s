.text
.align 2
.set noreorder
.globl rectangle_overlap_test
.ent rectangle_overlap_test
rectangle_overlap_test:
    addiu $sp,$sp,-0x28
    sw $s0,0x20($sp)
    move $s0,$a1
    addiu $a1,$sp,0x10
    sw $ra,0x24($sp)
    jal func_800431BC
     addiu $a2,$zero,1
    lh $a0,0($s0)
    lw $v1,0x10($sp)
    lh $v0,2($s0)
    addiu $a1,$sp,0x10
    slt $v0,$v0,$v1
    beqz $v0,.Lvertical
     slt $a0,$v1,$a0
    addiu $a0,$zero,1
.Lvertical:
    lh $v1,4($s0)
    lw $v0,4($a1)
    slt $v0,$v0,$v1
    beqz $v0,.Lbottom
     andi $a0,$a0,0xffff
    ori $a0,$a0,1
.Lbottom:
    lh $v0,6($s0)
    lw $v1,4($a1)
    slt $v0,$v0,$v1
    beqz $v0,.Lreturn
     andi $a0,$a0,0xffff
    ori $a0,$a0,1
.Lreturn:
    andi $v0,$a0,0xff
    lw $ra,0x24($sp)
    lw $s0,0x20($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end rectangle_overlap_test
