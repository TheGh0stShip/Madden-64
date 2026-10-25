.text
.align 2
.set noreorder
.globl resource_pool_reset_wait
.ent resource_pool_reset_wait
resource_pool_reset_wait:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    lui $s0,0x8009
    addiu $s0,$s0,-0x4c50
    sw $ra,0x14($sp)
.Linit:
    lui $at,0x8007
    sw $zero,0x2320($at)
    lui $a0,0x8009
    addiu $a0,$a0,-0x6c98
    move $a1,$zero
    jal func_8004CDA8
     addiu $a2,$zero,1
.Lwait:
    lui $a0,0x8009
    addiu $a0,$a0,-0x6c98
    move $a1,$zero
    jal func_8004CDA8
     move $a2,$zero
    beqz $v0,.Lwait
     nop
    lui $a0,0x8009
    addiu $a0,$a0,-0x4c50
    jal func_8004F31C
     nop
    addiu $a1,$zero,3
    addiu $a0,$s0,0x12
    addiu $v1,$zero,0x12
.Lclear:
    lui $at,0x8009
    addu $at,$at,$v1
    lbu $v0,-0x4c4c($at)
    beqz $v0,.Lnext
     move $a2,$a1
    sb $zero,3($a0)
    lui $at,0x8009
    addu $at,$at,$v1
    sb $zero,-0x4c4e($at)
    lui $at,0x8009
    addu $at,$at,$v1
    sh $zero,-0x4c50($at)
.Lnext:
    addiu $a0,$a0,-6
    addiu $v1,$v1,-6
    bnez $a2,.Lclear
     addiu $a1,$a1,-1
    j .Linit
     nop
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end resource_pool_reset_wait
