.text
.align 2
.set noreorder
.globl ui_range_apply_reverse
.ent ui_range_apply_reverse
ui_range_apply_reverse:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s1,0x14($sp)
    move $s1,$a1
    sw $s2,0x18($sp)
    move $s2,$a2
    sw $s0,0x10($sp)
    move $s0,$a3
    sltu $v0,$s1,$s2
    beqz $v0,.Lascending_check
     sw $ra,0x20($sp)
    move $v0,$s0
    beqz $v0,.Ldone
     addiu $s0,$s0,-1
.Ldescending_loop:
    move $a0,$s3
    move $a1,$s1
    jal func_8001EE1C
     move $a2,$s2
    addiu $s1,$s1,-1
    addiu $s2,$s2,-1
    move $v0,$s0
    bnez $v0,.Ldescending_loop
     addiu $s0,$s0,-1
    j .Ldone
     nop
.Lascending:
    move $a0,$s3
    move $a1,$s1
    jal func_8001EE1C
     move $a2,$s2
    addiu $s1,$s1,1
    addiu $s2,$s2,1
.Lascending_check:
    move $v0,$s0
    bnez $v0,.Lascending
     addiu $s0,$s0,-1
.Ldone:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end ui_range_apply_reverse
