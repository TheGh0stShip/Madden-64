.text
.align 2
.set noreorder
.globl resource_chunk_find
.ent resource_chunk_find
resource_chunk_find:
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a1
    sw $ra,0x20($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lw $v0,4($a0)
    addiu $s0,$a0,0xc
    addiu $v0,$v0,-0xc
    addu $s2,$a0,$v0
    sltu $v0,$s0,$s2
    beqz $v0,.Ldone
     move $s1,$zero
.Lloop:
    move $a0,$s0
.Lloop_after_a0:
    move $a1,$s3
    jal func_8002E108
     addiu $a2,$zero,4
    bnez $v0,.Lnext
     nop
    j .Ltest
     move $s1,$s0
.Lnext:
    lw $v0,4($s0)
    addu $s0,$s0,$v0
.Ltest:
    sltiu $v0,$s1,1
    sltu $v1,$s0,$s2
    and $v0,$v0,$v1
    bnez $v0,.Lloop_after_a0
     move $a0,$s0
.Ldone:
    move $v0,$s1
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end resource_chunk_find
