.text
.align 2
.set noreorder
.globl display_surface_create
.ent display_surface_create
display_surface_create:
    addiu $sp,$sp,-0x20
    sw $s0,0x10($sp)
    move $s0,$a0
    lui $a0,0x8006
    lw $a0,0x4ba0($a0)
    sw $s1,0x14($sp)
    move $s1,$a1
    sw $ra,0x1c($sp)
    jal func_80033298
     sw $s2,0x18($sp)
    move $s2,$v0
    addiu $v0,$zero,0xc
    sh $s0,0x204($s2)
    sh $v0,0x206($s2)
    sw $zero,0x238($s2)
    lui $v1,0x8009
    lhu $v1,-0x4c2c($v1)
    addiu $v0,$zero,1
    sllv $a0,$v0,$s1
    sltiu $v0,$a0,0x101
    bnez $v0,.Lallocate
     sh $v1,4($s2)
    addiu $a0,$zero,0x100
.Lallocate:
    jal func_80008DF8
     nop
    sw $v0,0x23c($s2)
    jal func_8000CBA8
     move $a0,$s2
    move $a0,$zero
    addiu $a1,$s2,0x10
    addiu $a2,$zero,0x1e0
    jal func_80033308
     move $a3,$zero
    jal func_8000CCC8
     move $a0,$s2
    move $v0,$s2
    lw $ra,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x20
    jr $ra
     nop
.end display_surface_create
