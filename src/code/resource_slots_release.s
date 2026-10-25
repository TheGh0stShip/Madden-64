.text
.align 2
.set noreorder
.globl resource_slots_release
.ent resource_slots_release
resource_slots_release:
    addiu $sp,$sp,-0x28
    sw $s1,0x1c($sp)
    andi $s1,$a0,0xffff
    sll $v0,$s1,1
    sw $ra,0x24($sp)
    sw $s2,0x20($sp)
    sw $s0,0x18($sp)
    lui $at,0x8008
    addu $at,$at,$v0
    lhu $v0,0x5d30($at)
    lui $v1,%hi(D_80085D30)
    addiu $v1,$v1,%lo(D_80085D30)
    beqz $v0,.Ldone
     move $s2,$v1
    sll $s0,$s1,1
.Lloop:
    addu $s0,$s0,$s2
    lhu $v0,0($s0)
    sll $v1,$s1,10
    addiu $v0,$v0,-1
    sh $v0,0($s0)
    andi $v0,$v0,0xffff
    sll $v0,$v0,3
    addu $v0,$v0,$v1
    lui $at,0x8009
    addu $at,$at,$v0
    lh $a0,-0x5890($at)
    lui $at,0x8009
    addu $at,$at,$v0
    lw $a1,-0x588c($at)
    jal func_80032F3C
     nop
    lhu $v0,0($s0)
    bnez $v0,.Lloop
     sll $s0,$s1,1
.Ldone:
    lw $ra,0x24($sp)
    lw $s2,0x20($sp)
    lw $s1,0x1c($sp)
    lw $s0,0x18($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end resource_slots_release
