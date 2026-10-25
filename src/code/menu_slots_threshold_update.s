.text
.align 2
.set noreorder
.globl menu_slots_threshold_update
.ent menu_slots_threshold_update
menu_slots_threshold_update:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$zero
    sw $s2,0x18($sp)
    lui $s2,0x8008
    addiu $s2,$s2,0x5040
    sw $s1,0x14($sp)
    lui $s1,0xa
    sw $ra,0x1c($sp)
.Lloop:
    lui $v1,0x8009
    lh $v1,-0x7920($v1)
    sll $v0,$v1,1
    addu $v0,$v0,$v1
    sll $v0,$v0,2
    subu $v0,$v0,$v1
    sll $v0,$v0,3
    addu $v0,$v0,$s2
    andi $v1,$s0,0xffff
    sll $v1,$v1,2
    addu $v1,$v1,$v0
    lw $a1,0($v1)
    lw $v0,0x24($a1)
    lui $a2,0x8008
    lw $a2,0x4f34($a2)
    lw $v0,0x20($v0)
    addu $v1,$a2,$s1
    slt $v0,$v0,$v1
    beqz $v0,.Lnext
     addiu $a0,$zero,0xb
    jal func_8001FA68
     move $a3,$a2
.Lnext:
    addiu $s0,$s0,1
    andi $v0,$s0,0xffff
    sltiu $v0,$v0,0xb
    bnez $v0,.Lloop
     nop
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end menu_slots_threshold_update
