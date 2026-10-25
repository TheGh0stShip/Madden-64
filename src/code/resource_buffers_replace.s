.text
.align 2
.set noreorder
.globl resource_buffers_replace
.ent resource_buffers_replace
resource_buffers_replace:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $ra,0x20($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $s2,8($s3)
    lw $v0,0($s2)
    beqz $v0,.Lreleased
     move $s0,$a1
    lw $a1,0x20($s2)
    jal func_80032F3C
     move $a0,$zero
    lw $a1,0x2c($s2)
    jal func_80032F3C
     move $a0,$zero
    sw $zero,0x20($s2)
    sw $zero,0x2c($s2)
.Lreleased:
    beqz $s0,.Lrefresh
     sw $s0,0($s2)
    lw $s0,0($s0)
    move $a0,$zero
    move $s1,$s0
    addiu $s0,$s0,1
    jal func_80032E00
     move $a1,$s0
    move $a0,$zero
    move $a1,$v0
    move $a2,$s0
    move $a3,$zero
    jal func_80033308
     sw $a1,0x20($s2)
    move $a0,$zero
    sll $s0,$s0,2
    jal func_80032E00
     move $a1,$s0
    move $a0,$zero
    move $a1,$v0
    move $a2,$s0
    move $a3,$zero
    jal func_80033308
     sw $a1,0x2c($s2)
    lw $v0,0x2c($s2)
    sw $s1,0($v0)
.Lrefresh:
    jal func_8001B314
     move $a0,$s3
.Ldone:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end resource_buffers_replace
