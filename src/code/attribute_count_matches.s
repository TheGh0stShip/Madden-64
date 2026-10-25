.text
.align 2
.set noreorder
.globl attribute_count_matches
.ent attribute_count_matches
attribute_count_matches:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $s1,0x14($sp)
    move $s1,$zero
    sw $s0,0x10($sp)
    move $s0,$zero
    sll $a1,$a1,16
    sw $s2,0x18($sp)
    sra $s2,$a1,16
    sw $ra,0x20($sp)
    andi $a0,$s3,0xffff
.Lloop:
    jal func_8003C6B4
     andi $a1,$s0,0xffff
    andi $v0,$v0,0xff
    beql $v0,$s2,.Lnext
     addiu $s1,$s1,1
.Lnext:
    addiu $s0,$s0,1
    andi $v0,$s0,0xffff
    sltiu $v0,$v0,11
    bnez $v0,.Lloop
     andi $a0,$s3,0xffff
    sll $v0,$s1,16
    sra $v0,$v0,16
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end attribute_count_matches
