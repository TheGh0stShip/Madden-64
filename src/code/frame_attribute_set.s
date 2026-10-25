.text
.align 2
.set noreorder
.globl frame_attribute_set
.ent frame_attribute_set
frame_attribute_set:
    addiu $sp,$sp,-0x98
    sw $s2,0x88($sp)
    move $s2,$a1
    sw $s0,0x80($sp)
    andi $s0,$a0,0xffff
    move $a0,$s0
    sw $s3,0x8c($sp)
    move $s3,$a2
    sw $ra,0x90($sp)
    jal func_80028A58
     sw $s1,0x84($sp)
    move $a0,$s0
    andi $s0,$v0,0xffff
    jal func_8003A8CC
     addiu $a1,$sp,0x10
    move $s1,$zero
    sll $v0,$s0,3
    subu $v0,$v0,$s0
    sll $v0,$v0,3
    subu $s0,$v0,$s0
    addiu $v1,$sp,0x10
.Lloop:
    lhu $v0,0($v1)
    bnel $v0,$s2,.Lnext
     addiu $s1,$s1,1
    jal func_8003A368
     nop
    addu $v0,$v0,$s0
    addu $v0,$v0,$s1
    j .Ldone
     sb $s3,0($v0)
.Lnext:
    sltiu $v0,$s1,0x37
    bnez $v0,.Lloop
     addiu $v1,$v1,2
.Ldone:
    lw $ra,0x90($sp)
    lw $s3,0x8c($sp)
    lw $s2,0x88($sp)
    lw $s1,0x84($sp)
    lw $s0,0x80($sp)
    addiu $sp,$sp,0x98
    jr $ra
     nop
.end frame_attribute_set
