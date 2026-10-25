.text
.align 2
.set noreorder
.globl resource_offsets_relocate
.ent resource_offsets_relocate
resource_offsets_relocate:
    move $a2,$a0
    lw $v0,0xc($a2)
    lw $v1,0x14($a2)
    lw $a0,0x18($a2)
    lw $a1,0x1c($a2)
    addu $v0,$v0,$a2
    sw $v0,0xc($a2)
    lw $v0,0x10($a2)
    lw $a3,0xc($a2)
    addu $v1,$v1,$a2
    addu $a0,$a0,$a2
    addu $a1,$a1,$a2
    sw $v1,0x14($a2)
    sw $a0,0x18($a2)
    sw $a1,0x1c($a2)
    addu $v0,$v0,$a2
    sw $v0,0x10($a2)
    lw $v0,0($a3)
    addiu $sp,$sp,-8
    beqz $v0,.Ldone
     move $a0,$zero
    addiu $v1,$a3,8
.Lloop:
    lw $v0,0($v1)
    addu $v0,$v0,$a2
    sw $v0,0($v1)
    lw $v0,0xc($a2)
    lw $v0,0($v0)
    addiu $a0,$a0,1
    sltu $v0,$a0,$v0
    bnez $v0,.Lloop
     addiu $v1,$v1,8
.Ldone:
    move $v0,$a2
    addiu $sp,$sp,8
    jr $ra
     nop
.end resource_offsets_relocate
