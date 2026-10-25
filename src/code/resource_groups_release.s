.text
.align 2
.set noreorder
.globl resource_groups_release
.ent resource_groups_release
resource_groups_release:
    addiu $sp,$sp,-0x20
    sw $ra,0x18($sp)
    sw $s1,0x14($sp)
    jal func_8000BE80
     sw $s0,0x10($sp)
    move $s1,$zero
    sll $v0,$s1,16
.Lloop:
    sra $v0,$v0,16
    sll $s0,$v0,5
    addu $s0,$s0,$v0
    sll $s0,$s0,2
    addu $s0,$s0,$v0
    sll $s0,$s0,2
    addu $s0,$s0,$v0
    sll $s0,$s0,2
    subu $s0,$s0,$v0
    sll $s0,$s0,2
    lui $at,0x8008
    addu $at,$at,$s0
    lw $a0,0x2dc8($at)
    jal func_8000DA98
     nop
    lui $at,0x8008
    addu $at,$at,$s0
    lw $a0,0x2dcc($at)
    jal func_8000DA98
     nop
    lui $at,0x8008
    addu $at,$at,$s0
    lw $a0,0x2dd0($at)
    jal func_8000DA98
     nop
    lui $at,0x8008
    addu $at,$at,$s0
    lw $a0,0x2dd4($at)
    jal func_8000DA98
     nop
    addiu $v0,$s1,1
    move $s1,$v0
    sll $v0,$v0,16
    sra $v0,$v0,16
    slti $v0,$v0,2
    bnez $v0,.Lloop
     sll $v0,$s1,16
    lw $ra,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end resource_groups_release
