.text
.align 2
.set noreorder
.globl object_duration_apply
.ent object_duration_apply
object_duration_apply:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    lw $v0,0x10($s0)
    xori $v1,$v0,0xcf
    sltu $v1,$zero,$v1
    xori $v0,$v0,0xcc
    sltu $v0,$zero,$v0
    and $v1,$v1,$v0
    beqz $v1,.Lclamp
     move $s1,$a1
    lw $v1,0($s0)
    addiu $v0,$zero,0x12
    sw $v0,0x14($v1)
    lw $v1,0($s0)
    lw $v0,0x10($s0)
    sw $v0,0x18($v1)
    lw $v0,0($s0)
    lw $v0,0($v0)
    jalr $v0
     nop
.Lclamp:
    blezl $s1,.Lpositive
     addiu $s1,$zero,1
.Lpositive:
    lw $v0,0x1b0($s0)
    lw $v0,0x14($v0)
    beqzl $v0,.Lcall
     sw $s1,0x98($s0)
    lw $v1,0x90($s0)
    slt $v0,$v1,$s1
    bnezl $v0,.Lstore
     move $s1,$v1
.Lstore:
    sw $s1,0x98($s0)
.Lcall:
    jal func_800548B8
     move $a0,$s0
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end object_duration_apply
