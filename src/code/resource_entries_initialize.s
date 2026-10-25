.text
.align 2
.set noreorder
.globl resource_entries_initialize
.ent resource_entries_initialize
resource_entries_initialize:
    addiu $sp,$sp,-0x28
    sw $s2,0x18($sp)
    move $s2,$a0
    sw $ra,0x24($sp)
    sw $s4,0x20($sp)
    sw $s3,0x1c($sp)
    sw $s1,0x14($sp)
    sw $s0,0x10($sp)
    lhu $v0,0($s2)
    beqz $v0,.Lfinish
     move $s1,$zero
    addiu $s4,$zero,2
    addiu $s3,$zero,0xff
    move $s0,$s2
.Lloop:
    lhu $a1,0($s0)
    jal func_80032E00
     move $a0,$zero
    sw $v0,4($s0)
    sw $s4,8($s0)
    sb $zero,0xc($s0)
    sb $s3,0xd($s0)
    sw $zero,0x10($s0)
    addiu $s0,$s0,0x14
    lhu $v0,0($s0)
    bnez $v0,.Lloop
     addiu $s1,$s1,1
.Lfinish:
    addiu $v0,$zero,1
    lui $at,0x8007
    sw $s2,0x24dc($at)
    lui $at,0x8007
    sb $s1,0x24da($at)
    lui $at,0x8007
    sb $v0,0x24db($at)
    lw $ra,0x24($sp)
    lw $s4,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end resource_entries_initialize
